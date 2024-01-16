package com.bid.bo.bid.dao;

import com.bid.bo.bid.vo.BidNoticeVO;
import com.bid.common.model.CoCmmnCdVO;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BidNoticeDao {

    /**
     입찰상태코드 목록 조회
    * @date : 2024-01-15
    * @author  xyzp1539
    **/
    List<CoCmmnCdVO> getBidStatCodeList();

    /**
     입찰 상태별 공고수 조회
    * @date : 2024-01-15
    * @author  xyzp1539
    **/
    BidNoticeVO getBidStatCnt(BidNoticeVO resultVo);
}
