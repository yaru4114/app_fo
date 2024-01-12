package com.bid.fo.member.dao;

import com.bid.common.model.BidMemberVO;
import com.bid.fo.member.model.LoginVO;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class BidMemberDAO {
    public String creMember(BidMemberVO vo) {
        return null;
    }

    public int idDuplicateCheck(String bidMberId) {
        return 0;
    }

    public Map<String,Object> login(LoginVO vo) {
        return null;
    }

    public void creBsnmResistDoc(int bsnmRegistDocNo1) {
    }
}
