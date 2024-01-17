package com.bid.bo.member.controller;

import com.bid.bo.member.service.BdMemberService;
import com.bid.common.model.BidMemberVO;
import com.bid.common.model.SearchVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequestMapping("/bo/member")
public class BdMemberController {
    @Autowired
    private BdMemberService bdMemberService;

    // 입찰 회원 목록 페이지
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

    // 상태별 회원 수 조회
    @PostMapping("/statusCnt")
    public ResponseEntity<?> getMemberStatusCnt(@RequestBody SearchVO vo) {
        log.info("상태 코드 param : {}", vo);
        return ResponseEntity.ok(bdMemberService.getMemberStatusCnt(vo));
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

    // 아이디로 회원 정보 검색
    @PostMapping("/searchById")
    public ResponseEntity<?> searchById(@RequestBody BidMemberVO vo) {
        log.info("ID param : {}", vo.getBidMberId());
        return ResponseEntity.ok(bdMemberService.searchById(vo.getBidMberId()));
    }

    // 가입 승인 처리
    @PostMapping("/udtApproval")
    public ResponseEntity<?> udtApproval(@RequestBody BidMemberVO vo){
        log.info("상태 변경 param : {}", vo);
        return ResponseEntity.ok(bdMemberService.udtApproval(vo));
    }
}
