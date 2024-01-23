package com.bid.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bid.common.model.BidMemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bid.common.dao.CommonDAO;
import com.bid.common.model.CoCmmnCdVO;


@Service
@Slf4j
public class CommonService {

	@Autowired
    private CommonDAO commonDAO;
	
	public List<CoCmmnCdVO> selectCommList(CoCmmnCdVO coCmmnCdVO){
		List<CoCmmnCdVO> commList = commonDAO.selectCommList(coCmmnCdVO);
		return commList;
	}

	public Map<String, Object> isBddtrCancelOver(BidMemberVO vo) {
		Map<String, Object> resultMap = new HashMap<>();
		int cnt = commonDAO.getBddtrCancelCnt(vo);

		if (cnt > 3){
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}

		return resultMap;
	}
}
