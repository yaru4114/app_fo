package com.bid.bo.bid.dao;

import com.bid.bo.bid.vo.BidBddprDtlVO;
import com.bid.bo.bid.vo.BidNoticeVO;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

/**
 입찰 공고 스케쥴러 Dao
* @date : 2024-01-23
* @author  xyzp1539
**/
@Mapper
public interface BidSchedulerDao {

    /**
     입찰공고 투찰기간 목록 조회
    * @date : 2024-01-23
    * @author  xyzp1539
    **/
    List<BidNoticeVO> getBidNoticeBddprList(BidNoticeVO paramVo);

    /**
     투찰 회사중 가장 프리미엄가격이 낮은 업체 조회
    * @date : 2024-01-23
    * @author  xyzp1539
    **/
    BidBddprDtlVO getBidBddprMinPremPriceComp(BidNoticeVO paramVo);

    /**
     낙찰 처리
    * @date : 2024-01-24
    * @author  xyzp1539
    **/
    void bidBddprSuccessProc(BidBddprDtlVO minPrVo);

    /**
     입찰 공고 낙찰 처리
    * @date : 2024-01-24
    * @author  xyzp1539
    **/
    void bidBasSuccessProc(BidNoticeVO minPrVo);

    /**
     낙찰 등록
    * @date : 2024-01-24
    * @author  xyzp1539
    **/
    void bidScsbidDtlSuccessProc(BidBddprDtlVO minPrVo);

    /**
     입찰 공고 투찰 시작
    * @date : 2024-01-24
    * @author  xyzp1539
    **/
    void updateBidBddprStrart(BidNoticeVO vo);
}
