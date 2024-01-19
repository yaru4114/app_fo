package com.bid.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fo/header")
public class HeaderController {

    @RequestMapping("")
    public String header(){
        return "/fo/header";
    }
}
