package com.bid.fo.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bid.fo.main.dao.BidMainDAO;
import com.bid.fo.main.model.MainVO;

@Service
public class BidMainService {

	@Autowired
    private BidMainDAO bidMainDAO;
	
	public List<MainVO> selectBidList(MainVO mainVO){
		List<MainVO> bidList = bidMainDAO.selectBidList(mainVO);
		return bidList;
	}
	
	public List<MainVO> selectBidListCnt(MainVO mainVO){
		List<MainVO> bidListCnt = bidMainDAO.selectBidListCnt(mainVO);
		return bidListCnt;
	}
	
	public MainVO selectBidDashBoard(MainVO mainVO){
		MainVO dashboardList = bidMainDAO.selectBidDashBoard(mainVO);
		return dashboardList;
	}
	
	public int selectBidIntrstCnt(MainVO mainVO){
		int bidIntrstCnt = bidMainDAO.selectBidIntrstCnt(mainVO);
		return bidIntrstCnt;
	}
	
	public int insertIntrstPblanc(MainVO mainVO){
		mainVO.setFrstRegisterId("test");
		mainVO.setLastChangerId("test");
		int result = bidMainDAO.insertIntrstPblanc(mainVO);
		return result;
	}
	
	public int deleteIntrstPblanc(MainVO mainVO){
		mainVO.setLastChangerId("test");
		int result = bidMainDAO.deleteIntrstPblanc(mainVO);
		return result;
	}
}
