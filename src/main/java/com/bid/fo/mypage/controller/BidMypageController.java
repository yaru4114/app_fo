package com.bid.fo.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bid.fo.main.model.MainVO;
import com.bid.fo.mypage.service.BidMypageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/fo")
public class BidMypageController {
	
	@Autowired
	   private BidMypageService bidMypageService; 
	
	   @RequestMapping("/mypage")
	   public String mypage(@RequestParam(value="bidEntrpsNo") String bidEntrpsNo, @RequestParam(value="tabCode", required=false) String tabCode, Model model) {
		   log.info("bidEntrpsNo : {}",bidEntrpsNo);
		   log.info("tabCode : {}",tabCode);
		   model.addAttribute("bidEntrpsNo",bidEntrpsNo);
		   model.addAttribute("tabCode",tabCode);
	      return "fo/mypage/bddprList";
	   }

	   
	   @PostMapping("/selectBidBddprList")
	   @ResponseBody
	   public ResponseEntity<?> selectBidBddprList(@RequestBody MainVO mainVO) {
	      Map<String,Object> map = new HashMap<>();
	      
	      List<MainVO> bidBddprList = bidMypageService.selectBidBddprList(mainVO);
	      MainVO bidBddprCntList = bidMypageService.selectBidBddprCntList(mainVO);
	      log.info("bidBddprList : {}",bidBddprList);
	      log.info("bidBddprListCnt : {}",bidBddprCntList);
	      
	      map.put("bidBddprList", bidBddprList);
	      map.put("bidBddprCntList", bidBddprCntList);
	      return ResponseEntity.ok(map);
	   }
	   
	   @RequestMapping("/intrstList")
	   public String intrstList(@RequestParam(value="bidEntrpsNo") String bidEntrpsNo, Model model) {
		   log.info("bidEntrpsNo : {}",bidEntrpsNo);
		   model.addAttribute("bidEntrpsNo",bidEntrpsNo);
		      
	      return "fo/mypage/intrstList";
	   }
	   
	   @RequestMapping("/selectIntrstList")
	   @ResponseBody
	   public ResponseEntity<?> selectIntrstList(@RequestBody MainVO mainVO) {
		   Map<String,Object> map = new HashMap<>();
		  
		   List<MainVO> bidIntrstList = bidMypageService.selectBidIntrstList(mainVO);
		   int bidIntrstCntList = bidMypageService.selectBidIntrstCntList(mainVO);

		   log.info("bidIntrstList : {}",bidIntrstList);
		   log.info("bidIntrstCntList : {}",bidIntrstCntList);
		   
		   map.put("bidIntrstList", bidIntrstList);
	       map.put("bidIntrstCntList", bidIntrstCntList);
	       return ResponseEntity.ok(map);
	   }
	   
}
