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
	
	public List<MainVO> selectBidTabCnt(MainVO mainVO){
		List<MainVO> tabCntList = bidMainDAO.selectBidTabCnt(mainVO);
		return tabCntList;
	}
}
