package com.bid.bo.member.service;

import com.bid.bo.member.dao.BdMemberDAO;
import com.bid.common.model.BidMemberVO;
import com.bid.common.model.PagingVO;
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
    public Map<String, Object> getMemberList(PagingVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }

    public Map<String, Object> test() {
        Map<String, Object> resultMap = new HashMap<>();
        List<BidMemberVO> result = bdMemberDAO.test();
        resultMap.put("result", result);
        resultMap.put("success", true);

        return resultMap;
    }
}
