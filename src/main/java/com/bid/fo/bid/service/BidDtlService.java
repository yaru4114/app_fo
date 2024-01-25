package com.bid.fo.bid.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bid.fo.bid.dao.BidDtlDAO;
import com.bid.fo.bid.vo.BidBasVO;
import com.bid.fo.bid.vo.BidDtlVO;
import com.bid.fo.bid.vo.BddprEntrpsVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BidDtlService {
    @Autowired
    private BidDtlDAO bidDtlDAO;

    public BidBasVO getBidBasInfo(BidBasVO vo) {
        return bidDtlDAO.getBidBasInfo(vo);
    }

    public BidDtlVO getBidDtlInfo(BidBasVO vo) {
    	BidDtlVO dtlVO = bidDtlDAO.getBidDtlInfo(vo);
    	if(dtlVO != null) {
        	dtlVO.setBddprEntrpsList(bidDtlDAO.getBddprEntrpsList(dtlVO));	
    	}
        return dtlVO;
    }

    @Transactional
    public Map<String, Object> doBddpr(BidDtlVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        int result = 0;
        try {
        	result = bidDtlDAO.doBddpr(vo);
        	vo.setCanclAt("N");
        	bidDtlDAO.chgBddrCnt(vo);
        }catch(Exception e) {
        	log.error(ExceptionUtils.getStackTrace(e));
        	
        	resultMap.put("result", "fail");
        	resultMap.put("message", ExceptionUtils.getRootCauseMessage(e));
            return resultMap;
        }
    	resultMap.put("result", "success");
        return resultMap;
    }

    @Transactional
    public Map<String, Object> canclBddpr(BidDtlVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        int result = 0;
        try {
        	result = bidDtlDAO.canclBddpr(vo);
        	vo.setCanclAt("Y");
        	bidDtlDAO.chgBddrCnt(vo);
        	bidDtlDAO.chgEntrpsCanclCnt(vo);
        }catch(Exception e) {
        	log.error(ExceptionUtils.getStackTrace(e));
        	
        	resultMap.put("result", "fail");
        	resultMap.put("message", ExceptionUtils.getRootCauseMessage(e));
            return resultMap;
        }
    	resultMap.put("result", "success");
        return resultMap;
    }
}
