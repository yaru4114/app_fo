package com.bid.fo.bid.dao;

import org.apache.ibatis.annotations.Mapper;

import com.bid.fo.bid.vo.BidBasVO;
import com.bid.fo.bid.vo.BidDtlVO;

@Mapper
public interface BidDtlDAO {
	
	public BidBasVO getBidBasInfo(BidBasVO bassVO);
	
	public BidDtlVO getBidDtlInfo(BidBasVO bassVO);

	public int doBddpr(BidDtlVO bidBddprDtlVO);
	
	public int canclBddpr(BidDtlVO bidBddprDtlVO);
	
	public int chgBddrCnt(BidDtlVO bidBddprDtlVO);
	
}
