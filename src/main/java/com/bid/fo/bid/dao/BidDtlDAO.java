package com.bid.fo.bid.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bid.fo.bid.vo.BidBasVO;
import com.bid.fo.bid.vo.BidDtlVO;
import com.bid.fo.bid.vo.BddprEntrpsVO;

@Mapper
public interface BidDtlDAO {
	
	public BidBasVO getBidBasInfo(BidBasVO bassVO);
	
	public BidDtlVO getBidDtlInfo(BidBasVO bassVO);

	public int doBddpr(BidDtlVO dtlVO);
	
	public int canclBddpr(BidDtlVO dtlVO);
	
	public int chgBddrCnt(BidDtlVO dtlVO);
	
	public List<BddprEntrpsVO> getBddprEntrpsList(BidDtlVO dtlVO);
	
	public int chgEntrpsCanclCnt(BidDtlVO dtlVO);
}
