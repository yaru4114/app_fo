package com.bid.bo.member.controller;

import com.bid.bo.member.service.BdMemberService;
import com.bid.common.model.SearchVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/bo/member")
public class BdMemberController {
    @Autowired
    private BdMemberService bdMemberService;

    @GetMapping("/list")
    public String mainPage() {
        return "bo/memberList";
    }

    // 입찰 회원 목록 조회
    @PostMapping("/getList")
    public ResponseEntity<?> getMemberList(@RequestBody SearchVO vo) {
        log.info("회원 목록 param : {}", vo);
        return ResponseEntity.ok(bdMemberService.getMemberList(vo));
    }
    
    // 가입 승인 대기 페이지
    @GetMapping("/approvalList")
    public String approvalPage(){ return "bo/memberApprovalList"; }
    
    // 가입 승인 목록 조회
    @PostMapping("/getApprovalList")
    public ResponseEntity<?> getApprovalList(@RequestBody SearchVO vo){
        log.info("회원 목록 param : {}", vo);
        return ResponseEntity.ok(bdMemberService.getApprovalList(vo));
    }
}
