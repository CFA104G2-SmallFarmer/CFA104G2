package com.core.connectionFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    public static final String DRIVER = com.sysconfig.SysConfig.getDriver();
    public static final String URL = com.sysconfig.SysConfig.getUrl();
    public static final String USER = com.sysconfig.SysConfig.getUserid();
    public static final String PASSWORD = com.sysconfig.SysConfig.getPasswd();

    private static Connection con = null;

    static {
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(System.err);
        }
    }

    public static Connection getConnection() {
        return con;
    }
}
