package com.bid.fo.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bid.fo.main.controller.BidMainController;
import com.bid.fo.main.model.MainVO;
import com.bid.fo.mypage.dao.BidMypageDAO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class BidMypageService {
	
	@Autowired
    private BidMypageDAO bidMypageDAO;

	public List<MainVO> selectBidBddprList(MainVO mainVO){
		List<MainVO> bidBddprList = bidMypageDAO.selectBidBddprList(mainVO);
		return bidBddprList;
	}
	
	public MainVO selectBidBddprCntList(MainVO mainVO){
		String pageSubCode = mainVO.getPageSubCode();
		if(pageSubCode.equals("03")) {
			mainVO.setCanclAt("Y");
		}else if(!pageSubCode.equals("01")){
			mainVO.setCanclAt("N");
		}
		
		MainVO bidBddprCntList = bidMypageDAO.selectBidBddprCntList(mainVO);
		return bidBddprCntList;
	}
	
	public List<MainVO> selectBidIntrstList(MainVO mainVO){
		List<MainVO> bidIntrstList = bidMypageDAO.selectBidIntrstList(mainVO);
		return bidIntrstList;
	}
	
	public int selectBidIntrstCntList(MainVO mainVO){
		int bidIntrstCntList = bidMypageDAO.selectBidIntrstCntList(mainVO);
		return bidIntrstCntList;
	}
}
