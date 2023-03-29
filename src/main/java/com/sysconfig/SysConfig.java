package com.sysconfig;

public class SysConfig {

    final static String driver = "com.mysql.cj.jdbc.Driver";
    final static String url = System.getenv("url");
//    final static String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
    final static String userid = System.getenv("userid");
//    final static String userid = "serveruser";
    final static String passwd = System.getenv("passwd");
//    final static String passwd = "53434976";
    final static String fonpayApiKey = System.getenv("fonpayApiKey");
    final static String fonpayApiSecret = System.getenv("fonpayApiSecret");
    final static String fonpayApiMerchantCode = System.getenv("fonpayApiMerchantCode");

    public static String getDriver() {
        return driver;
    }

    public static String getPasswd() {
        return passwd;
    }

    public static String getUrl() {
        return url;
    }

    public static String getUserid() {
        return userid;
    }

    public static String getFonpayApiKey() {
        return fonpayApiKey;
    }

    public static String getFonpayApiSecret() {
        return fonpayApiSecret;
    }

    public static String getFonpayApiMerchantCode() {
        return fonpayApiMerchantCode;
    }
}
