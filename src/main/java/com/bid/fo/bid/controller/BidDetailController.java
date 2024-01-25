package com.bid.fo.bid.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bid.fo.bid.service.BidDtlService;
import com.bid.fo.bid.vo.BidBasVO;
import com.bid.fo.bid.vo.BidDtlVO;
import com.bid.fo.member.model.LoginVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/fo")
public class BidDetailController {
	
	   
	   @Autowired
	   private BidDtlService bidDtlService;
	   
	   @GetMapping("/bid/detail/{bidPblancId}")
	   public String bidDetail(Model model, @PathVariable String bidPblancId, HttpSession session) {
		   BidBasVO bidBasVO = new BidBasVO();
		   bidBasVO.setBidPblancId(bidPblancId);

		   String loginYn = (String)session.getAttribute("loginYn");
		   LoginVO loginVO = (LoginVO) session.getAttribute("loginUser");
		   
		   if(loginVO == null) {
			   return "redirect:/fo/bid";
		   }
		   
		   String loginUserNo = loginVO.getUserNo();
		   String loginUserId = loginVO.getUserId();
		   
		   bidBasVO.setBidEntrpsNo(loginUserNo);
		   
		   BidBasVO basVO = bidDtlService.getBidBasInfo(bidBasVO);
		   
		   model.addAttribute("loginYn",loginYn);
		   model.addAttribute("bidEntrpsNo",loginUserNo);
		   model.addAttribute("bidMberId",loginUserId);
		   
		   model.addAttribute("bidPblancId", bidPblancId);
		   model.addAttribute("bidBasInfo", basVO);
		   return "fo/bidDetail/bidDetail";
	   }
	   
	   @ResponseBody
	   @PostMapping("/bid/detail/getBidDtlInfo")
	   public ResponseEntity<?> selectDtlInfo(@RequestBody BidBasVO bidBasVO) {
		   Map<String, Object> map = new HashMap<>();
		   
		   BidDtlVO dtlVO = bidDtlService.getBidDtlInfo(bidBasVO);
		   map.put("bidDtlInfo", dtlVO);
		   
		   return ResponseEntity.ok(map);
	   }

	   @ResponseBody
	   @PostMapping("/bid/detail/doBddpr")
	   public ResponseEntity<?> doBddpr(@RequestBody BidDtlVO bidBddprDtlVO) {
		   Map<String, Object> map = new HashMap<>();
		   
		   map = bidDtlService.doBddpr(bidBddprDtlVO);
		   
		   return ResponseEntity.ok(map);
	   }


	   @ResponseBody
	   @PostMapping("/bid/detail/canclBddpr")
	   public ResponseEntity<?> canclBddpr(@RequestBody BidDtlVO bidBddprDtlVO) {
		   Map<String, Object> map = new HashMap<>();
		   
		   map = bidDtlService.canclBddpr(bidBddprDtlVO);
		   
		   return ResponseEntity.ok(map);
	   }
	   
}
