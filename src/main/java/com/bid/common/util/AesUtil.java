package com.bid.common.util;

import com.bid.common.model.SecurityVO;
import lombok.extern.slf4j.Slf4j;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * AES256 으로 비밀번호 암호화/복호화
 * */
@Slf4j
public class AesUtil {

    private static final String alg = SecurityVO.AES_ALG;
    private static final String iv = SecurityVO.AES_IV; // 16byte

    public static String encrypt(String text){
        try {
            Cipher cipher = Cipher.getInstance(alg);
            SecretKey keySpec = new SecretKeySpec(iv.getBytes(),"AES");
            IvParameterSpec ivParamSpec = new IvParameterSpec(iv.getBytes());
            cipher.init(Cipher.ENCRYPT_MODE,keySpec,ivParamSpec);

            byte[] encrypted = cipher.doFinal(text.getBytes(StandardCharsets.UTF_8));

            return Base64.getEncoder().encodeToString(encrypted);
        } catch (Exception e) {
            e.getStackTrace();

            return "";
        }
    }

    public static String decrypt(String cipherText) throws Exception{
        try {
            Cipher cipher = Cipher.getInstance(alg);
            SecretKeySpec keySpec = new SecretKeySpec(iv.getBytes(),"AES");
            IvParameterSpec ivParamSpec = new IvParameterSpec(iv.getBytes());
            cipher.init(Cipher.DECRYPT_MODE,keySpec,ivParamSpec);

            byte[] decodeBytes = Base64.getDecoder().decode(cipherText);
            byte[] decrypted = cipher.doFinal(decodeBytes);

            return new String(decrypted, StandardCharsets.UTF_8);
        } catch (Exception e) {
            e.getStackTrace();

            return "";
        }
    }
}
