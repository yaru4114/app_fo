package com.bid.fo.member.controller;

import com.bid.common.model.BidMemberVO;
import com.bid.fo.member.model.LoginVO;
import com.bid.fo.member.service.BidMemberService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
    public String createPage2 () { return "/fo/member/createMember_2"; };

    @PostMapping("/create_2")
    public String createPage2 (@RequestBody BidMemberVO vo, HttpSession session) {
        log.info("약관 정보 : {}",vo);
        session.setAttribute("terms",vo);
        log.info("세션 정보 : {}",session.getAttribute("terms"));
        return "/fo/member/createMember_2";
    };

    @GetMapping("/create_3")
    public String createPage3 () { return "/fo/member/createMember_3"; };

    /** 회원 가입 */
    @PostMapping("/creMember")
    public ResponseEntity<?> creMember(@RequestPart("BidMemberVO") String jsonMemberVO,
                                       @RequestPart(value = "docFiles", required = false)List<MultipartFile> fileList,
                                       HttpSession session){

        BidMemberVO vo = null;
        BidMemberVO terms = null;
        Map<String,Object> resultMap = new HashMap<>();

        try {
            vo = objectMapper.readValue(jsonMemberVO, BidMemberVO.class);
            terms = (BidMemberVO) session.getAttribute("terms");
            
            // 약관동의 확인
            if (terms != null) {

                vo.setUseStplatAgreAt(terms.getUseStplatAgreAt());
                vo.setIndvdlInfoThreemanProvdAgreAt(terms.getIndvdlInfoThreemanProvdAgreAt());
                vo.setIndvdlInfoProcessPolcyAgreAt(terms.getIndvdlInfoProcessPolcyAgreAt());
                vo.setMarktRecptnAgreAt(terms.getMarktRecptnAgreAt());
                vo.setMberChrctrRecptnAgreAt(terms.getMberChrctrRecptnAgreAt());
                vo.setMberEmailRecptnAgreAt(terms.getMberEmailRecptnAgreAt());
                vo.setMberPushRecptnAgreAt(terms.getMberPushRecptnAgreAt());

                resultMap = memberService.creMember(vo,fileList,session);
            } else {
                resultMap.put("success", false);
                resultMap.put("message", "잘못된 접근입니다.");
            }

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
            session.setMaxInactiveInterval(60*60);
        }
        return ResponseEntity.ok(resultMap);
    }

    /** 로그아웃 */
    @PostMapping("/logout")
    public ResponseEntity<?> logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return ResponseEntity.ok(null);
    }
}
