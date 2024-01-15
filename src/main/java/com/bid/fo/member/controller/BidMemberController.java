package com.bid.fo.member.controller;

import com.bid.common.model.BidMemberVO;
import com.bid.fo.member.model.LoginVO;
import com.bid.fo.member.service.BidMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fo/member")
public class BidMemberController {

    @Autowired
    private BidMemberService memberService;


    /**페이지 이동 */
    @GetMapping("/create_1")
    public String createPage1 () { return "/fo/member/createMember_1"; };

    @GetMapping("/create_2")
    public String createPage2 () { return "/fo/member/createMember_2"; };

    @GetMapping("/create_3")
    public String createPage3 () { return "/fo/member/createMember_3"; };


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
