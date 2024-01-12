package com.bid.fo.member.service;

import com.bid.fo.member.dao.MemberDAO;
import com.bid.fo.member.model.BidMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberDAO memberDAO;

    public String creMember(BidMemberVO vo) {
        return memberDAO.creMember(vo);
    }
}
