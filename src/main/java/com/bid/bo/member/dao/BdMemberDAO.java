package com.bid.bo.member.dao;

import com.bid.common.model.BidMemberVO;
import com.bid.common.model.SearchVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BdMemberDAO {
    public List<BidMemberVO> getMemberList(SearchVO vo);
    public int getMemberStatusCnt(String statusCode);
    public int getApprovalCnt(SearchVO vo);
    public List<BidMemberVO> getApprovalList(SearchVO vo);
    public BidMemberVO searchById(String bidMberId);
    public void udtApproval(BidMemberVO vo);
}
