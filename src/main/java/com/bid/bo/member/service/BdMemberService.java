package com.bid.bo.member.service;

import com.bid.bo.member.dao.BdMemberDAO;
import com.bid.common.model.BidMemberVO;
import com.bid.common.model.SearchVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class BdMemberService {
    @Autowired
    private BdMemberDAO bdMemberDAO;
    public Map<String, Object> getMemberList(SearchVO vo) {
        Map<String, Object> resultMap = new HashMap<>();

        List<BidMemberVO> resultList = bdMemberDAO.getMemberList(vo);
        log.info("객체 리스트 : {}", resultList);

        resultMap.put("result", resultList);
        return resultMap;
    }

    public Map<String, Object> getMemberStatusCnt(SearchVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<String> paramList = vo.getStatusCode();

        for (String data : paramList) {
            int cnt = bdMemberDAO.getMemberStatusCnt(data);
            resultMap.put(data, cnt);
        }

        return resultMap;
    }

    public Map<String, Object>  getApprovalList(SearchVO vo) {
        int totalCnt = bdMemberDAO.getApprovalCnt(vo);
        vo.calPaging(totalCnt);

        Map<String, Object> resultMap = new HashMap<>();

        List<BidMemberVO> resultList = bdMemberDAO.getApprovalList(vo);
        log.info("객체 리스트 : {}", resultList);

        resultMap.put("result", resultList);
        resultMap.put("paging", vo);

        return resultMap;
    }
}
