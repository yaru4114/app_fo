package com.bid.common.model;

import lombok.Data;

/**
 공통 코드 Vo
* @date : 2024-01-15
* @author  xyzp1539
**/
@Data
public class CoCmmnCdVO {
    private String mainCode;
    private String subCode;
    private String extrlSysMainCode;
    private String codeNm;
    private int codeLt;
    private int codeOrdr;
    private String codeDcone;
    private String codeDctwo;
    private String codeRefrnone;
    private String codeRefrntwo;
    private String codeRefrnthree;
    private String codeChrctrRefrnone;
    private String codeChrctrRefrntwo;
    private String codeChrctrRefrnthree;
    private String codeChrctrRefrnfour;
    private String codeChrctrRefrnfive;
    private String codeChrctrRefrnsix;
    private String codeNumberRefrnone;
    private String codeNumberRefrntwo;
    private String codeNumberRefrnthree;
    private String codeNumberRefrnfour;
    private String sysAt;
    private String extrlSysUseAt;
    private String useAt;
    private String extrlSysIntrlckAt;
    private String deleteAt;
    private String deleteDt;
    private String frstRegisterId;
    private String frstRegistDt;
    private String lastChangerId;
    private String lastChangeDt;
}
