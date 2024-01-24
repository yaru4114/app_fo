package com.bid.fo.bid.dao;

import org.apache.ibatis.annotations.Mapper;

import com.bid.fo.bid.vo.BidDtlVO;
import com.bid.fo.bid.vo.BidBasVO;

@Mapper
public interface BidDtlDAO {
	
	public BidBasVO getBidBasInfo(BidBasVO bassVO);
	
	public BidDtlVO getBidDtlInfo(BidBasVO bassVO);

	public int doBddpr(BidDtlVO bidBddprDtlVO);
}
