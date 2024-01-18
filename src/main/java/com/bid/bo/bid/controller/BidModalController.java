package com.bid.bo.bid.controller;

import com.bid.bo.bid.service.BidModalService;
import com.bid.common.model.CoCmmnCdVO;
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
@RequestMapping("/bo/bid/modal")
public class BidModalController {
    @Autowired
    private BidModalService bidModalService;

    @GetMapping("/open")
    public String modal() {
        return "bo/bidModal";
    }

    // 메탈 구분 조회
    @PostMapping("/metal")
    public ResponseEntity<?> getMetalOpt() {
        return ResponseEntity.ok(bidModalService.getMetalOpt());
    }

    // 권역 조회
    @PostMapping("/dstrct")
    public ResponseEntity<?> getdstrctOpt() {
        return ResponseEntity.ok(bidModalService.getdstrctOpt());
    }

    // 브랜드 그룹 조회
    @PostMapping("/brandGrp")
    public ResponseEntity<?> getBrandGroupOpt(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getBrandGroupOpt(vo));
    }

    // 브랜드 조회
    @PostMapping("/brand")
    public ResponseEntity<?> getBrandOpt(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getBrandOpt(vo));
    }

    // 아이템 조회
    @PostMapping("/item")
    public ResponseEntity<?> getItemOpt(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getItemOpt(vo));
    }

    // 통화 조회
    @PostMapping("/currency")
    public ResponseEntity<?> getCurrencyOpt() {
        return ResponseEntity.ok(bidModalService.getCurrencyOpt());
    }
}
