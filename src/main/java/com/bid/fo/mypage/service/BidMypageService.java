package com.bid.fo.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bid.fo.main.model.MainVO;
import com.bid.fo.mypage.dao.BidMypageDAO;



@Service
public class BidMypageService {
	
	@Autowired
    private BidMypageDAO bidMypageDAO;

	public List<MainVO> selectBidBddprList(MainVO mainVO){
		List<MainVO> bidBddprList = bidMypageDAO.selectBidBddprList(mainVO);
		return bidBddprList;
	}
	
	public MainVO selectBidBddprCntList(MainVO mainVO){
		MainVO bidBddprCntList = bidMypageDAO.selectBidBddprCntList(mainVO);
		return bidBddprCntList;
	}
	
	public List<MainVO> selectBidIntrstList(String bidEntrpsNo){
		List<MainVO> bidIntrstList = bidMypageDAO.selectBidIntrstList(bidEntrpsNo);
		return bidIntrstList;
	}
	
	public int selectBidIntrstCntList(String bidEntrpsNo){
		int bidIntrstCntList = bidMypageDAO.selectBidIntrstCntList(bidEntrpsNo);
		return bidIntrstCntList;
	}
}
