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

        bidModalDAO.creBidUpdt(vo);
        bidModalDAO.chgBidNotice(vo);

        /* bddprBeginDt < 현재 날짜 < bddprEndDt && '활성' => 입찰 상태 코드 [13]
        *   '시작일이 당일이며, 상태가 활성입니다. 해당 정보로 수정 저장 시, 입찰 시작됩니다. 진행 하시겠습니까?'
        *   message : 수정되었습니다.
        *   location : 투찰중
        * */

        /* 현재 날짜 < bddprBeginDt ~ bddprEndDt && '활성' => 입찰 상태 코드 [12]
         *   '시작일이 미래이며, 상태가 활성입니다. 해당 정보로 수정 저장 시, 입찰예정으로 노출됩니다. 진행 하시겠습니까?'
         *   message : 수정되었습니다.
         *   location : 입찰예정
         * */

        /* (bddprBeginDt < 현재 날짜 < bddprEndD ||  현재 날짜 < bddprBeginDt ~ bddprEndDt) && '비활성' => 입찰 상태 코드 [11]
         *   '시작일이 당일이며, 상태가 활성입니다. 해당 정보로 수정 저장 시, 입찰 시작됩니다. 진행하시겠습니까?'
         *   message : 수정되었습니다.
         *   location : 공고대기
         * */
        resultMap.put("success", true);
        return resultMap;
    }
}
