package com.bid.bo.bid.controller;

import com.bid.bo.bid.service.BidNoticeService;
import com.bid.bo.bid.vo.BidNoticeVO;
import com.bid.common.model.CoCmmnCdVO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/bo/bid")
public class BidNoticeController {
    private static Logger log = LoggerFactory.getLogger(BidNoticeController.class);

    @Autowired
    BidNoticeService bidNoticeService;


    /**
     입찰공고관리목록
    * @date : 2024-01-12
    * @author  xyzp1539
    **/
    @RequestMapping("/noticeMngForm")
    public String NoticeMngForm( ModelMap map ) {
        // 입찰공고상태
        List<CoCmmnCdVO> bidStatCodeList = bidNoticeService.getBidStatCodeList();

        map.addAttribute("ccmmnCdList", bidStatCodeList);

        return "/bo/bidNoticeMngList";
    }

    /**
     입찰상태코드별 공고 카운트 조회
    * @date : 2024-01-15
    * @author  xyzp1539
    **/
    @ResponseBody
    @RequestMapping(value="/noticeMngForm/cntList")
    public BidNoticeVO getBidNoticeMngStatCnt(@RequestBody BidNoticeVO paramVo ) {
        log.info("test getBidNoticeMngStatCnt param : {} ", paramVo.toString());

        BidNoticeVO resultVo = bidNoticeService.getBidNoticeMngStatCnt(paramVo);

        log.info("test resultVo : {} ", resultVo.toString());

        return resultVo;
    }

    /**
     입찰상태코드별 공고 리스트 조회
    * @date : 2024-01-16
    * @author  xyzp1539
    **/
    @ResponseBody
    @RequestMapping(value="noticeMngForm/bidList")
    public List<BidNoticeVO> getBidNoticeMngBidList(@RequestBody BidNoticeVO paramVo) {
        log.info("test getBidNoticeMngBidList param : {} ", paramVo.toString());

        List<BidNoticeVO> resultList = bidNoticeService.getBidNoticeMngBidList(paramVo);

        for(BidNoticeVO vo : resultList ) {
            log.info("test getBidNoticeMngBidList {} " ,vo.toString());
        }

        return resultList;
    }

}
