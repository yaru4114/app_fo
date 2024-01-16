package com.bid.bo.member.dao;

import com.bid.common.model.BidMemberVO;
import com.bid.common.model.SearchVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BdMemberDAO {
    public List<BidMemberVO> getMemberList(SearchVO vo);
    public List<BidMemberVO> test();
    public int getApprovalCnt(SearchVO vo);
    public List<BidMemberVO> getApprovalList(SearchVO vo);
}
