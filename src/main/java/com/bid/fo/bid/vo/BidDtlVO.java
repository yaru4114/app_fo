package com.bid.fo.bid.vo;

import java.util.List;

import lombok.Data;

@Data
public class BidDtlVO {
	private String bidPblancId;
    private String bidEntrpsNo;
    private String metalCodeShort;
    private String dspyGoodsNm;
    private String dstrctLclsfCodeNm;
    private String brandGroupCodeNm;
    private String bidSttusCode;
    
    private int bidWt;
    private int permWtRate;
    
    private String delyCndCd;
    
    private String bddprAt;
    private String canclAt;
    
    private String delyCnd01ApplcAt;
    private int delyCnd01StdrPc;
    private int delyCnd01PremiumPc;
    
    private String delyCnd02ApplcAt;
    private int delyCnd02PremiumPc;
    private int delyCnd02StdrPc;

    private String delyCnd03ApplcAt;
    private int delyCnd03StdrPc;
    private int delyCnd03PremiumPc;

    private int cnvrsPremiumAmount;
    private int bddprPremiumPc;
    private int bddprFinalAmount;
    
    private String delyBeginDe;
    private String delyEndDe;
    
    private String pcAppnBeginDe;
    private String pcAppnEndDe;
    private String pcAppnMthCodeNm;
    
    private String setleCrncyCodeNm;
    private String setleMthCodeNm;
    private String setlePdCodeNm;
    
    private String etcCn;
    
    private String delyCndCode;
    private String delyCndCodeNm;
    private int delyCndStdrPc;
    
    private String bidSttusNotice;
    
    private String bidMberId;

	private String failBidResn;
	
	private String failBidDt;
	
	private String pblancCanclDt;
	
	private List<BddprEntrpsVO> bddprEntrpsList;

}
