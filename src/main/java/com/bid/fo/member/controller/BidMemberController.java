package com.bid.fo.member.controller;

import com.bid.common.model.BidMemberVO;
import com.bid.fo.member.model.LoginVO;
import com.bid.fo.member.service.BidMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fo/member")
public class BidMemberController {

    @Autowired
    private BidMemberService memberService;

    /** 회원 가입 */
    @PostMapping("/creMember")
    public ResponseEntity<?> creMember(@RequestBody BidMemberVO vo) {
        return ResponseEntity.ok(memberService.creMember(vo));
    }

    /** 로그인 */
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginVO vo) {
        return ResponseEntity.ok(memberService.login(vo));
    }

    /** 로그아웃 */
    @PostMapping("/logout")
    public ResponseEntity<?> logout() {
        return ResponseEntity.ok(null);
    }
}
