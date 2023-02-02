package com.core.externalApi;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.sysconfig.SysConfig;

public class FonpayService {
    static String FONPAY_API_KEY = SysConfig.getFonpayApiKey();
    static String FONPAY_API_SECRET = SysConfig.getFonpayApiSecret();
    static String FONPAY_API_MERCHANT_CODE = SysConfig.getFonpayApiMerchantCode();
    static String PAYMENT_CREATE_ORDER = "PaymentCreateOrder";
    public static String paymentCreateOrder(String paymentNo) throws IOException {
        URL url = new URL ("https://test-api.fonpay.tw/api/payment/"+PAYMENT_CREATE_ORDER);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Accept", "application/json");
        con.setRequestProperty("key", FONPAY_API_KEY);
        con.setRequestProperty("secret", FONPAY_API_SECRET);
        con.setRequestProperty("merchantCode", FONPAY_API_MERCHANT_CODE);
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("User-Agent", "Tibame_Student");
        con.setRequestProperty("X-ignore", "true");
        con.setDoOutput(true);
        String jsonInputString = "{ " +
                "'request':{" +
                "'note':'Test'," +
                "'paymentNo':"+paymentNo+"," +
                "'legacyId':'TS1234567'," +
                "'totalPrice':100," +
                "'paymentDueDate':'20230511153541'," +
                "'itemName':'故宮普通參觀券'," +
                "'memberName':'memberNo12'," +
                "'callbackUrl':'https://test-platform.wecometw.com/fonpay/payment/1'," +
                "'redirectUrl':'https://test-fonticket.fonticket.com/callback/paidConfirm/1'," +
                "'includeItemList':[" +
                "{" +
                "'itemName':'故宮北院參觀券'," +
                "'itemQuantity':1" +
                "}," +
                "{" +
                "'itemName':'故宮南院參觀券'," +
                "'itemQuantity':1" +
                "}" +
                "]" +
                "}," +
                "'basic':{" +
                "'appVersion':'0.9'," +
                "'os':'IOS'," +
                "'appName':'POSTMAN'," +
                "'latitude':24.25," +
                "'clientIp':'61.216.102.83'," +
                "'lang':'zh_TW'," +
                "'deviceId':'123456789'," +
                "'longitude':124.25" +
                "}}";


        try(OutputStream os = con.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }
        try(BufferedReader br = new BufferedReader(
                new InputStreamReader(con.getInputStream(), "utf-8"))) {
            StringBuilder response = new StringBuilder();
            String responseLine = null;
            while ((responseLine = br.readLine()) != null) {
                response.append(responseLine.trim());
            }
            System.out.println(response.toString());
        }

    return new StringBuilder(con.getResponseCode()).toString();
//        {"result":[],"response":{"success":false,"msg":"訂單號碼重複(#3014-7813273)","debugMsg":"訂單號碼重複,paymentNo=PN1555851600","apiLogId":7813273,"environment":"fonpay_staging_master","errorCode":3014}}
    }
}
