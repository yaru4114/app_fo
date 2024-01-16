package com.bid.fo.member.controller;

import com.bid.common.model.BidMemberVO;
import com.bid.common.model.DocVO;
import com.bid.fo.member.model.LoginVO;
import com.bid.fo.member.service.BidMemberService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/fo/member")
public class BidMemberController {

    @Autowired
    private BidMemberService memberService;

    @Autowired
    private ObjectMapper objectMapper;

    /**페이지 이동 */
    @GetMapping("/create_1")
    public String createPage1 () { return "/fo/member/createMember_1"; };

    @GetMapping("/create_2")
    public String createPage2 () { return "/fo/member/createMember_2"; };

    @PostMapping("/create_2")
    public String createPage2 (@RequestBody BidMemberVO vo, HttpSession session) {
        log.info("약관 정보 : {}",vo);
        session.setAttribute("terms",vo);
        return "/fo/member/createMember_2";
    };

    @GetMapping("/create_3")
    public String createPage3 () { return "/fo/member/createMember_3"; };


    /** 회원 가입 */
    @PostMapping("/creMember")
    public ResponseEntity<?> creMember(@RequestPart("BidMemberVO") String jsonMemberVO){

        BidMemberVO vo = null;
        List<DocVO> docFiles = null;

        try {
            vo = objectMapper.readValue(jsonMemberVO, BidMemberVO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }

        log.info("USER DATA : {}",vo);

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
