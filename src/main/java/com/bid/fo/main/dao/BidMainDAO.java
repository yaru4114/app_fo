package com.bid.fo.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bid.fo.main.model.MainVO;

@Mapper
public interface BidMainDAO {
	
	List<MainVO> selectBidList(MainVO mainVO);

	List<MainVO> selectBidListCnt(MainVO mainVO);
	
	List<MainVO> selectBidTabCnt(MainVO mainVO);
}
