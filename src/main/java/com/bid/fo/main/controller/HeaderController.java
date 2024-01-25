package com.bid.fo.main.controller;

import com.bid.fo.member.model.LoginVO;
import com.bid.fo.member.service.BidMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/fo/header")
public class HeaderController {

    @Autowired
    BidMemberService memberService;

    @RequestMapping("")
    public String header(Model model, HttpSession session){
        String loginYn = (String)session.getAttribute("loginYn");
        LoginVO loginVO = (LoginVO) session.getAttribute("loginUser");

        if("Y".equals(loginYn) && loginVO != null){
            model.addAttribute("loginYn","Y");
            model.addAttribute("bidEntrpsNo",loginVO.getUserNo());
            // 현재 상태값 조회
            String currentStatus = memberService.getCurrentStatus(loginVO.getUserNo());
            model.addAttribute("loginUserStat",currentStatus);
        } else {
            session.setAttribute("loginYn","N");
            model.addAttribute("loginYn","N");
        }

        return "/fo/header";
    }
}
