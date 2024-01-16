package com.bid.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bid.common.dao.CommonDAO;
import com.bid.common.model.CoCmmnCdVO;


@Service
public class CommonService {

	@Autowired
    private CommonDAO commonDAO;
	
	public List<CoCmmnCdVO> selectCommList(String mainCode){
		List<CoCmmnCdVO> commList = commonDAO.selectCommList(mainCode);
		return commList;
	}
}
