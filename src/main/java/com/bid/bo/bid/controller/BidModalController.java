package com.bid.bo.bid.controller;

import com.bid.bo.bid.service.BidModalService;
import com.bid.bo.bid.vo.BidNoticeVO;
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

    // 메탈 구분 조회
    @PostMapping("/metal")
    public ResponseEntity<?> getMetalOpt(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getSelectOpt(vo));
    }

    // 권역 조회
    @PostMapping("/dstrct")
    public ResponseEntity<?> getdstrctOpt(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getSelectOpt(vo));
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

    // 가격지정방법 조회
    @PostMapping("/priceSpmtc")
    public ResponseEntity<?> getPriceSpmtcOpt(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getSelectOpt(vo));
    }

    // 결제 조건(결제 통화 코드) 조회
    @PostMapping("/currency")
    public ResponseEntity<?> getCurrencyOpt(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getSelectOpt(vo));
    }

    // 결제 조건(결제 방법 코드) 조회
    @PostMapping("/pymntMt")
    public ResponseEntity<?> getPymntMtOpt(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getSelectOpt(vo));
    }

    // 결제 조건(결제 기간 코드) 조회
    @PostMapping("/pymntPr")
    public ResponseEntity<?> getPymntPr(@RequestBody CoCmmnCdVO vo) {
        return ResponseEntity.ok(bidModalService.getSelectOpt(vo));
    }

    // 입찰 공고 등록
    @PostMapping("/creBid")
    public ResponseEntity<?> creBidNotice(@RequestBody BidNoticeVO vo) {
        return ResponseEntity.ok(bidModalService.creBidNotice(vo));
    }
}
