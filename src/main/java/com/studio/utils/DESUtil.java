package com.studio.utils;

import javax.crypto.KeyGenerator;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class DESUtil {

    private static Key key;

    //设置密匙
    private static String KEY_STR = "myKey";
    private static String CHARSET_NAME = "UTF-8";
    private static String ALGORITHM = "DES";

    static {
        try {
            //生成DES算法对象
            KeyGenerator generator = KeyGenerator.getInstance(ALGORITHM);
            //运用SHA1安全策略
            SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
            //设置上密钥种子
            secureRandom.setSeed(KEY_STR.getBytes());
            //初始化基于SHA1的算法对象
            generator.init(secureRandom);
            //生成密钥对象
            key = generator.generateKey();
            generator = null;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
     //加密
    /*public static String getEncryptString(String str) {
        Encoder base64Encoder = Base64.getEncoder();
        try {
            byte[] bytes = str.getBytes(CHARSET_NAME);
            String encodedText = base64Encoder.encodeToString(bytes);
            return encodedText;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
*/
    public static String getDecryptString(String str){
        Base64.Decoder base64Decoder = Base64.getDecoder();
        try {
            byte[] bytes = base64Decoder.decode(str);
            return new String(bytes,CHARSET_NAME);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    /*public static void main(String[] args) {
        String name = "root";
        String pwd = "Mn&123456";
        String encryName = getEncryptString("root");
        String encryPwd = getEncryptString("Mn&123456");
        System.out.println(" n "+encryName+"  p "+encryPwd);
        System.out.println("af n " + getDecryptString(encryName));
        System.out.println("af n " + getDecryptString(encryPwd));
    }*/
}


