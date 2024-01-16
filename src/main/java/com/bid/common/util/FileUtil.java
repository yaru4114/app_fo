package com.bid.common.util;

import com.bid.common.model.FileVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

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
        String uldFileName = "/" + orgFileName.substring(0, orgFileName.lastIndexOf(".")) + "_" + System.currentTimeMillis();

        return uldFileName;
    }
}
