package com.core.externalApi;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import com.projOrder.model.ProjOrderService;
import com.projOrder.model.ProjOrderVO;
import com.sysconfig.SysConfig;

public class FonpayService {

    ProjOrderService projOrderService = new ProjOrderService();

    static String FONPAY_API_KEY = SysConfig.getFonpayApiKey();
    static String FONPAY_API_SECRET = SysConfig.getFonpayApiSecret();
    static String FONPAY_API_MERCHANT_CODE = SysConfig.getFonpayApiMerchantCode();
    static String PAYMENT_CREATE_ORDER = "PaymentCreateOrder";
    static String PAYMENT_CANCEL_ORDER = "paymentCancelOrder";
    static String PAYMENT_REFUND_ORDER = "paymentRefundOrder";
    static String PAYMENT_QUERY_ORDER = "paymentQueryOrder";
    static String PAYMENT_REFUND_QUERY_ORDER = "paymentRefundQueryOrder";
    static String PAYMENT_ACCOUNT_SUMMARY = "paymentAccountSummary";
    static String PAYMENT_CREATE_MOBILE_PAY_ORDER = "paymentCreateMobilePayOrder";

    public String paymentCreateOrder(ProjOrderVO projOrderVO) throws IOException {
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
                "'paymentNo':"+projOrderVO.getOrder_number()+"," +
                "'totalPrice':"+ projOrderService.getOrder_price(projOrderVO)+"," +
                "'paymentDueDate':"+"20230330235959," + //TODO 改時間
                "'itemName':"+projOrderService.getPerk_name(projOrderVO)+"," +
                "'callbackUrl':'http://localhost:8080/CFA104G2/projOrder/projOrder.do?action=paymentTransactionSyncTrigger&=" +projOrderVO.getOrder_number()+"',"+
                "'redirectUrl':'http://localhost:8080/CFA104G2/projOrder/paidConfirm.do/" +projOrderVO.getOrder_number()+"',"+
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
        StringBuffer stringBuffer = new StringBuffer();
        try{
            con.connect();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
            String output;
            while((output = bufferedReader.readLine()) != null ){
                stringBuffer.append(output);
            }
            bufferedReader.close();
            System.out.println(stringBuffer.toString());
        }
        catch(Exception e){
            System.out.println(e);
        }
        finally {
            if (con != null) {
                try {
                    con.disconnect();
                } catch (Exception ex) {
                    System.out.println("Error");
                }
            }
        }
    return stringBuffer.toString();
//        {"result":[],"response":{"success":false,"msg":"訂單號碼重複(#3014-7813273)","debugMsg":"訂單號碼重複,paymentNo=PN1555851600","apiLogId":7813273,"environment":"fonpay_staging_master","errorCode":3014}}
    }
}
