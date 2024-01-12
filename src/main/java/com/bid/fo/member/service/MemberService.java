package com.bid.fo.member.service;

import com.bid.fo.member.dao.MemberDAO;
import com.bid.common.model.BidMemberVO;
import com.bid.fo.member.model.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class MemberService {

    @Autowired
    private MemberDAO memberDAO;

    public String creMember(BidMemberVO vo) {
        
        // 아이디 중복 체크
        if (memberDAO.idDuplicateCheck(vo.getBidMberId()) > 0) {
            
        } else {
            
        }

        memberDAO.creMember(vo);

        return null;
    }

    public String login(LoginVO vo) {

        Map<String,Object> resultMap = new HashMap<>();

        resultMap.put("result",memberDAO.login(vo));

        return null;
    }
}
