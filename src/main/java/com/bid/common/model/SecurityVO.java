package com.bid.common.model;

import lombok.Data;

@Data
public class SecurityVO {
    
    /** 알고리즘 */
    public static String AES_ALG = "AES/CBC/PKCS5Padding";
    /** AES Security Key */
    private static final String AES_KEY = "12345678910111213";
    /** KEY to Byte */
    public static final String AES_IV = AES_KEY.substring(0,16); // 16byte
}
