package com.bid.bo.member.dao;

import com.bid.common.model.BidMemberVO;
import com.bid.common.model.PagingVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BdMemberDAO {
    public List<BidMemberVO> getMemberList(PagingVO vo);
}
