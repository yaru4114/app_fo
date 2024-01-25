package com.bid.fo.member.dao;

import com.bid.common.model.BidMemberVO;
import com.bid.common.model.DocVO;
import com.bid.fo.member.model.LoginVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BidMemberDAO {
    void creMember(BidMemberVO vo);

    int idDuplicateCheck(String bidMberId);

    BidMemberVO login(LoginVO vo);

    void creBsnmResistDoc(DocVO doc);

    int maxDocNo();

    String getCurrentStatus(String userNo);
}
