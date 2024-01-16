package com.bid.bo.member.dao;

import com.bid.common.model.BidMemberVO;
import com.bid.common.model.PagingVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BdMemberDAO {
    public List<BidMemberVO> getMemberList(PagingVO vo);
    public List<BidMemberVO> test();
    public int getApprovalCnt(PagingVO vo);
    public List<BidMemberVO> getApprovalList(PagingVO vo);
}
