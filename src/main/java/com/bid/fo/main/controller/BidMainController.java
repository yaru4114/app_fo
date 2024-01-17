package com.bid.fo.main.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bid.common.model.CoCmmnCdVO;
import com.bid.common.service.CommonService;
import com.bid.fo.main.model.MainVO;
import com.bid.fo.main.service.BidMainService;

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
	public String start(Model model, MainVO mainVO) {
		List<CoCmmnCdVO> brandGroupList = commonService.selectCommList("BRAND_GROUP_CODE");
		List<CoCmmnCdVO> dstrctLclsfList = commonService.selectCommList("DSTRCT_LCLSF_CODE");
		
		model.addAttribute("loginYn","N");
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
			if(vo.getBidSttusCode().equals("12")) {
				exceptCnt += vo.getBidSttusCnt();
			}else if(vo.getBidSttusCode().equals("13")) {
				bddprCnt += vo.getBidSttusCnt();
			}else if(vo.getBidSttusCode().equals("30")) {
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
	
}
