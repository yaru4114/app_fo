package com.bid.bo.bid.vo;

import java.math.BigDecimal;
import java.util.List;
import lombok.Data;

@Data
public class BidNoticeVO {
    private String bidPblancId;
    private String metalCode;
    private String brandGroupCode;
    private String brandCode;
    private String itmSn;
    private String dstrctLclsfCode;
    private String bidWt;
    private String permWtRate1;
    private BigDecimal permWtRate;
    private String permWtRateP;
    private String delyCnd01ApplcAt;
    private String delyCnd01StdrPc;
    private String delyCnd01PremiumPc;
    private String delyCnd02ApplcAt;
    private String delyCnd02StdrPc;
    private String delyCnd02PremiumPc;
    private String delyCnd03ApplcAt;
    private String delyCnd03StdrPc;
    private String delyCnd03PremiumPc;
    private String delyBeginDe;
    private String delyEndDe;
    private String delyPdCn;
    private String pcAppnBeginDe;
    private String pcAppnEndDe;
    private String pcAppnMthCode;
    private String setleCrncyCode;
    private String setleMthCode;
    private String setlePdCode;
    private String etcCn;
    private String bddprBeginDt;
    private String bddprEndDt;
    private String bddprCanclPossAt;
    private String bddprCanclLmttDe;
    private String bidSttusCode;
    private String partcptnEntrpsQy;
    private String intrstEntrpsQy;
    private String dspyAt;
    private String pblancCanclAt;
    private String opengDt;
    private String deleteAt;
    private String deleteDt;
    private String frstRegisterId;
    private String frstRegistDt;
    private String lastChangerId;
    private String lastChangeDt;
    private String delyCndSb;
    private String delyCndCode;
    private String premiumPcSb;
    private String premiumPcCode;
    private String pcAppnPdSb;
    private String pcAppnMthSb;
    private String itmPrdlstKorean;
    private String itmQty;
    private String activeAt;
    private String bidStatNm;
    private String stepNm;
    private String bdngCmpny;
    private String lwstPrprc;
    private String bddprBeginDtInfo;
    private String bddprEndDtInfo;
    private String bddprDate;
    private String frstRegist;
    private String canclResn;
    private String failBidResn;
    private String failBidDt;
    private String pblancCanclDt;


    // 입찰상태별 공고수
    private int bdngAllCnt;       // 전체
    private int bdngSchdlCnt;     // 입찰예정
    private int bdngPrgrsCnt;     // 투찰중
    private int bdngDdlnCnt;      // 마감
    private int bdngClcntCnt;     // 공고취소
    private int bdngWtngCnt;      // 공고대기
    private int bdngSucsCnt;      // 공고낙찰
    private int bdngPstpnCnt;     // 공고유찰

    private String startDate;
    private String endDate;

    private List<BidNoticeUpdtVO> bidNoticeUpdtVoList;
    private List<BidBddprDtlVO> bidBddprDtlVoList;

    private String bidUpdtCn;
    private String bidUpdtResn;

    private String subCode;
}
