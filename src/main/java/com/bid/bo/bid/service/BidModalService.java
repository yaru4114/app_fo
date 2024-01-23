package com.bid.bo.bid.service;

import com.bid.bo.bid.dao.BidModalDAO;
import com.bid.bo.bid.vo.BidNoticeVO;
import com.bid.common.model.CoCmmnCdVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.map.AbstractMapDecorator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class BidModalService {
    @Autowired
    private BidModalDAO bidModalDAO;

    public Map<String, Object> getSelectOpt(CoCmmnCdVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<CoCmmnCdVO> resultList = bidModalDAO.getSelectOpt(vo);

        resultMap.put("result", resultList);
        return resultMap;
    }

    public Map<String, Object> getBrandGroupOpt(CoCmmnCdVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<CoCmmnCdVO> resultList = bidModalDAO.getBrandGroupOpt(vo);

        resultMap.put("result", resultList);
        return resultMap;
    }
    public Map<String, Object> getBrandOpt(CoCmmnCdVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<CoCmmnCdVO> resultList = bidModalDAO.getBrandOpt(vo);

        resultMap.put("result", resultList);
        return resultMap;
    }

    public Map<String, Object> getItemOpt(CoCmmnCdVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<CoCmmnCdVO> resultList = bidModalDAO.getItemOpt(vo);

        resultMap.put("result", resultList);
        return resultMap;
    }

    public Map<String, Object> creBidNotice(BidNoticeVO vo) {
        Map<String, Object> resultMap = new HashMap<>();

        String permWtRage = vo.getPermWtRate1();
        BigDecimal decimalValue = new BigDecimal(permWtRage);
        decimalValue = decimalValue.setScale(1, RoundingMode.HALF_UP);
        vo.setPermWtRate(decimalValue);

        if (vo.getDspyAt().equals('Y')) {
            vo.setBidSttusCode("12");
        } else {
            vo.setBidSttusCode("11");
        }
        bidModalDAO.creBidNotice(vo);

        resultMap.put("success", true);
        return resultMap;
    }

    public Map<String, Object> getBidNoticeDetail(BidNoticeVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<BidNoticeVO> resultList = bidModalDAO.getBidDetail(vo);

        if (resultList.size() == 0) {
            BidNoticeVO result = bidModalDAO.getBidDetailNoUpdt(vo);
            resultMap.put("result", result);
        } else {
            resultMap.put("result", resultList);
        }
        return resultMap;
    }

    public Map<String, Object> chgBidNotice(BidNoticeVO vo) {
        Map<String, Object> resultMap = new HashMap<>();

        String permWtRage = vo.getPermWtRate1();
        BigDecimal decimalValue = new BigDecimal(permWtRage);
        decimalValue = decimalValue.setScale(1, RoundingMode.HALF_UP);
        vo.setPermWtRate(decimalValue);

        // ❗케이스별 처리 필요!!
        int isSelectUdt = bidModalDAO.isSelectBidUpdt(vo);
        if (isSelectUdt > 0) { // 최초 수정 x
            bidModalDAO.chgBidNotice(vo);
        } else { // 최초 수정
            bidModalDAO.creBidUpdt(vo);
            bidModalDAO.chgBidNotice(vo);
        }

        resultMap.put("success", true);
        return resultMap;
    }
}
