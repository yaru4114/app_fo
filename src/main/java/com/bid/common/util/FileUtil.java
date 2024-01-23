package com.bid.common.util;

import com.bid.common.model.FileVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

@Slf4j
@Service
public class FileUtil {

    @Value("${spring.servlet.multipart.location}")
    private String SAVE_LOCATION;

    public FileVO upload(MultipartFile uploadFile, String folder, String uldFileName) {

        FileVO fileVO = new FileVO(SAVE_LOCATION, folder, uldFileName, uploadFile);
        
        // 경로 생성
        File Folder = new File(fileVO.getFOLDER_PATH());
        
        // 해당 경로 없을시 생성
        if (!Folder.exists()){
            try {
                Folder.mkdirs(); // 폴더 생성
                log.info("폴더 생성");
            } catch (Exception e) {
                e.getStackTrace();
            }
        }
        
        try {
            // 파일 저장
            Files.write(Paths.get(fileVO.getFULL_PATH()), uploadFile.getBytes());
        } catch (IOException e) {
            log.info("파일 저장 에러 : " + e);
        }

        return fileVO;
    }

    /**
     * @param file
     * @return "/파일 이름_System.currentTimeMillis()"
     */
    public String setTimestampedFileName (MultipartFile file) {

        String orgFileName = file.getOriginalFilename();

        return "\\" + orgFileName.substring(0, orgFileName.lastIndexOf(".")) + "_" + System.currentTimeMillis();
    }

    public void download(Map<String, String> requestData, HttpServletResponse response) throws  IOException {

        String fileName = requestData.get("filePath");
        String filePath = SAVE_LOCATION + fileName;

        File file = new File(filePath);
        InputStream inputStream =  new FileInputStream(file);

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", URLEncoder.encode("attachment; filename=\"" + fileName + "\""));
        
        // 파일의 데이터를 읽어 응답의 출력 스트림으로 복사
        IOUtils.copy(inputStream, response.getOutputStream());
        
        // 버퍼 제거 후 데이터를 클라이언트로 전송
        response.flushBuffer();
    }
}
