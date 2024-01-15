package com.bid.common.model;

import lombok.Data;

@Data
public class BidMemberVO {

    /** 입찰 회원 정보 */
    private String bidEntrpsNo; // 입찰 회원 정보
    private String bidMberId; // 회원 아이디
    private String bidMberSecretNo; // 비밀번호
    private String entrpsNm; // 업체명
    private String bsnmRegistNo; // 사업자 등록 번호
    private String bidMberEmail; // 이메일
    private String moblphoneNo2; // 휴대폰 번호
    private String entrpsTlphonNo; // 업체 전화 번호
    private String frntnEntrpsAt; // 외국업체 여부
    private String postNo; // 우편번호
    private String adres; // 주소
    private String detailAdres; // 상세 주소
    private String rnAdres; // 도로명 주소
    private String rnDetailAdres; // 도로명 상세 주소
    private int bsnmRegistDocNo1; // 사업자등록증 문서 번호1 (입찰 업체)
    private int scsbidCnt; // 낙찰 건수
    private int nonScsbidCnt; // 패찰 건수

    /** 입찰 회원 상태 */
    private String bidMberSttusCode; // 입찰 회원 상태 코드
    private String bidConfmSttusCode; // 입찰 승인 상태 코드
    private String bidConfmDetailSttusCode; // 입찰 승인 상세 상태 코드

    private String bidMberIntrcpDt; // 입찰 회원 차단 일시
    private String bidMberIntrcpCn; // 입찰 회원 차단 내용
    private int bddprCanclCo; // 투찰 취소 건수

    /** 대행 업체 정보 */
    private String vrscEntrpsNm; // 대행 업체명
    private String vrscBsnmRegistNo; // 대행 사업자 등록 번호
    private String vrscBidMberEmail; // 대행 입찰 회원 이메일
    private String vrscMoblphonNo; // 대행 휴대폰 번호
    private String vrscTlphonNo; // 대행 전화 번호
    private int bsnmRegistDocNo2; // 사업자등록증 문서 번호2 (대행 업체)


    /** 약관 동의 */
    private String useStplatAgreAt; // 이용 약관 동의 여부
    private String indvdlInfoThreemanProvdAgreAt; // 개인 정보 3자 제공 동의 여부
    private String indvdlInfoProcessPolcyAgreAt; // 개인 정보 처리 방침 동의 여부
    private String marktRecptnAgreAt; // 마케팅 수신 동의 여부
    private String mberChrctrRecptnAgreAt; // 회원 문자 수신 동의 여부
    private String mberEmailRecptnAgreAt; // 회원 메일 수신 동의 여부
    private String mberPushRecptnAgreAt; // 회원 푸시 수신 동의 여부

}
