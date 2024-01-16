package com.bid.common.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DocVO {
    private int docNo; // 문서 번호
    private String jobSeCode; // 업무 구분 코드
    private String docFileNm; // 문서 파일명
    private String docFileCours; // 문서 파일 경로
    private String docFileRealCours; // 문서 파일 실제 경로
    private Long docFileMg; // 문서 파일 크기
    private String deleteAt; // 삭제 여부
    private String deleteDt; // 삭제 일시
    private String frstRegisterId; // 최초 등록자 ID
    private String lastChangerId; // 최종 변경자 ID
}
