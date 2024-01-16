package com.bid.fo.member.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LoginVO {

    private String userNo; // 회원 번호
    private String userId; // 회원 아이디
    private String userPwd; // 회원 비밀번호
    private String userNm; // 업체명
}
