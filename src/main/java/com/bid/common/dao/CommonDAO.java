package com.bid.common.dao;

import java.util.List;

import com.bid.common.model.BidMemberVO;
import org.apache.ibatis.annotations.Mapper;

import com.bid.common.model.CoCmmnCdVO;

@Mapper
public interface CommonDAO {

	List<CoCmmnCdVO> selectCommList(String mainCode);
	public int getBddtrCancelCnt(BidMemberVO vo);
}
