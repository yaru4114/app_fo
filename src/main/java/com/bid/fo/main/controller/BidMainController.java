package com.bid.fo.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bid.common.model.CoCmmnCdVO;
import com.bid.common.service.CommonService;
import com.bid.fo.main.model.MainVO;
import com.bid.fo.main.service.BidMainService;
import com.bid.fo.member.model.LoginVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/fo")
public class BidMainController {

   @Autowired
   private BidMainService bidMainService; 
   
   @Autowired
   private CommonService commonService;
   
   @RequestMapping("/bid")
   public String start(Model model, MainVO mainVO, HttpSession session) {
	  CoCmmnCdVO coCmmnCdVO = new CoCmmnCdVO();
	  coCmmnCdVO.setMainCode("DSTRCT_LCLSF_CODE");
      List<CoCmmnCdVO> dstrctLclsfList = commonService.selectCommList(coCmmnCdVO);

	  coCmmnCdVO.setMainCode("BRAND_GROUP_CODE");
	  coCmmnCdVO.setCodeRefrnone("7");
      List<CoCmmnCdVO> brandGroupList = commonService.selectCommList(coCmmnCdVO);
      
      String loginYn = (String)session.getAttribute("loginYn");
      LoginVO loginVO = (LoginVO) session.getAttribute("loginUser");
      log.info("loginYn : {}",loginYn);
      log.info("loginVO : {}",loginVO);
      
      if("Y".equals(loginYn) && loginVO != null) {
    	mainVO.setBidEntrpsNo(loginVO.getUserNo());
        MainVO bidDashBoardList = bidMainService.selectBidDashBoard(mainVO);
        int bidIntrstCnt = bidMainService.selectBidIntrstCnt(mainVO);
        
        model.addAttribute("loginYn","Y");
    	model.addAttribute("bidEntrpsNo",loginVO.getUserNo());
        model.addAttribute("bidIntrstCnt",bidIntrstCnt); //관심 개수
        model.addAttribute("bidDashBoardList",bidDashBoardList);
        
      }else{
    	  session.setAttribute("loginYn","N");
    	  model.addAttribute("loginYn","N");
      }
      
      model.addAttribute("brandGroupList",brandGroupList);
      model.addAttribute("dstrctLclsfList",dstrctLclsfList);
      return "fo/main";
   }
   
   @PostMapping("/selectBidList")
   @ResponseBody
   public ResponseEntity<?> selectBidList(@RequestBody MainVO mainVO) {
      Map<String,Object> map = new HashMap<>();
      List<MainVO> bidList = bidMainService.selectBidList(mainVO);
      List<MainVO> bidListCnt = bidMainService.selectBidListCnt(mainVO);
      
      int totalCnt = 0;
      int exceptCnt = 0;
      int bddprCnt = 0;
      int endCnt = 0;
      
      for(MainVO vo : bidListCnt) {
         // null 값 예외처리
         if (vo.getBidSttusCode() == null) {
            continue;
         }
         
         if(vo.getBidSttusCode().equals("12")) {
            exceptCnt += vo.getBidSttusCnt();
         }else if(vo.getBidSttusCode().equals("13")) {
            bddprCnt += vo.getBidSttusCnt();
         }else if(vo.getBidSttusCode().equals("30")||vo.getBidSttusCode().equals("31")||vo.getBidSttusCode().equals("32")) {
            endCnt += vo.getBidSttusCnt();
         }
         totalCnt += vo.getBidSttusCnt();
      }

      map.put("bidList", bidList);
      map.put("totalCnt", totalCnt);
      map.put("exceptCnt", exceptCnt);
      map.put("bddprCnt", bddprCnt);
      map.put("endCnt", endCnt);
      
      log.info("data : {}",bidList);
      
      return ResponseEntity.ok(map);
   }
   
   @PostMapping("/insertIntrstPblanc")
   @ResponseBody
   public ResponseEntity<?> insertIntrstPblanc(@RequestBody MainVO mainVO) {
      Map<String,Object> map = new HashMap<>();
      log.info("insert : {}",mainVO);
      int result = bidMainService.insertIntrstPblanc(mainVO);

      if (result > 0) {
         map.put("result", 'S');
         map.put("errorMsg", "");
      } else {
         map.put("result", 'F');
         map.put("errorMsg", "");
      }
      return ResponseEntity.ok(map);
   }
   
   @PostMapping("/deleteIntrstPblanc")
   @ResponseBody
   public ResponseEntity<?> deleteIntrstPblanc(@RequestBody MainVO mainVO) {
      Map<String,Object> map = new HashMap<>();
      log.info("delete : {}",mainVO);
      int result = bidMainService.deleteIntrstPblanc(mainVO);
      if (result > 0) {
         map.put("result", 'S');
         map.put("errorMsg", "");
      } else {
         map.put("result", 'F');
         map.put("errorMsg", "");
      }
      return ResponseEntity.ok(map);
   }
   


}