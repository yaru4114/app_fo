package com.bid.bo.bid.dao;

import com.bid.bo.bid.vo.BidBddprDtlVO;
import com.bid.bo.bid.vo.BidNoticeUpdtVO;
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
    BidNoticeVO getBidNoticeMngStatCnt(BidNoticeVO resultVo);

    /**
     입찰상태코드별 공고 리스트 조회
    * @date : 2024-01-16
    * @author  xyzp1539
    **/
    List<BidNoticeVO> getBidNoticeMngBidList(BidNoticeVO paramVo);

    /**
     입찰 공고 수정 이력 리스트 조회
    * @date : 2024-01-18
    * @author  xyzp1539
    **/
    List<BidNoticeUpdtVO> getBidNoticeMngBidUpdtList(BidNoticeVO paramVo);

    /**
     입찰 공고 투찰 기업 리스트 조회
    * @date : 2024-01-18
    * @author  xyzp1539
    **/
    List<BidBddprDtlVO> getBidNoticeMngBidBddprDtlList(BidNoticeVO paramVo);

    /**
     입찰 상태코드 변경
    * @date : 2024-01-22
    * @author  xyzp1539
    **/
    int bidBidNoticeCanlcel(BidNoticeVO paramVo);

    /**
     입찰 공고 투찰 기업 카운팅
    * @date : 2024-01-22
    * @author  xyzp1539
    **/
    int getBidBddprDtlCnt(BidNoticeVO realParamVo);

    /**
     입찰 공고 투찰 기업 유찰 처리
    * @date : 2024-01-22
    * @author  xyzp1539
    **/
    void updateBidPassingProc(BidNoticeVO realParamVo);

    /**
     입찰 공고 삭제 처리
    * @date : 2024-01-22
    * @author  xyzp1539
    **/
    void updateDelBidNotice(BidNoticeVO realParamVo);
}
