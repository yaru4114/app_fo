package com.bid.common.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class FileVO {

    /** 기본 저장 경로 */
    private String ROOT;

    /** 기본 저장 경로 + 폴더 + 파일 이름 + 확장자 */
    private String FULL_PATH;

    /** 기본 저장 경로 + 폴더 */
    private String FOLDER_PATH;

    /** 폴더 + 파일 이름 + 확장자 */
    private String FILE_PATH;

    /** 선택한 실제 파일명 */
    private String ORI_FILE_NAME;

    /** 저장될 파일명 (파일 이름 + 확장자) */
    private String ULD_FILE_NAME;

    /** 파일 확장자 */
    private String FILE_EXT;

    /** 파일 사이즈 */
    private Long FILE_SIZE;

    /** 실제 파일 */
    private MultipartFile FILE;

    /**
     * @param root 기본 저장 위치 (NAS 위치)
     * @param folder 하위 폴더
     * @param fileName(파일 이름) 저장할 파일 이름 (확장자 제외)
     * @param file (선택한 실제 파일)
     */
    public FileVO(String root, String folder, String fileName, MultipartFile file) {

        this.ORI_FILE_NAME = file.getOriginalFilename();
        this.FILE_EXT = this.ORI_FILE_NAME.substring(this.ORI_FILE_NAME.lastIndexOf("."));

        this.ULD_FILE_NAME = fileName + this.FILE_EXT;
        this.FILE_SIZE = file.getSize();
        this.FILE = file;

        this.ROOT = root;
        this.FULL_PATH = this.ROOT + folder + this.ULD_FILE_NAME;
        this.FOLDER_PATH = this.ROOT + folder;
        this.FILE_PATH = folder + this.ULD_FILE_NAME;
    }

}