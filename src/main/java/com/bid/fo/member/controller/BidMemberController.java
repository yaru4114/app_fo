package com.bid.fo.member.controller;

import com.bid.common.model.BidMemberVO;
import com.bid.fo.member.model.LoginVO;
import com.bid.fo.member.service.BidMemberService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String createPage2 (BidMemberVO vo, Model model){
        model.addAttribute("terms",vo);
        log.info("model 정보 : {}",vo);
        return "/fo/member/createMember_2";
    };

    @GetMapping("/create_3")
    public String createPage3 () { return "/fo/member/createMember_3"; };

    /** 회원 가입 */
    @PostMapping("/creMember")
    public ResponseEntity<?> creMember(@RequestPart("BidMemberVO") String jsonMemberVO,
                                       @RequestPart(value = "docFiles", required = false)List<MultipartFile> fileList){

        BidMemberVO vo = null;
        BidMemberVO terms = null;
        Map<String,Object> resultMap = new HashMap<>();

        try {
            vo = objectMapper.readValue(jsonMemberVO, BidMemberVO.class);
            resultMap = memberService.creMember(vo,fileList);
        } catch (IOException e) {
            e.printStackTrace();
        }

        log.info("USER DATA : {}",vo);
        log.info("FILE DATA : {}",fileList);

        return ResponseEntity.ok(resultMap);
    }

    /** 로그인 */
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginVO vo, HttpSession session) {
        Map<String,Object> resultMap = memberService.login(vo);
        if ((boolean)resultMap.get("success")) {
            session.setAttribute("loginUser",resultMap.get("loginUser"));
            session.setAttribute("loginYn","Y");
            session.setMaxInactiveInterval(60*60);
        }
        return ResponseEntity.ok(resultMap);
    }

    /** 로그아웃 */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/fo/bid";
    }
}
