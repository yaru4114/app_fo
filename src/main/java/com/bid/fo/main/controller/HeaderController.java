package com.bid.fo.main.controller;

import com.bid.fo.member.model.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/fo/header")
public class HeaderController {

    @RequestMapping("")
    public String header(Model model, HttpSession session){
        String loginYn = (String)session.getAttribute("loginYn");
        LoginVO loginVO = (LoginVO) session.getAttribute("loginUser");

        if("Y".equals(loginYn) && loginVO != null){
            model.addAttribute("loginYn","Y");
            model.addAttribute("bidEntrpsNo",loginVO.getUserNo());
        } else {
            session.setAttribute("loginYn","N");
            model.addAttribute("loginYn","N");
        }

        return "/fo/header";
    }
}
