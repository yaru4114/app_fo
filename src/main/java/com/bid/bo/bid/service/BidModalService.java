package com.bid.bo.bid.service;

import com.bid.bo.bid.dao.BidModalDAO;
import com.bid.bo.bid.vo.BidNoticeVO;
import com.bid.common.model.CoCmmnCdVO;
import lombok.extern.slf4j.Slf4j;
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

        bidModalDAO.creBidNotice(vo);

        resultMap.put("success", true);
        return resultMap;
    }
}
