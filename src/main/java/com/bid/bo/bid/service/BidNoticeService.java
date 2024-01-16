package com.bid.bo.bid.service;

import com.bid.bo.bid.dao.BidNoticeDao;
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
     입찰 상태별 공고수 조회
    * @date : 2024-01-15
    * @author  xyzp1539
    **/
    public BidNoticeVO getBidStatCnt( BidNoticeVO paramVo ) {
        return bidNoticeDao.getBidStatCnt(paramVo);
    }
}
