package com.bid.fo.member.model;

import lombok.Data;

@Data
public class LoginVO {

    private String userNo; // 회원 번호
    private String userId; // 회원 아이디
    private String userPwd; // 회원 비밀번호
    private String userNm; // 업체명
}
