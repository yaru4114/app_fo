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

    public Map<String, Object> getMemberInfo(BidMemberVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<BidMemberVO> voList = bdMemberDAO.getMemberInfo(vo);

        resultMap.put("result", voList);
        return resultMap;
    }

    public Map<String, Object> chgMemberBlock(BidMemberVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        bdMemberDAO.chgMemberBlock(vo);

        resultMap.put("success", true);
        return resultMap;
    }

    public Map<String, Object>  getApprovalList(SearchVO vo) {
        int totalCnt = bdMemberDAO.getApprovalCnt(vo);
        vo.calPaging(totalCnt);

        Map<String, Object> resultMap = new HashMap<>();

        List<BidMemberVO> resultList = bdMemberDAO.getApprovalList(vo);

        resultMap.put("result", resultList);
        resultMap.put("paging", vo);

        return resultMap;
    }

    public Map<String, Object> searchById(String bidMberId) {
        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("result",bdMemberDAO.searchById(bidMberId));
        resultMap.put("success",true);

        return resultMap;
    }

    public Map<String, Object> udtApproval(BidMemberVO vo) {
        Map<String, Object> resultMap = new HashMap<>();

        bdMemberDAO.udtApproval(vo);

        if (vo.getBidConfmSttusCode().equals("03")) {
            resultMap.put("message","승인되었습니다.");
        } else if (vo.getBidConfmSttusCode().equals("02")) {
            resultMap.put("message","가입 거절 처리 되었습니다.");
        }

        resultMap.put("success",true);

        return resultMap;
    }
}
