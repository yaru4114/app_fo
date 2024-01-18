package com.bid.fo.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bid.fo.main.model.MainVO;

@Mapper
public interface BidMypageDAO {

	List<MainVO> selectBidBddprList(MainVO mainVO);

	MainVO selectBidBddprCntList(MainVO mainVO);
}
