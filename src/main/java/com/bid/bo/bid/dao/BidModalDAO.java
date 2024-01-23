package com.bid.bo.bid.dao;

import com.bid.bo.bid.vo.BidNoticeVO;
import com.bid.common.model.CoCmmnCdVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BidModalDAO {
    public List<CoCmmnCdVO> getSelectOpt(CoCmmnCdVO vo);
    public List<CoCmmnCdVO> getBrandGroupOpt(CoCmmnCdVO vo);
    public List<CoCmmnCdVO> getBrandOpt(CoCmmnCdVO vo);
    public List<CoCmmnCdVO> getItemOpt(CoCmmnCdVO vo);
    public void creBidNotice(BidNoticeVO vo);
    public void chgBidNotice(BidNoticeVO vo);
    public void creBidUpdt(BidNoticeVO vo);
    public List<BidNoticeVO> getBidDetail(BidNoticeVO vo);
    public BidNoticeVO getBidDetailNoUpdt(BidNoticeVO vo);
}
