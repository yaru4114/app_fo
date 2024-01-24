package com.bid.fo.bid.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bid.fo.bid.dao.BidDtlDAO;
import com.bid.fo.bid.vo.BidBasVO;
import com.bid.fo.bid.vo.BidDtlVO;

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
        return bidDtlDAO.getBidDtlInfo(vo);
    }

    public Map<String, Object> doBddpr(BidDtlVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        int result = 0;
        try {
        	result = bidDtlDAO.doBddpr(vo);
        }catch(Exception e) {
        	resultMap.put("result", "fail");
            return resultMap;
        }
    	resultMap.put("result", "success");
        return resultMap;
    }
}
