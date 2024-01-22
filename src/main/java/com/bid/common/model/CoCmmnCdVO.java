package com.bid.common.model;

import lombok.Data;

/**
 공통 코드 Vo
* @date : 2024-01-15
* @author  xyzp1539
**/
@Data
public class CoCmmnCdVO {
    private String mainCode;                    // 메인코드
    private String subCode;                     // 서브코드
    private int itmSn;                          // 아이템 상품 코드
    private String brandNm;                     // 브랜드명
    private String brandCode;                   // 브랜드코드
    private String itmCode;                     // 아이템 상품 코드
    private String itmPrdlstKorean;             // 아이템 상품명(한글)
    private String extrlSysMainCode;            // 외부시스템메인코드
    private String codeNm;                      // 코드명
    private int codeLt;                         // 코드길이
    private int codeOrdr;                       // 코드순서
    private String codeDcone;                   // 코드설명1
    private String codeDctwo;                   // 코드설명2
    private String codeRefrnone;                // 코드참조1
    private String codeRefrntwo;                // 코드참조2
    private String codeRefrnthree;              // 코드참조3
    private String codeChrctrRefrnone;          // 코드문자참조1
    private String codeChrctrRefrntwo;          // 코드문자참조2
    private String codeChrctrRefrnthree;        // 코드문자참조3
    private String codeChrctrRefrnfour;         // 코드문자참조4
    private String codeChrctrRefrnfive;         // 코드문자참조5
    private String codeChrctrRefrnsix;          // 코드문자참조6
    private String codeNumberRefrnone;          // 코드숫자참조1
    private String codeNumberRefrntwo;          // 코드숫자참조2
    private String codeNumberRefrnthree;        // 코드숫자참조3
    private String codeNumberRefrnfour;         // 코드숫자참조4
    private String sysAt;                       // 시스템여부
    private String extrlSysUseAt;               // 외부시스템사용여부
    private String useAt;                       // 사용여부
    private String extrlSysIntrlckAt;           // 외부시스템연동여부
    private String deleteAt;                    // 삭제여부
    private String deleteDt;                    // 삭제일시
    private String frstRegisterId;              // 최초등록자아이디
    private String frstRegistDt;                // 최초등록일시
    private String lastChangerId;               // 최종변경자아이디
    private String lastChangeDt;                // 최종변경일시
}
