package com.bid.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bid.common.model.CoCmmnCdVO;

@Mapper
public interface CommonDAO {

	List<CoCmmnCdVO> selectCommList(String mainCode);
}
