package com.bid.fo.bid.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bid.fo.bid.dao.BidDtlDAO;
import com.bid.fo.bid.vo.BidBasVO;
import com.bid.fo.bid.vo.BidBddprDtlVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BidDtlService {
    @Autowired
    private BidDtlDAO bidDtlDAO;

    public BidBasVO getBidBasInfo(BidBasVO vo) {
        return bidDtlDAO.getBidBasInfo(vo);
    }

    public BidBddprDtlVO getBidDtlInfo(BidBasVO vo) {
        return bidDtlDAO.getBidDtlInfo(vo);
    }

    public BidBddprDtlVO doBddpr(BidBddprDtlVO vo) {
        return bidDtlDAO.doBddpr(vo);
    }
}
