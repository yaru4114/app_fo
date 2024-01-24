package com.bid.fo.main.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bid.fo.main.dao.BidMainDAO;
import com.bid.fo.main.model.MainVO;
import com.bid.fo.member.model.LoginVO;

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
	
	public int insertIntrstPblanc(MainVO mainVO, LoginVO loginVO){
		   
	    String userNo = loginVO.getUserNo();
	    String userId = loginVO.getUserId();
		   
	    mainVO.setBidEntrpsNo(userNo);
		mainVO.setFrstRegisterId(userId);
		mainVO.setLastChangerId(userId);
		
		int result = bidMainDAO.insertIntrstPblanc(mainVO);
		if(result > 0) {
			bidMainDAO.increIntrstEntrpsCnt(mainVO);
		}
		return result;
	}
	
	public int deleteIntrstPblanc(MainVO mainVO, LoginVO loginVO){
		   
	    String userNo = loginVO.getUserNo();
	    String userId = loginVO.getUserId();
	    mainVO.setBidEntrpsNo(userNo);
		mainVO.setLastChangerId(userId);
		
		int result = bidMainDAO.deleteIntrstPblanc(mainVO);
		if(result > 0) {
			bidMainDAO.decreIntrstEntrpsCnt(mainVO);
		}
		return result;
	}
}
