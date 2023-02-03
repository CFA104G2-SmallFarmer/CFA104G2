<%--
  Created by IntelliJ IDEA.
  User: kwz50
  Date: 2023/2/3
  Time: 下午 02:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="refresh"
          content="2;url='${resultObject.webUrl}?success=${resultObject.success}&id=${resultObject.id}&status=${resultObject.status}&payType=${resultObject.payType}&errorMessage=${resultObject.errorMessage}'"/>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            background: #f2f2f1;
            font-family: ‘Noto Sans TC’, sans-serif, Arial, 微軟正黑體;
        }

        #outside {
            position: relative;
            width: 96%;
            border: 1px solid transparent;
            margin: 10px auto;
        }

        /*通路*/
        .payment_container {
            min-height: 100px;
            height: auto !important;
            height: 100px;
            margin: 20px auto 0 auto;
            border-radius: 4px;
            padding: 10px;
            box-sizing: border-box;
        }


        .payment_success {
            color: #00a7e9;
            font-size: 23px;
            text-align: center;
            font-weight: bold;
        }

        .payment_failed {
            color: #fe4040;
            font-size: 23px;
            text-align: center;
            font-weight: bold;
        }

        .payment_content {
            font-size: 16px;
            color: #434343;
            margin: 30px 0;
            text-align: center;
            line-height: 1.6em;
        }

        /*Qrcode*/
        .success_icon {
            text-align: center;
        }

        .success_icon img {
            width: 70%;

        }


        /* Portrait and Landscape */
        @media only screen
        and (min-device-width: 375px)
        and (max-device-width: 667px)
        and (-webkit-min-device-pixel-ratio: 2) {

            /*通路*/
            .payment_container {
                width: 96%;
                margin: 100px auto 0 auto;

            }

        }

        @media only screen
        and (min-device-width: 768px)
        and (max-device-width: 1024px)
        and (-webkit-min-device-pixel-ratio: 2) {

            /*通路*/
            .payment_container {
                width: 96%;
                margin: 100px auto 0 auto;

            }


        }

        /* Portrait and Landscape */
        @media screen
        and (device-width: 320px)
        and (device-height: 640px)
        and (-webkit-device-pixel-ratio: 3) {
            /*通路*/
            .payment_container {
                width: 96%;
                margin: 100px auto 0 auto;

            }
        }

        /* Portrait */
        @media screen
        and (device-width: 320px)
        and (device-height: 640px)
        and (-webkit-device-pixel-ratio: 3) {
            /*通路*/
            .payment_container {
                width: 96%;
                margin: 100px auto 0 auto;
            }
        }

        @media (min-width: 768px) {

            .payment_container {
                width: 500px;
                margin: 100px auto 0 auto;

            }
        }

        @media (max-width: 767px) {

            .payment_container {
                width: 96%;
                margin: 100px auto 0 auto;

            }
        }

    </style>
    <g:set var="layout_nosecondarymenu" value="${true}" scope="request"/>
</head>

<BODY>
    ${result}

<script>

    var now = new Date().valueOf();
    var isSafari = !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/);
    var isFireFox = navigator.userAgent.match("Firefox");
    var iOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;

    if ((isSafari && !iOS) || isFireFox || "${resultObject.isPayByQRCode}") {

    } else {
        setTimeout(function () {
            window.location = ("${resultObject.webUrl}" + "?success=${resultObject.success}&id=${resultObject.id}&status=${resultObject.status}&payType=${resultObject.payType}&errorMessage=${resultObject.errorMessage}");
        }, 300);
        window.location = ("${resultObject.appUrl}" + "?success=${resultObject.success}&id=${resultObject.id}&status=${resultObject.status}&payType=${resultObject.payType}");
    }


</script>
</BODY>

</html>
