package com.bid.fo.member.service;

import com.bid.fo.member.dao.BidMemberDAO;
import com.bid.common.model.BidMemberVO;
import com.bid.fo.member.model.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class BidMemberService {

    @Autowired
    private BidMemberDAO memberDAO;

    public String creMember(BidMemberVO vo) {
        
        // 아이디 중복 체크
        if (memberDAO.idDuplicateCheck(vo.getBidMberId()) > 0) {
            // 아이디 중복
            return null;
        }
        // 회원정보 입력
        memberDAO.creMember(vo);
        
        // 사업자등록증(업체) 입력
        memberDAO.creBsnmResistDoc(vo.getBsnmRegistDocNo1());
        memberDAO.creBsnmResistDoc(vo.getBsnmRegistDocNo2());

        return null;
    }

    public String login(LoginVO vo) {

        Map<String,Object> resultMap = new HashMap<>();

        resultMap.put("result",memberDAO.login(vo));

        return null;
    }
}
