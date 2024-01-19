package com.bid.bo.bid.service;

import com.bid.bo.bid.dao.BidNoticeDao;
import com.bid.bo.bid.vo.BidBddprDtlVO;
import com.bid.bo.bid.vo.BidNoticeUpdtVO;
import com.bid.bo.bid.vo.BidNoticeVO;
import com.bid.common.model.CoCmmnCdVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BidNoticeService{
    @Autowired
    BidNoticeDao bidNoticeDao;

    private static Logger log = LoggerFactory.getLogger(BidNoticeService.class);

    /**
     입찰상태코드 목록 조회
    * @date : 2024-01-15
    * @author  xyzp1539
    **/
    public List<CoCmmnCdVO> getBidStatCodeList() {
        log.info("test : BidNoticeService.getBidStatCodeList");
        return bidNoticeDao.getBidStatCodeList();

    }

    /**
     입찰상태코드별 공고 카운트 조회
    * @date : 2024-01-15
    * @author  xyzp1539
    **/
    public BidNoticeVO getBidNoticeMngStatCnt( BidNoticeVO paramVo ) {
        return bidNoticeDao.getBidNoticeMngStatCnt(paramVo);
    }

    /**
     입찰상태코드별 공고 리스트 조회
    * @date : 2024-01-16
    * @author  xyzp1539
    **/
    public List<BidNoticeVO> getBidNoticeMngBidList(BidNoticeVO paramVo) {
        return bidNoticeDao.getBidNoticeMngBidList(paramVo);
    }

    /**
     입찰 공고 정보 조회
    * @date : 2024-01-18
    * @author  xyzp1539
    **/
    public BidNoticeVO getBidNoticeMngInfo(BidNoticeVO paramVo) {
        List<BidNoticeVO> bidNoticeVoList = this.getBidNoticeMngBidList(paramVo);   // 입찰공고정보조회
        List<BidNoticeUpdtVO> updtVoList = bidNoticeDao.getBidNoticeMngBidUpdtList(paramVo);    // 입찰공고수정이력조회
        List<BidBddprDtlVO> bidBddprDtlVoList = bidNoticeDao.getBidNoticeMngBidBddprDtlList(paramVo);   // 입찰공고투찰기업목록조회

        BidNoticeVO resultVo = bidNoticeVoList.get(0);

        resultVo.setBidNoticeUpdtVoList(updtVoList);
        resultVo.setBidBddprDtlVoList(bidBddprDtlVoList);

        return resultVo;
    }
}
