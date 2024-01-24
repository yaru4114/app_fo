package com.bid.fo.bid.dao;

import org.apache.ibatis.annotations.Mapper;

import com.bid.fo.bid.vo.BidBddprDtlVO;
import com.bid.fo.bid.vo.BidBasVO;

@Mapper
public interface BidDtlDAO {
	
	public BidBasVO getBidBasInfo(BidBasVO bassVO);
	
	public BidBddprDtlVO getBidDtlInfo(BidBasVO bassVO);

	public BidBddprDtlVO doBddpr(BidBddprDtlVO bidBddprDtlVO);
}
