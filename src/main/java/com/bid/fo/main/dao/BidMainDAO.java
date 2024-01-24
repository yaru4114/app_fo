package com.bid.fo.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bid.fo.main.model.MainVO;

@Mapper
public interface BidMainDAO {
	
	List<MainVO> selectBidList(MainVO mainVO);

	List<MainVO> selectBidListCnt(MainVO mainVO);
	
	MainVO selectBidDashBoard(MainVO mainVO);
	
	int selectBidIntrstCnt(MainVO mainVO);
	
	int insertIntrstPblanc(MainVO mainVO);
	
	int deleteIntrstPblanc(MainVO mainVO);
	
	int increIntrstEntrpsCnt(MainVO mainVO);
	
	int decreIntrstEntrpsCnt(MainVO mainVO);

}
