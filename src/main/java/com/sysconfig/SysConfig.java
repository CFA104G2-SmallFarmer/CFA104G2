package com.sysconfig;

public class SysConfig {

    final static String driver = "com.mysql.cj.jdbc.Driver";
    final static String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
    final static String userid = "root";
    final static String passwd = "53434976";

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

}
