package com.system.utils;

import java.security.MessageDigest;

import sun.misc.BASE64Encoder;

public class MyMD5Utils {

    /**
     * 利用 md5 加密
     *
     * @param str 需加密的字符串
     * @return 加密码后的字符串
     */
    public static String encode(String str) {

        String result;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            byte[] hash = messageDigest.digest(str.getBytes("utf-8"));
            BASE64Encoder encoder = new BASE64Encoder();
            result = encoder.encode(hash);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return result;
    }

}
