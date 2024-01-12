package com.bid.fo.member.dao;

import com.bid.common.model.BidMemberVO;
import com.bid.common.model.DocVO;
import com.bid.fo.member.model.LoginVO;
import org.springframework.stereotype.Repository;

@Repository
public class BidMemberDAO {
    public void creMember(BidMemberVO vo){

    }

    public int idDuplicateCheck(String bidMberId) {
        return 0;
    }

    public BidMemberVO login(LoginVO vo) {
        return null;
    }

    public void creBsnmResistDoc(DocVO doc) {

    }
}
