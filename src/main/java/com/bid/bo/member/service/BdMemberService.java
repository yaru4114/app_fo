package com.bid.bo.member.service;

import com.bid.bo.member.dao.BdMemberDAO;
import com.bid.common.model.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class BdMemberService {
    public Map<String, Object> getMemberList(PagingVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }
}
