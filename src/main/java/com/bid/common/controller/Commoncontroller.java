package com.bid.common.controller;

import com.bid.common.model.BidMemberVO;
import com.bid.common.service.CommonService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/common")
public class Commoncontroller {
    @Autowired
    private CommonService commonService;

    // 입찰 회원 투찰 취소 개수 조회
    @PostMapping("/bddtrCnlCnt")
    public ResponseEntity<?> getBddtrCnlCnt(@RequestBody BidMemberVO vo) {
        return ResponseEntity.ok(commonService.isBddtrCancelOver(vo));
    }
}
