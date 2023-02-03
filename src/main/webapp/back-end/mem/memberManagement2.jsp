<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--               本網站由緯育(Tibame)Java雲端服務開發技術養成班-第93期-第二組製作， -->
<!--               非營利用途，僅為學習交流使用。如有不當使用之內容,請向https://www.tibame.com/聯繋。 -->
<!-- 參考網站https://shopee.tw/  https://www.zeczec.com/  https://www.buydirectlyfromfarmers.tw/ -->
<html>
<head>
<title>會員管理</title>
<style>
.main {
  width: 80%;
  margin: 20px auto;
}
table {
  border-spacing: 0;
  width: 100%;
}
tr {
  text-align: center;
}
th {
  padding: 10px;
}
table tbody tr:nth-child(odd){
  background-color: #eee
}
table thead {
  background-color: #63D983;
  color: white;
}
table thead th:first-child {
  border-radius: 5px 0 0 0;
  border: 1px solid blue;
}
table thead th:last-child {
  border-radius: 0 5px 0 0;
  border-right: 1px solid blue;
}
table tbody tr:last-child td:first-child {
  border-radius: 0 0 0 5px;
}

table tbody tr:last-child td:last-child {
  border-radius: 0 0 5px 0;
}
</style>

<link rel="stylesheet" href="https://tinybot.cc/littlefarm/wp-admin/load-styles.php?c=0&amp;dir=ltr&amp;load%5B%5D=dashicons,admin-bar,common,forms,admin-menu,dashboard,list-tables,edit,revisions,media,themes,about,nav-menus,widgets,site-icon,&amp;load%5B%5D=l10n,buttons,wp-auth-check,wp-jquery-ui-dialog,media-views,wp-color-picker&amp;ver=4.7.9" type="text/css" media="all">
    <style type="text/css">
    [data-font="Dashicons"]:before {font-family: 'Dashicons' !important;content: attr(data-icon) !important;speak: none !important;font-weight: normal !important;font-variant: normal !important;text-transform: none !important;line-height: 1 !important;font-style: normal !important;-webkit-font-smoothing: antialiased !important;-moz-osx-font-smoothing: grayscale !important;}
    </style>
    <!--[if lte IE 7]>
    <link rel='stylesheet' id='ie-css'  href='https://tinybot.cc/littlefarm/wp-admin/css/ie.min.css?ver=1.3.1579&#038;bi=177864704' type='text/css' media='all' />
    <![endif]-->
    <link rel="stylesheet" id="acf-global-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/advanced-custom-fields-pro/assets/css/acf-global.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="ame-font-awesome-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/mu-plugins/admin-menu-editor-pro/extras/font-awesome/scss/font-awesome.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="font_awesome_css-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/advanced-cf7-db/admin/css/font-awesome.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="fs_common-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/drag-and-drop-form-builder-for-contact-form-7/vendor/freemius/assets/css/admin/common.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="slate-admin-theme-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/slate-admin-theme/css/slate.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="foa-fuzzy-styles-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-filter-orders-by-product/style.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="mediaelement-css" href="https://tinybot.cc/littlefarm/wp-includes/js/mediaelement/mediaelementplayer.min.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wp-mediaelement-css" href="https://tinybot.cc/littlefarm/wp-includes/js/mediaelement/wp-mediaelement.min.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="imgareaselect-css" href="https://tinybot.cc/littlefarm/wp-includes/js/imgareaselect/imgareaselect.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wc_crm-fonts-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/css/fonts.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wc_crm-textbox-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/css/TextboxList.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wc_crm-current-call-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/css/admin-current-call.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="thickbox-css" href="https://tinybot.cc/littlefarm/wp-includes/js/thickbox/thickbox.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="jquery-ui-css-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/css/jquery-ui.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wc_crm-admin-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/css/admin.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="fonticonpicker_styles-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/plugins/fontpicker/css/jquery.fonticonpicker.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="fonticonpicker_theme-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/plugins/fontpicker/theme/jquery.fonticonpicker.grey.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="fonticonpicker_theme_darkgrey-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/plugins/fontpicker/theme/jquery.fonticonpicker.darkgrey.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="fonticonpicker_fonts_fontello-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/plugins/fontpicker/fonts/fontello/css/fontello.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="fonticonpicker_fonts_icomoon-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/plugins/fontpicker/fonts/icomoon/style.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="woocommerce_admin_styles-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce/assets/css/admin.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wc_crm-tasks-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/css/admin-tasks.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wc_crm-calls-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/css/admin-calls.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="woocommerce_shipping_table_rate_styles-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-table-rate-shipping/assets/css/admin.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wc-deposits-admin-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-deposits/assets/css/admin.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wc_appointments_admin_styles-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-appointments/assets/css/admin.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <style id="wc_appointments_admin_styles-inline-css" type="text/css">
    div.outside_event {
        cursor: unset;
        background-size: 26px 26px !important;
        background-color: grey !important;
        background-image: linear-gradient(
            135deg,
            rgba(255, 255, 255, .3) 25%,
            transparent 25%,
            transparent 50%,
            rgba(255, 255, 255, .3) 50%,
            rgba(255, 255, 255, .3) 75%,
            transparent 75%,
            transparent) !important;
    }
    .show_outside_calendar_wrap {
        float: left;
        padding: 5px 20px 10px;
    }
    </style>
    <link rel="stylesheet" id="yoast-seo-adminbar-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/wordpress-seo-premium/css/adminbar-440.min.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="yoast-seo-admin-global-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/wordpress-seo-premium/css/admin-global-440.min.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="yoast-seo-dismissible-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/wordpress-seo-premium/css/wpseo-dismissible-440.min.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="yith-plugin-fw-admin-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/yith-woocommerce-customize-myaccount-page/plugin-fw/assets/css/admin.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="wont_templatecss-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woo-order-note-templates/admin/css/templatecss.min.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="woocommerce_admin_menu_styles-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce/assets/css/menu.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="tinybot-admin-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/themes/transcend/css/admin-style.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <style id="tinybot-admin-inline-css" type="text/css">
    #toplevel_page_quick-setup a { color: #ff3333 !important; font-weight: bold !important; }#toplevel_page_quick-setup .wp-menu-image:before { color: #ff3333 !important; }
    </style>
    <link rel="stylesheet" id="ame-helper-style-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/mu-plugins/admin-menu-editor-pro/css/admin.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
    <link rel="stylesheet" id="shipment_tracking_styles-css" href="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-shipment-tracking/assets/css/admin.css?ver=1.3.1579&amp;bi=177864704" type="text/css" media="all">
            <script type="text/javascript">
                window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.2.1\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.2.1\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/d2otiughgt5pr2.cloudfront.net\/wp-includes\/js\/wp-emoji-release.min.js?ver=1.3.1579&bi=177864704"}};
                !function(a,b,c){function d(a){var b,c,d,e,f=String.fromCharCode;if(!k||!k.fillText)return!1;switch(k.clearRect(0,0,j.width,j.height),k.textBaseline="top",k.font="600 32px Arial",a){case"flag":return k.fillText(f(55356,56826,55356,56819),0,0),!(j.toDataURL().length<3e3)&&(k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,57331,65039,8205,55356,57096),0,0),b=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,57331,55356,57096),0,0),c=j.toDataURL(),b!==c);case"emoji4":return k.fillText(f(55357,56425,55356,57341,8205,55357,56507),0,0),d=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55357,56425,55356,57341,55357,56507),0,0),e=j.toDataURL(),d!==e}return!1}function e(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g,h,i,j=b.createElement("canvas"),k=j.getContext&&j.getContext("2d");for(i=Array("flag","emoji4"),c.supports={everything:!0,everythingExceptFlag:!0},h=0;h<i.length;h++)c.supports[i[h]]=d(i[h]),c.supports.everything=c.supports.everything&&c.supports[i[h]],"flag"!==i[h]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[i[h]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
            </script><script src="https://d2otiughgt5pr2.cloudfront.net/wp-includes/js/wp-emoji-release.min.js?ver=1.3.1579&amp;bi=177864704" type="text/javascript" defer=""></script>
            <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-admin/load-scripts.php?c=0&amp;load%5B%5D=jquery-core&amp;ver=4.7.9"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    
    window.mediaAddImage = function(data) {
        data['uploading'] = false;
        data['menuOrder'] = 0;
        window.jQuery('body > div.supports-drag-drop:visible .media-menu .media-menu-item:first').click();
        var attachment = window.wp.media.model.Attachment.create(data);
        window.wp.Uploader.queue.add(attachment);
        //
        wp.media.model.Attachment.get(data.id, attachment);
        var complete = window.wp.Uploader.queue.all(function(attachment) {
            return ! attachment.get('uploading');
        });
        if ( complete )
            window.wp.Uploader.queue.reset();
    }
    </script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var userSettings = {"url":"\/","uid":"44457","time":"1643638844","secure":"1"};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/utils.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/mu-plugins/admin-menu-editor-pro/js/admin-helpers.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/advanced-cf7-db/admin/js/advanced-cf7-db-admin.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/advanced-cf7-db/admin/js/jquery.datetimepicker.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/slate-admin-theme/js/slate.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-filter-orders-by-product/fuzzy-dropdown.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/ui/core.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/ui/widget.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/ui/mouse.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/ui/draggable.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/js/jquery.timer.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/underscore.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/shortcode.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/backbone.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var _wpUtilSettings = {"ajax":{"url":"https:\/\/tinybot.cc\/littlefarm\/wp-admin\/admin-ajax.php"}};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/wp-util.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/wp-backbone.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var _wpMediaModelsL10n = {"settings":{"ajaxurl":"https:\/\/tinybot.cc\/littlefarm\/wp-admin\/admin-ajax.php","post":{"id":0}}};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/media-models.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/plupload/plupload.full.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <!--[if lt IE 8]>
    <script type='text/javascript' src='https://tinybot.cc/littlefarm/wp-includes/js/json2.min.js?ver=1.3.1579&#038;bi=177864704'></script>
    <![endif]-->
    <script type="text/javascript">
    /* <![CDATA[ */
    var pluploadL10n = {"queue_limit_exceeded":"\u4f60\u5617\u8a66\u6392\u7a0b\u904e\u591a\u6a94\u6848\u3002","file_exceeds_size_limit":"%s \u5df2\u8d85\u8d8a\u6b64\u7ad9\u6a94\u6848\u5927\u5c0f\u4e0a\u50b3\u9650\u5236\u3002","zero_byte_file":"\u6b64\u6a94\u6848\u662f\u7a7a\u7684\u3002\u8acb\u9078\u53e6\u5916\u4e00\u500b\u6a94\u6848\u3002","invalid_filetype":"\u6b64\u6a94\u6848\u4e26\u975e\u5141\u8a31\u7684\u683c\u5f0f\u3002\u8acb\u9078\u53e6\u5916\u4e00\u500b\u6a94\u6848\u3002","not_an_image":"\u6b64\u6a94\u6848\u4e0d\u662f\u5716\u7247\u3002\u8acb\u8a66\u8a66\u5176\u4ed6\u6a94\u6848\u3002","image_memory_exceeded":"\u8a18\u61b6\u9ad4\u8d85\u51fa\u53ef\u7528\u7bc4\u570d\u3002\u8acb\u8a66\u8a66\u5176\u4ed6\u5c0f\u4e00\u9ede\u7684\u6a94\u6848\u3002","image_dimensions_exceeded":"\u6b64\u6a94\u5927\u5c0f\u5df2\u8d8a\u904e\u6700\u5927\u9650\u5236\u5927\u5c0f\u3002\u8acb\u5617\u8a66\u5176\u4ed6\u6a94\u6848\u3002","default_error":"\u4e0a\u50b3\u767c\u751f\u932f\u8aa4\u3002\u8acb\u7a0d\u5f8c\u518d\u8a66\u770b\u770b\u3002","missing_upload_url":"\u8a2d\u5b9a\u932f\u8aa4\u3002\u8acb\u6aa2\u67e5\u4f60\u4f3a\u670d\u5668\u7684\u8a2d\u5b9a\u3002","upload_limit_exceeded":"\u4f60\u50c5\u4e0a\u50b3\u4e00\u500b\u6a94\u6848\u3002","http_error":"HTTP \u932f\u8aa4\u3002 \u8acb\u6aa2\u67e5\u4f60\u7684\u7db2\u8def\u72c0\u6cc1\u4e26\u91cd\u65b0\u6574\u7406\u9801\u9762\u3002","upload_failed":"\u4e0a\u50b3\u5931\u6557\u3002 \u8acb\u6aa2\u67e5\u4f60\u7684\u7db2\u8def\u72c0\u6cc1\u4e26\u91cd\u65b0\u6574\u7406\u9801\u9762\u3002","big_upload_failed":"\u8acb\u5617\u8a66\u5229\u7528 %1$s\u700f\u89bd\u5668\u4e0a\u50b3\u4ecb\u9762%2$s \u4e0a\u50b3\u6a94\u6848\u3002","big_upload_queued":"\u7576\u4f60\u4f7f\u7528\u4f60\u7684\u700f\u89bd\u5668\u4e0a\u50b3\u6a94\u6848\u6642\uff0c%s \u8d85\u904e\u4e86\u591a\u6a94\u4e0a\u50b3\u4ecb\u9762\u6700\u5927\u7684\u4e0a\u50b3\u5c3a\u5bf8\u3002","io_error":"IO \u932f\u8aa4\u3002","security_error":"\u5b89\u5168\u6027\u932f\u8aa4\u3002","file_cancelled":"\u6a94\u6848\u5df2\u53d6\u6d88\u3002","upload_stopped":"\u4e0a\u50b3\u5df2\u505c\u6b62\u3002","dismiss":"\u95dc\u9589","crunching":"\u4e0a\u50b3\u57f7\u884c\u4e2d\u2026","deleted":"\u5df2\u79fb\u81f3\u56de\u6536\u6876\u3002","error_uploading":"\u300c%s\u300d\u4e0a\u50b3\u5931\u6557\u3002"};
    var _wpPluploadSettings = {"defaults":{"runtimes":"html5,flash,silverlight,html4","file_data_name":"async-upload","url":"https:\/\/tinybot.cc\/littlefarm\/wp-admin\/async-upload.php","flash_swf_url":"https:\/\/tinybot.cc\/littlefarm\/wp-includes\/js\/plupload\/plupload.flash.swf","silverlight_xap_url":"https:\/\/tinybot.cc\/littlefarm\/wp-includes\/js\/plupload\/plupload.silverlight.xap","filters":{"max_file_size":"5242880b","mime_types":[{"extensions":"jpg,jpeg,jpe,png,ico,pdf,csv,xla,xls,xlt,xlw,xlsx,xlsm,xlsb,svg"}]},"multipart_params":{"action":"upload-attachment","_wpnonce":"97d61dcd21"}},"browser":{"mobile":false,"supported":true},"limitExceeded":false};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/plupload/wp-plupload.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/ui/sortable.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var mejsL10n = {"language":"zh-TW","strings":{"Close":"\u95dc\u9589","Fullscreen":"\u5168\u87a2\u5e55","Turn off Fullscreen":"\u95dc\u9589\u5168\u87a2\u5e55","Go Fullscreen":"\u5168\u87a2\u5e55","Download File":"\u4e0b\u8f09\u6a94\u6848","Download Video":"\u4e0b\u8f09\u5f71\u7247","Play":"\u64ad\u653e","Pause":"\u66ab\u505c","Captions\/Subtitles":"\u5b57\u5e55","None":"None","Time Slider":"\u6642\u9593\u8ef8","Skip back %1 seconds":"\u5f8c\u9000 %1 \u79d2","Video Player":"\u5f71\u7247\u64ad\u653e\u5668","Audio Player":"\u97f3\u6a02\u64ad\u653e\u5668","Volume Slider":"\u97f3\u91cf\u6ed1\u52d5\u8ef8","Mute Toggle":"\u975c\u97f3","Unmute":"\u53d6\u6d88\u975c\u97f3","Mute":"\u975c\u97f3","Use Up\/Down Arrow keys to increase or decrease volume.":"\u4f7f\u7528\u4e0a\uff0f\u4e0b\u65b9\u5411\u9375\u4f86\u63d0\u9ad8\u6216\u964d\u4f4e\u97f3\u91cf\u3002","Use Left\/Right Arrow keys to advance one second, Up\/Down arrows to advance ten seconds.":"\u4f7f\u7528\u5de6\uff0f\u53f3\u7bad\u982d\u9375\u589e\u52a0\u4e00\u79d2\uff0c\u5411\u4e0a\uff0f\u4e0b\u7bad\u982d\u9375\u589e\u52a0\u5341\u79d2\u3002"}};
    var _wpmejsSettings = {"pluginPath":"\/littlefarm\/wp-includes\/js\/mediaelement\/"};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/mediaelement/mediaelement-and-player.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/mediaelement/wp-mediaelement.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var _wpMediaViewsL10n = {"url":"\u93c8\u7d50\u7db2\u5740","addMedia":"\u65b0\u589e\u5a92\u9ad4","search":"\u641c\u5c0b","select":"\u9078\u53d6","cancel":"\u53d6\u6d88","update":"\u66f4\u65b0","replace":"\u53d6\u4ee3","remove":"\u79fb\u9664","back":"\u4e0a\u4e00\u9801","selected":"\u5df2\u9078\u64c7\uff1a%d","dragInfo":"\u62d6\u66f3\u4f86\u91cd\u65b0\u6392\u5e8f\u5a92\u9ad4\u6a94\u6848\u3002","uploadFilesTitle":"\u4e0a\u50b3\u6a94\u6848","uploadImagesTitle":"\u4e0a\u50b3\u5716\u7247","mediaLibraryTitle":"\u5a92\u9ad4\u5eab","insertMediaTitle":"\u63d2\u5165\u5a92\u9ad4","createNewGallery":"\u5efa\u7acb\u65b0\u85dd\u5eca","createNewPlaylist":"\u5efa\u7acb\u4e00\u500b\u65b0\u7684\u64ad\u653e\u6e05\u55ae","createNewVideoPlaylist":"\u5efa\u7acb\u4e00\u500b\u65b0\u7684\u5f71\u7247\u64ad\u653e\u6e05\u55ae","returnToLibrary":"\u2190\u56de\u5230\u5a92\u9ad4\u5eab","allMediaItems":"\u5168\u90e8\u5a92\u9ad4\u6a94\u6848","allDates":"\u5168\u90e8\u65e5\u671f","noItemsFound":"\u627e\u4e0d\u5230\u4efb\u4f55\u9805\u76ee\u3002","insertIntoPost":"\u63d2\u5165\u81f3\u6587\u7ae0","unattached":"\u5c1a\u672a\u95dc\u806f","trash":"\u56de\u6536\u6876","uploadedToThisPost":"\u4e0a\u50b3\u5230\u9019\u7bc7\u6587\u7ae0","warnDelete":"\u8981\u6c38\u4e45\u522a\u9664\u6b64\u9805\u76ee\u8acb\u6309\u300c\u78ba\u5b9a\u300d\uff0c\u505c\u6b62\u8acb\u6309\u300c\u53d6\u6d88\u300d\u3002","warnBulkDelete":"\u4f60\u5c07\u6c38\u4e45\u522a\u9664\u9019\u4e9b\u9805\u76ee\u3002\n\u9ede\u9078\u300c\u53d6\u6d88\u300d\u505c\u6b62\uff0c\u9ede\u9078\u300c\u78ba\u5b9a\u300d\u522a\u9664\u3002","warnBulkTrash":"\u4f60\u5c07\u522a\u9664\u9019\u4e9b\u9805\u76ee\u3002\n\u9ede\u9078\u300c\u53d6\u6d88\u300d\u505c\u6b62\uff0c\u9ede\u9078\u300c\u78ba\u5b9a\u300d\u522a\u9664\u3002","bulkSelect":"\u6279\u6b21\u9078\u64c7","cancelSelection":"\u53d6\u6d88\u9078\u64c7","trashSelected":"\u522a\u9664\u6240\u9078","untrashSelected":"\u9084\u539f\u6240\u9078","deleteSelected":"\u6c38\u4e45\u522a\u9664\u6240\u9078","deletePermanently":"\u6c38\u4e45\u522a\u9664","apply":"\u5957\u7528","filterByDate":"\u6309\u65e5\u671f\u7be9\u9078","filterByType":"\u6309\u985e\u578b\u7be9\u9078","searchMediaLabel":"\u641c\u5c0b\u5a92\u9ad4","searchMediaPlaceholder":"\u641c\u5c0b\u5a92\u9ad4\u9805\u76ee\u2026","noMedia":"\u627e\u4e0d\u5230\u5a92\u9ad4\u6a94\u6848\u3002","attachmentDetails":"\u9644\u4ef6\u8cc7\u8a0a","insertFromUrlTitle":"\u81ea\u7db2\u5740\u63d2\u5165","setFeaturedImageTitle":"\u7279\u8272\u5716\u7247","setFeaturedImage":"\u8a2d\u5b9a\u7279\u8272\u5716\u7247","createGalleryTitle":"","editGalleryTitle":"\u7de8\u8f2f\u85dd\u5eca","cancelGalleryTitle":"\u2190 \u95dc\u9589\u85dd\u5eca","insertGallery":"\u63d2\u5165\u85dd\u5eca","updateGallery":"\u66f4\u65b0\u85dd\u5eca","addToGallery":"\u52a0\u5165\u81f3\u85dd\u5eca","addToGalleryTitle":"\u589e\u52a0\u81f3\u85dd\u5eca","reverseOrder":"\u53cd\u5411\u6392\u5e8f","imageDetailsTitle":"\u5716\u7247\u8cc7\u8a0a","imageReplaceTitle":"\u53d6\u4ee3\u5716\u7247","imageDetailsCancel":"\u53d6\u6d88\u7de8\u8f2f","editImage":"\u7de8\u8f2f\u5716\u7247","chooseImage":"\u9078\u64c7\u5716\u7247","selectAndCrop":"\u9078\u53d6\u4e26\u88c1\u5207","skipCropping":"\u7565\u904e\u88c1\u5207","cropImage":"\u88c1\u5207\u5716\u7247","cropYourImage":"\u88c1\u5207\u4f60\u7684\u5716\u7247","cropping":"\u88c1\u5207\u4e2d\u2026","suggestedDimensions":"\u5efa\u8b70\u7684\u5716\u7247\u5c3a\u5bf8\uff1a","cropError":"\u5728\u88c1\u5207\u5716\u7247\u904e\u7a0b\u4e2d\u767c\u751f\u932f\u8aa4\u3002","audioDetailsTitle":"\u97f3\u8a0a\u8cc7\u8a0a","audioReplaceTitle":"\u66ff\u63db\u97f3\u8a0a","audioAddSourceTitle":"\u65b0\u589e\u97f3\u8a0a\u4f86\u6e90","audioDetailsCancel":"\u53d6\u6d88\u7de8\u8f2f","videoDetailsTitle":"\u5f71\u7247\u8cc7\u8a0a","videoReplaceTitle":"\u66ff\u63db\u5f71\u7247","videoAddSourceTitle":"\u65b0\u589e\u5f71\u7247\u4f86\u6e90","videoDetailsCancel":"\u53d6\u6d88\u7de8\u8f2f","videoSelectPosterImageTitle":"\u9078\u64c7\u6d77\u5831\u5716\u7247","videoAddTrackTitle":"\u65b0\u589e\u5b57\u5e55","playlistDragInfo":"\u62d6\u653e\u4f86\u91cd\u65b0\u6392\u5217\u66f2\u76ee\u3002","createPlaylistTitle":"\u5efa\u7acb\u97f3\u8a0a\u64ad\u653e\u6e05\u55ae","editPlaylistTitle":"\u7de8\u8f2f\u97f3\u8a0a\u64ad\u653e\u6e05\u55ae","cancelPlaylistTitle":"\u2190 \u53d6\u6d88\u97f3\u8a0a\u64ad\u653e\u6e05\u55ae","insertPlaylist":"\u63d2\u5165\u97f3\u8a0a\u64ad\u653e\u6e05\u55ae","updatePlaylist":"\u66f4\u65b0\u97f3\u8a0a\u64ad\u653e\u6e05\u55ae","addToPlaylist":"\u52a0\u5165\u81f3\u97f3\u8a0a\u64ad\u653e\u6e05\u55ae","addToPlaylistTitle":"\u52a0\u5165\u81f3\u97f3\u8a0a\u64ad\u653e\u6e05\u55ae","videoPlaylistDragInfo":"\u62d6\u653e\u4f86\u91cd\u65b0\u6392\u5217\u5f71\u7247\u3002","createVideoPlaylistTitle":"\u5efa\u7acb\u5f71\u7247\u64ad\u653e\u6e05\u55ae","editVideoPlaylistTitle":"\u7de8\u8f2f\u5f71\u7247\u64ad\u653e\u6e05\u55ae","cancelVideoPlaylistTitle":"\u2190 \u53d6\u6d88\u5f71\u7247\u64ad\u653e\u6e05\u55ae","insertVideoPlaylist":"\u63d2\u5165\u5f71\u7247\u64ad\u653e\u6e05\u55ae","updateVideoPlaylist":"\u66f4\u65b0\u5f71\u7247\u64ad\u653e\u6e05\u55ae","addToVideoPlaylist":"\u65b0\u589e\u81f3\u5f71\u7247\u64ad\u653e\u6e05\u55ae","addToVideoPlaylistTitle":"\u65b0\u589e\u81f3\u5f71\u7247\u64ad\u653e\u6e05\u55ae","settings":{"tabs":{"pexels_fsp_tab":"\u641c\u5c0b\u7dda\u4e0a\u5716\u5eab"},"tabUrl":"https:\/\/tinybot.cc\/littlefarm\/wp-admin\/media-upload.php?chromeless=1","mimeTypes":{"image":"\u5716\u7247","audio":"\u97f3\u8a0a","video":"\u5f71\u7247"},"captions":true,"nonce":{"sendToEditor":"3e7b04a365"},"post":{"id":0},"defaultProps":{"link":"none","align":"","size":""},"attachmentCounts":{"audio":0,"video":0},"embedExts":["mp3","ogg","wma","m4a","wav","mp4","m4v","webm","ogv","wmv","flv"],"embedMimes":[],"contentWidth":640,"months":[{"year":"2019","month":"8","text":"2019 \u5e74 \u516b\u6708"},{"year":"2019","month":"1","text":"2019 \u5e74 \u4e00\u6708"},{"year":"2018","month":"4","text":"2018 \u5e74 \u56db\u6708"}],"mediaTrash":0}};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/media-views.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-admin/js/editor.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var thickboxL10n = {"next":"\u5f8c\u4e00\u9805 >","prev":"< \u524d\u4e00\u9805","image":"\u5716\u7247","of":"\u7684","close":"\u95dc\u9589","noiframes":"\u9019\u9805\u529f\u80fd\u9700\u8981 iframe\u3002\u4f60\u505c\u7528\u4e86 iframe \u529f\u80fd\u6216\u8005\u4f60\u7684\u700f\u89bd\u5668\u4e0d\u652f\u63f4\u5b83\u5011\u3002","loadingAnimation":"https:\/\/tinybot.cc\/littlefarm\/wp-includes\/js\/thickbox\/loadingAnimation.gif"};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/thickbox/thickbox.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/ui/slider.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/jquery.ui.touch-punch.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-admin/js/iris.min.js?ver=1.3.1579&amp;bi=177864704"></script><style id="iris-css">.iris-picker{display:block;position:relative}.iris-picker,.iris-picker *{-moz-box-sizing:content-box;-webkit-box-sizing:content-box;box-sizing:content-box}input+.iris-picker{margin-top:4px}.iris-error{background-color:#ffafaf}.iris-border{border-radius:3px;border:1px solid #aaa;width:200px;background-color:#fff}.iris-picker-inner{position:absolute;top:0;right:0;left:0;bottom:0}.iris-border .iris-picker-inner{top:10px;right:10px;left:10px;bottom:10px}.iris-picker .iris-square-inner{position:absolute;left:0;right:0;top:0;bottom:0}.iris-picker .iris-square,.iris-picker .iris-slider,.iris-picker .iris-square-inner,.iris-picker .iris-palette{border-radius:3px;box-shadow:inset 0 0 5px rgba(0,0,0,.4);height:100%;width:12.5%;float:left;margin-right:5%}.iris-only-strip .iris-slider{width:100%}.iris-picker .iris-square{width:76%;margin-right:10%;position:relative}.iris-only-strip .iris-square{display:none}.iris-picker .iris-square-inner{width:auto;margin:0}.iris-ie-9 .iris-square,.iris-ie-9 .iris-slider,.iris-ie-9 .iris-square-inner,.iris-ie-9 .iris-palette{box-shadow:none;border-radius:0}.iris-ie-9 .iris-square,.iris-ie-9 .iris-slider,.iris-ie-9 .iris-palette{outline:1px solid rgba(0,0,0,.1)}.iris-ie-lt9 .iris-square,.iris-ie-lt9 .iris-slider,.iris-ie-lt9 .iris-square-inner,.iris-ie-lt9 .iris-palette{outline:1px solid #aaa}.iris-ie-lt9 .iris-square .ui-slider-handle{outline:1px solid #aaa;background-color:#fff;-ms-filter:"alpha(Opacity=30)"}.iris-ie-lt9 .iris-square .iris-square-handle{background:0 0;border:3px solid #fff;-ms-filter:"alpha(Opacity=50)"}.iris-picker .iris-strip{margin-right:0;position:relative}.iris-picker .iris-strip .ui-slider-handle{position:absolute;background:0 0;margin:0;right:-3px;left:-3px;border:4px solid #aaa;border-width:4px 3px;width:auto;height:6px;border-radius:4px;box-shadow:0 1px 2px rgba(0,0,0,.2);opacity:.9;z-index:5;cursor:ns-resize}.iris-strip-horiz .iris-strip .ui-slider-handle{right:auto;left:auto;bottom:-3px;top:-3px;height:auto;width:6px;cursor:ew-resize}.iris-strip .ui-slider-handle:before{content:" ";position:absolute;left:-2px;right:-2px;top:-3px;bottom:-3px;border:2px solid #fff;border-radius:3px}.iris-picker .iris-slider-offset{position:absolute;top:11px;left:0;right:0;bottom:-3px;width:auto;height:auto;background:transparent;border:0;border-radius:0}.iris-strip-horiz .iris-slider-offset{top:0;bottom:0;right:11px;left:-3px}.iris-picker .iris-square-handle{background:transparent;border:5px solid #aaa;border-radius:50%;border-color:rgba(128,128,128,.5);box-shadow:none;width:12px;height:12px;position:absolute;left:-10px;top:-10px;cursor:move;opacity:1;z-index:10}.iris-picker .ui-state-focus .iris-square-handle{opacity:.8}.iris-picker .iris-square-handle:hover{border-color:#999}.iris-picker .iris-square-value:focus .iris-square-handle{box-shadow:0 0 2px rgba(0,0,0,.75);opacity:.8}.iris-picker .iris-square-handle:hover::after{border-color:#fff}.iris-picker .iris-square-handle::after{position:absolute;bottom:-4px;right:-4px;left:-4px;top:-4px;border:3px solid #f9f9f9;border-color:rgba(255,255,255,.8);border-radius:50%;content:" "}.iris-picker .iris-square-value{width:8px;height:8px;position:absolute}.iris-ie-lt9 .iris-square-value,.iris-mozilla .iris-square-value{width:1px;height:1px}.iris-palette-container{position:absolute;bottom:0;left:0;margin:0;padding:0}.iris-border .iris-palette-container{left:10px;bottom:10px}.iris-picker .iris-palette{margin:0;cursor:pointer}.iris-square-handle,.ui-slider-handle{border:0;outline:0}</style>
    <script type="text/javascript">
    /* <![CDATA[ */
    var wpColorPickerL10n = {"clear":"\u6e05\u9664","defaultString":"\u9810\u8a2d","pick":"\u9078\u64c7\u984f\u8272","current":"\u7576\u524d\u984f\u8272"};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-admin/js/color-picker.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-admin/js/custom-background.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-admin/js/media-upload.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce/assets/js/jquery-tiptip/jquery.tipTip.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://tinybot.cc/littlefarm/wp-includes/js/jquery/ui/datepicker.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    jQuery(document).ready(function(jQuery){jQuery.datepicker.setDefaults({"closeText":"\u95dc\u9589","currentText":"\u4eca\u5929","monthNames":["\u4e00\u6708","\u4e8c\u6708","\u4e09\u6708","\u56db\u6708","\u4e94\u6708","\u516d\u6708","\u4e03\u6708","\u516b\u6708","\u4e5d\u6708","\u5341\u6708","\u5341\u4e00\u6708","\u5341\u4e8c\u6708"],"monthNamesShort":["\u4e00\u6708","\u4e8c\u6708","\u4e09\u6708","\u56db\u6708","\u4e94\u6708","\u516d\u6708","\u4e03\u6708","\u516b\u6708","\u4e5d\u6708","\u5341\u6708","\u5341\u4e00\u6708","\u5341\u4e8c\u6708"],"nextText":"\u4e0b\u4e00\u6b65","prevText":"\u4e0a\u4e00\u500b","dayNames":["\u661f\u671f\u65e5","\u661f\u671f\u4e00","\u661f\u671f\u4e8c","\u661f\u671f\u4e09","\u661f\u671f\u56db","\u661f\u671f\u4e94","\u661f\u671f\u516d"],"dayNamesShort":["\u9031\u65e5","\u9031\u4e00","\u9031\u4e8c","\u9031\u4e09","\u9031\u56db","\u9031\u4e94","\u9031\u516d"],"dayNamesMin":["\u65e5","\u4e00","\u4e8c","\u4e09","\u56db","\u4e94","\u516d"],"dateFormat":"yy-mm-dd","firstDay":0,"isRTL":false});});
    </script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce/assets/js/selectWoo/selectWoo.full.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var wc_enhanced_select_params = {"i18n_no_matches":"\u627e\u4e0d\u5230\u7b26\u5408\u7684","i18n_ajax_error":"\u8f09\u5165\u5931\u6557","i18n_input_too_short_1":"\u8acb\u8f38\u5165 1 \u500b\u6216\u66f4\u591a\u5b57","i18n_input_too_short_n":"\u8acb\u8f38\u5165 %qty% \u6216\u66f4\u591a\u7684\u5b57","i18n_input_too_long_1":"\u8acb\u522a\u9664 1 ","i18n_input_too_long_n":"\u8acb\u522a\u9664 %qty%","i18n_selection_too_long_1":"\u4f60\u53ea\u80fd\u5920\u9078 1 \u500b\u9805\u76ee","i18n_selection_too_long_n":"\u4f60\u53ea\u80fd\u5920\u9078 %qty% \u500b\u9805\u76ee","i18n_load_more":"\u8f09\u5165\u66f4\u591a\u7d50\u679c\u2026","i18n_searching":"\u641c\u5c0b\u4e2d\u2026","ajax_url":"https:\/\/tinybot.cc\/littlefarm\/wp-admin\/admin-ajax.php","search_products_nonce":"9f00190a4b","search_customers_nonce":"6d82964dc9","search_categories_nonce":"dc0e93b28e"};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce/assets/js/admin/wc-enhanced-select.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce/assets/js/jquery-blockui/jquery.blockUI.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var wc_crm_params = {"copy_billing":"Copy billing information to shipping information? This will remove any currently entered shipping information.","load_billing":"Load the customer's billing information? This will remove any currently entered billing information.","load_shipping":"Load the customer's shipping information? This will remove any currently entered shipping information.","ajax_url":"https:\/\/tinybot.cc\/littlefarm\/wp-admin\/admin-ajax.php","get_customer_details_nonce":"a620208bbd","add_order_note_nonce":"49593ee882","delete_order_note_nonce":"b23d5afa1c","post_id":"0","countries":"{\"AF\":[],\"AT\":[],\"AX\":[],\"BE\":[],\"BH\":[],\"BI\":[],\"CZ\":[],\"DE\":[],\"DK\":[],\"EE\":[],\"FI\":[],\"FR\":[],\"GP\":[],\"GF\":[],\"IS\":[],\"IL\":[],\"IM\":[],\"KR\":[],\"KW\":[],\"LB\":[],\"LU\":[],\"MQ\":[],\"NL\":[],\"NO\":[],\"PL\":[],\"PT\":[],\"RE\":[],\"SG\":[],\"SK\":[],\"SI\":[],\"LK\":[],\"SE\":[],\"VN\":[],\"YT\":[],\"AO\":{\"BGO\":\"Bengo\",\"BLU\":\"Benguela\",\"BIE\":\"Bi\\u00e9\",\"CAB\":\"Cabinda\",\"CNN\":\"Cunene\",\"HUA\":\"Huambo\",\"HUI\":\"Hu\\u00edla\",\"CCU\":\"Kuando Kubango\",\"CNO\":\"Kwanza-Norte\",\"CUS\":\"Kwanza-Sul\",\"LUA\":\"Luanda\",\"LNO\":\"Lunda-Norte\",\"LSU\":\"Lunda-Sul\",\"MAL\":\"Malanje\",\"MOX\":\"Moxico\",\"NAM\":\"Namibe\",\"UIG\":\"U\\u00edge\",\"ZAI\":\"Zaire\"},\"AR\":{\"C\":\"Ciudad Aut\u00f3noma de Buenos Aires\",\"B\":\"Buenos Aires\",\"K\":\"Catamarca\",\"H\":\"Chaco\",\"U\":\"Chubut\",\"X\":\"C\u00f3rdoba\",\"W\":\"Corrientes\",\"E\":\"Entre R\u00edos\",\"P\":\"Formosa\",\"Y\":\"Jujuy\",\"L\":\"La Pampa\",\"F\":\"La Rioja\",\"M\":\"Mendoza\",\"N\":\"Misiones\",\"Q\":\"Neuqu\u00e9n\",\"R\":\"R\u00edo Negro\",\"A\":\"Salta\",\"J\":\"San Juan\",\"D\":\"San Luis\",\"Z\":\"Santa Cruz\",\"S\":\"Santa Fe\",\"G\":\"Santiago del Estero\",\"V\":\"Tierra del Fuego\",\"T\":\"Tucum\u00e1n\"},\"AU\":{\"ACT\":\"Australian Capital Territory\",\"NSW\":\"New South Wales\",\"NT\":\"Northern Territory\",\"QLD\":\"Queensland\",\"SA\":\"South Australia\",\"TAS\":\"Tasmania\",\"VIC\":\"Victoria\",\"WA\":\"Western Australia\"},\"BD\":{\"BD-05\":\"Bagerhat\",\"BD-01\":\"Bandarban\",\"BD-02\":\"Barguna\",\"BD-06\":\"Barishal\",\"BD-07\":\"Bhola\",\"BD-03\":\"Bogura\",\"BD-04\":\"Brahmanbaria\",\"BD-09\":\"Chandpur\",\"BD-10\":\"\\u5409\\u5927\\u6e2f\",\"BD-12\":\"Chuadanga\",\"BD-11\":\"Cox's Bazar\",\"BD-08\":\"Cumilla\",\"BD-13\":\"Dhaka\",\"BD-14\":\"Dinajpur\",\"BD-15\":\"Faridpur \",\"BD-16\":\"Feni\",\"BD-19\":\"Gaibandha\",\"BD-18\":\"Gazipur\",\"BD-17\":\"Gopalganj\",\"BD-20\":\"Habiganj\",\"BD-21\":\"Jamalpur\",\"BD-22\":\"\\u5091\\u7d22\\u723e\\u7e23\",\"BD-25\":\"Jhalokati\",\"BD-23\":\"Jhenaidah\",\"BD-24\":\"Joypurhat\",\"BD-29\":\"Khagrachhari\",\"BD-27\":\"Khulna\",\"BD-26\":\"Kishoreganj\",\"BD-28\":\"Kurigram\",\"BD-30\":\"Kushtia\",\"BD-31\":\"Lakshmipur\",\"BD-32\":\"Lalmonirhat\",\"BD-36\":\"Madaripur\",\"BD-37\":\"Magura\",\"BD-33\":\"Manikganj \",\"BD-39\":\"Meherpur\",\"BD-38\":\"Moulvibazar\",\"BD-35\":\"Munshiganj\",\"BD-34\":\"Mymensingh\",\"BD-48\":\"Naogaon\",\"BD-43\":\"Narail\",\"BD-40\":\"Narayanganj\",\"BD-42\":\"Narsingdi\",\"BD-44\":\"Natore\",\"BD-45\":\"Nawabganj\",\"BD-41\":\"Netrakona\",\"BD-46\":\"Nilphamari\",\"BD-47\":\"Noakhali\",\"BD-49\":\"Pabna\",\"BD-52\":\"Panchagarh\",\"BD-51\":\"Patuakhali\",\"BD-50\":\"Pirojpur\",\"BD-53\":\"Rajbari\",\"BD-54\":\"Rajshahi\",\"BD-56\":\"Rangamati\",\"BD-55\":\"Rangpur\",\"BD-58\":\"Satkhira\",\"BD-62\":\"Shariatpur\",\"BD-57\":\"Sherpur\",\"BD-59\":\"Sirajganj\",\"BD-61\":\"Sunamganj\",\"BD-60\":\"Sylhet\",\"BD-63\":\"Tangail\",\"BD-64\":\"Thakurgaon\"},\"BO\":{\"B\":\"\\u4e18\\u57fa\\u85a9\\u5361\\u7701\",\"H\":\"Beni\",\"C\":\"\\u79d1\\u6070\\u73ed\\u5df4\",\"L\":\"La Paz\",\"O\":\"Oruro\",\"N\":\"Pando\",\"P\":\"Potos\\u00ed\",\"S\":\"Santa Cruz\",\"T\":\"Tarija\"},\"BR\":{\"AC\":\"Acre\",\"AL\":\"Alagoas\",\"AP\":\"Amap\u00e1\",\"AM\":\"Amazonas\",\"BA\":\"Bahia\",\"CE\":\"Cear\u00e1\",\"DF\":\"Distrito Federal\",\"ES\":\"Esp\u00edrito Santo\",\"GO\":\"Goi\u00e1s\",\"MA\":\"Maranh\u00e3o\",\"MT\":\"Mato Grosso\",\"MS\":\"Mato Grosso do Sul\",\"MG\":\"Minas Gerais\",\"PA\":\"Par\u00e1\",\"PB\":\"Para\u00edba\",\"PR\":\"Paran\u00e1\",\"PE\":\"Pernambuco\",\"PI\":\"Piau\u00ed\",\"RJ\":\"Rio de Janeiro\",\"RN\":\"Rio Grande do Norte\",\"RS\":\"Rio Grande do Sul\",\"RO\":\"Rond\u00f4nia\",\"RR\":\"Roraima\",\"SC\":\"Santa Catarina\",\"SP\":\"S\u00e3o Paulo\",\"SE\":\"Sergipe\",\"TO\":\"Tocantins\"},\"BG\":{\"BG-01\":\"Blagoevgrad\",\"BG-02\":\"Burgas\",\"BG-08\":\"Dobrich\",\"BG-07\":\"Gabrovo\",\"BG-26\":\"Haskovo\",\"BG-09\":\"Kardzhali\",\"BG-10\":\"Kyustendil\",\"BG-11\":\"Lovech\",\"BG-12\":\"Montana\",\"BG-13\":\"Pazardzhik\",\"BG-14\":\"Pernik\",\"BG-15\":\"Pleven\",\"BG-16\":\"Plovdiv\",\"BG-17\":\"Razgrad\",\"BG-18\":\"Ruse\",\"BG-27\":\"Shumen\",\"BG-19\":\"Silistra\",\"BG-20\":\"Sliven\",\"BG-21\":\"Smolyan\",\"BG-23\":\"Sofia\",\"BG-22\":\"Sofia-Grad\",\"BG-24\":\"Stara Zagora\",\"BG-25\":\"Targovishte\",\"BG-03\":\"Varna\",\"BG-04\":\"Veliko Tarnovo\",\"BG-05\":\"Vidin\",\"BG-06\":\"Vratsa\",\"BG-28\":\"Yambol\"},\"CA\":{\"AB\":\"Alberta\",\"BC\":\"British Columbia\",\"MB\":\"Manitoba\",\"NB\":\"New Brunswick\",\"NL\":\"Newfoundland and Labrador\",\"NT\":\"Northwest Territories\",\"NS\":\"Nova Scotia\",\"NU\":\"Nunavut\",\"ON\":\"Ontario\",\"PE\":\"Prince Edward Island\",\"QC\":\"Quebec\",\"SK\":\"Saskatchewan\",\"YT\":\"Yukon Territory\"},\"GR\":{\"I\":\"\\u0391\\u03c4\\u03c4\\u03b9\\u03ba\\u03ae\",\"A\":\"\\u0391\\u03bd\\u03b1\\u03c4\\u03bf\\u03bb\\u03b9\\u03ba\\u03ae \\u039c\\u03b1\\u03ba\\u03b5\\u03b4\\u03bf\\u03bd\\u03af\\u03b1 \\u03ba\\u03b1\\u03b9 \\u0398\\u03c1\\u03ac\\u03ba\\u03b7\",\"B\":\"\\u039a\\u03b5\\u03bd\\u03c4\\u03c1\\u03b9\\u03ba\\u03ae \\u039c\\u03b1\\u03ba\\u03b5\\u03b4\\u03bf\\u03bd\\u03af\\u03b1\",\"C\":\"\\u0394\\u03c5\\u03c4\\u03b9\\u03ba\\u03ae \\u039c\\u03b1\\u03ba\\u03b5\\u03b4\\u03bf\\u03bd\\u03af\\u03b1\",\"D\":\"\\u0389\\u03c0\\u03b5\\u03b9\\u03c1\\u03bf\\u03c2\",\"E\":\"\\u0398\\u03b5\\u03c3\\u03c3\\u03b1\\u03bb\\u03af\\u03b1\",\"F\":\"\\u0399\\u03cc\\u03bd\\u03b9\\u03bf\\u03b9 \\u039d\\u03ae\\u03c3\\u03bf\\u03b9\",\"G\":\"\\u0394\\u03c5\\u03c4\\u03b9\\u03ba\\u03ae \\u0395\\u03bb\\u03bb\\u03ac\\u03b4\\u03b1\",\"H\":\"\\u03a3\\u03c4\\u03b5\\u03c1\\u03b5\\u03ac \\u0395\\u03bb\\u03bb\\u03ac\\u03b4\\u03b1\",\"J\":\"\\u03a0\\u03b5\\u03bb\\u03bf\\u03c0\\u03cc\\u03bd\\u03bd\\u03b7\\u03c3\\u03bf\\u03c2\",\"K\":\"\\u0392\\u03cc\\u03c1\\u03b5\\u03b9\\u03bf \\u0391\\u03b9\\u03b3\\u03b1\\u03af\\u03bf\",\"L\":\"\\u039d\\u03cc\\u03c4\\u03b9\\u03bf \\u0391\\u03b9\\u03b3\\u03b1\\u03af\\u03bf\",\"M\":\"\\u039a\\u03c1\\u03ae\\u03c4\\u03b7\"},\"HU\":{\"BK\":\"B\\u00e1cs-Kiskun\",\"BE\":\"B\\u00e9k\\u00e9s\",\"BA\":\"Baranya\",\"BZ\":\"Borsod-Aba\\u00faj-Zempl\\u00e9n\",\"BU\":\"Budapest\",\"CS\":\"Csongr\\u00e1d\",\"FE\":\"Fej\\u00e9r\",\"GS\":\"Gy\\u0151r-Moson-Sopron\",\"HB\":\"Hajd\\u00fa-Bihar\",\"HE\":\"Heves\",\"JN\":\"J\\u00e1sz-Nagykun-Szolnok\",\"KE\":\"Kom\\u00e1rom-Esztergom\",\"NO\":\"N\\u00f3gr\\u00e1d\",\"PE\":\"Pest\",\"SO\":\"Somogy\",\"SZ\":\"Szabolcs-Szatm\\u00e1r-Bereg\",\"TO\":\"Tolna\",\"VA\":\"Vas\",\"VE\":\"Veszpr\\u00e9m\",\"ZA\":\"Zala\"},\"IN\":{\"AP\":\"Andhra Pradesh\",\"AR\":\"Arunachal Pradesh\",\"AS\":\"Assam\",\"BR\":\"Bihar\",\"CT\":\"Chhattisgarh\",\"GA\":\"Goa\",\"GJ\":\"Gujarat\",\"HR\":\"Haryana\",\"HP\":\"Himachal Pradesh\",\"JK\":\"Jammu and Kashmir\",\"JH\":\"Jharkhand\",\"KA\":\"Karnataka\",\"KL\":\"Kerala\",\"MP\":\"Madhya Pradesh\",\"MH\":\"Maharashtra\",\"MN\":\"Manipur\",\"ML\":\"Meghalaya\",\"MZ\":\"Mizoram\",\"NL\":\"Nagaland\",\"OR\":\"Orissa\",\"PB\":\"Punjab\",\"RJ\":\"Rajasthan\",\"SK\":\"Sikkim\",\"TN\":\"Tamil Nadu\",\"TS\":\"Telangana\",\"TR\":\"Tripura\",\"UK\":\"Uttarakhand\",\"UP\":\"Uttar Pradesh\",\"WB\":\"West Bengal\",\"AN\":\"Andaman and Nicobar Islands\",\"CH\":\"Chandigarh\",\"DN\":\"Dadra and Nagar Haveli\",\"DD\":\"Daman and Diu\",\"DL\":\"Delhi\",\"LD\":\"Lakshadeep\",\"PY\":\"Pondicherry (Puducherry)\"},\"ID\":{\"AC\":\"Daerah Istimewa Aceh\",\"SU\":\"Sumatera Utara\",\"SB\":\"Sumatera Barat\",\"RI\":\"Riau\",\"KR\":\"Kepulauan Riau\",\"JA\":\"Jambi\",\"SS\":\"Sumatera Selatan\",\"BB\":\"Bangka Belitung\",\"BE\":\"Bengkulu\",\"LA\":\"Lampung\",\"JK\":\"DKI Jakarta\",\"JB\":\"Jawa Barat\",\"BT\":\"Banten\",\"JT\":\"Jawa Tengah\",\"JI\":\"Jawa Timur\",\"YO\":\"Daerah Istimewa Yogyakarta\",\"BA\":\"Bali\",\"NB\":\"Nusa Tenggara Barat\",\"NT\":\"Nusa Tenggara Timur\",\"KB\":\"Kalimantan Barat\",\"KT\":\"Kalimantan Tengah\",\"KI\":\"Kalimantan Timur\",\"KS\":\"Kalimantan Selatan\",\"KU\":\"Kalimantan Utara\",\"SA\":\"Sulawesi Utara\",\"ST\":\"Sulawesi Tengah\",\"SG\":\"Sulawesi Tenggara\",\"SR\":\"Sulawesi Barat\",\"SN\":\"Sulawesi Selatan\",\"GO\":\"Gorontalo\",\"MA\":\"Maluku\",\"MU\":\"Maluku Utara\",\"PA\":\"Papua\",\"PB\":\"Papua Barat\"},\"IR\":{\"KHZ\":\"Khuzestan  (\\u062e\\u0648\\u0632\\u0633\\u062a\\u0627\\u0646)\",\"THR\":\"Tehran  (\\u062a\\u0647\\u0631\\u0627\\u0646)\",\"ILM\":\"Ilaam (\\u0627\\u06cc\\u0644\\u0627\\u0645)\",\"BHR\":\"Bushehr (\\u0628\\u0648\\u0634\\u0647\\u0631)\",\"ADL\":\"Ardabil (\\u0627\\u0631\\u062f\\u0628\\u06cc\\u0644)\",\"ESF\":\"Isfahan (\\u0627\\u0635\\u0641\\u0647\\u0627\\u0646)\",\"YZD\":\"Yazd (\\u06cc\\u0632\\u062f)\",\"KRH\":\"Kermanshah (\\u06a9\\u0631\\u0645\\u0627\\u0646\\u0634\\u0627\\u0647)\",\"KRN\":\"Kerman (\\u06a9\\u0631\\u0645\\u0627\\u0646)\",\"HDN\":\"Hamadan (\\u0647\\u0645\\u062f\\u0627\\u0646)\",\"GZN\":\"Ghazvin (\\u0642\\u0632\\u0648\\u06cc\\u0646)\",\"ZJN\":\"Zanjan (\\u0632\\u0646\\u062c\\u0627\\u0646)\",\"LRS\":\"Luristan (\\u0644\\u0631\\u0633\\u062a\\u0627\\u0646)\",\"ABZ\":\"Alborz (\\u0627\\u0644\\u0628\\u0631\\u0632)\",\"EAZ\":\"East Azarbaijan (\\u0622\\u0630\\u0631\\u0628\\u0627\\u06cc\\u062c\\u0627\\u0646 \\u0634\\u0631\\u0642\\u06cc)\",\"WAZ\":\"West Azarbaijan (\\u0622\\u0630\\u0631\\u0628\\u0627\\u06cc\\u062c\\u0627\\u0646 \\u063a\\u0631\\u0628\\u06cc)\",\"CHB\":\"Chaharmahal and Bakhtiari (\\u0686\\u0647\\u0627\\u0631\\u0645\\u062d\\u0627\\u0644 \\u0648 \\u0628\\u062e\\u062a\\u06cc\\u0627\\u0631\\u06cc)\",\"SKH\":\"South Khorasan (\\u062e\\u0631\\u0627\\u0633\\u0627\\u0646 \\u062c\\u0646\\u0648\\u0628\\u06cc)\",\"RKH\":\"Razavi Khorasan (\\u062e\\u0631\\u0627\\u0633\\u0627\\u0646 \\u0631\\u0636\\u0648\\u06cc)\",\"NKH\":\"North Khorasan (\\u062e\\u0631\\u0627\\u0633\\u0627\\u0646 \\u062c\\u0646\\u0648\\u0628\\u06cc)\",\"SMN\":\"Semnan (\\u0633\\u0645\\u0646\\u0627\\u0646)\",\"FRS\":\"Fars (\\u0641\\u0627\\u0631\\u0633)\",\"QHM\":\"Qom (\\u0642\\u0645)\",\"KRD\":\"Kurdistan \\\/ \\u06a9\\u0631\\u062f\\u0633\\u062a\\u0627\\u0646)\",\"KBD\":\"Kohgiluyeh and BoyerAhmad (\\u06a9\\u0647\\u06af\\u06cc\\u0644\\u0648\\u06cc\\u06cc\\u0647 \\u0648 \\u0628\\u0648\\u06cc\\u0631\\u0627\\u062d\\u0645\\u062f)\",\"GLS\":\"Golestan (\\u06af\\u0644\\u0633\\u062a\\u0627\\u0646)\",\"GIL\":\"Gilan (\\u06af\\u06cc\\u0644\\u0627\\u0646)\",\"MZN\":\"Mazandaran (\\u0645\\u0627\\u0632\\u0646\\u062f\\u0631\\u0627\\u0646)\",\"MKZ\":\"Markazi (\\u0645\\u0631\\u06a9\\u0632\\u06cc)\",\"HRZ\":\"Hormozgan (\\u0647\\u0631\\u0645\\u0632\\u06af\\u0627\\u0646)\",\"SBN\":\"Sistan and Baluchestan (\\u0633\\u06cc\\u0633\\u062a\\u0627\\u0646 \\u0648 \\u0628\\u0644\\u0648\\u0686\\u0633\\u062a\\u0627\\u0646)\"},\"IE\":{\"CW\":\"Carlow\",\"CN\":\"Cavan\",\"CE\":\"Clare\",\"CO\":\"Cork\",\"DL\":\"Donegal\",\"D\":\"Dublin\",\"G\":\"Galway\",\"KY\":\"Kerry\",\"KE\":\"Kildare\",\"KK\":\"Kilkenny\",\"LS\":\"Laois\",\"LM\":\"Leitrim\",\"LK\":\"Limerick\",\"LD\":\"Longford\",\"LH\":\"Louth\",\"MO\":\"Mayo\",\"MH\":\"Meath\",\"MN\":\"Monaghan\",\"OY\":\"Offaly\",\"RN\":\"Roscommon\",\"SO\":\"Sligo\",\"TA\":\"Tipperary\",\"WD\":\"Waterford\",\"WH\":\"Westmeath\",\"WX\":\"Wexford\",\"WW\":\"Wicklow\"},\"IT\":{\"AG\":\"Agrigento\",\"AL\":\"Alessandria\",\"AN\":\"Ancona\",\"AO\":\"Aosta\",\"AR\":\"Arezzo\",\"AP\":\"Ascoli Piceno\",\"AT\":\"Asti\",\"AV\":\"Avellino\",\"BA\":\"Bari\",\"BT\":\"Barletta-Andria-Trani\",\"BL\":\"Belluno\",\"BN\":\"Benevento\",\"BG\":\"Bergamo\",\"BI\":\"Biella\",\"BO\":\"Bologna\",\"BZ\":\"Bolzano\",\"BS\":\"Brescia\",\"BR\":\"Brindisi\",\"CA\":\"Cagliari\",\"CL\":\"Caltanissetta\",\"CB\":\"Campobasso\",\"CI\":\"Carbonia-Iglesias\",\"CE\":\"Caserta\",\"CT\":\"Catania\",\"CZ\":\"Catanzaro\",\"CH\":\"Chieti\",\"CO\":\"Como\",\"CS\":\"Cosenza\",\"CR\":\"Cremona\",\"KR\":\"Crotone\",\"CN\":\"Cuneo\",\"EN\":\"Enna\",\"FM\":\"Fermo\",\"FE\":\"Ferrara\",\"FI\":\"Firenze\",\"FG\":\"Foggia\",\"FC\":\"Forl\\u00ec-Cesena\",\"FR\":\"Frosinone\",\"GE\":\"Genova\",\"GO\":\"Gorizia\",\"GR\":\"Grosseto\",\"IM\":\"Imperia\",\"IS\":\"Isernia\",\"SP\":\"La Spezia\",\"AQ\":\"L'Aquila\",\"LT\":\"Latina\",\"LE\":\"Lecce\",\"LC\":\"Lecco\",\"LI\":\"Livorno\",\"LO\":\"Lodi\",\"LU\":\"Lucca\",\"MC\":\"Macerata\",\"MN\":\"Mantova\",\"MS\":\"Massa-Carrara\",\"MT\":\"Matera\",\"ME\":\"Messina\",\"MI\":\"Milano\",\"MO\":\"Modena\",\"MB\":\"Monza e della Brianza\",\"NA\":\"Napoli\",\"NO\":\"Novara\",\"NU\":\"Nuoro\",\"OT\":\"Olbia-Tempio\",\"OR\":\"Oristano\",\"PD\":\"Padova\",\"PA\":\"Palermo\",\"PR\":\"Parma\",\"PV\":\"Pavia\",\"PG\":\"Perugia\",\"PU\":\"Pesaro e Urbino\",\"PE\":\"Pescara\",\"PC\":\"Piacenza\",\"PI\":\"Pisa\",\"PT\":\"Pistoia\",\"PN\":\"Pordenone\",\"PZ\":\"Potenza\",\"PO\":\"Prato\",\"RG\":\"Ragusa\",\"RA\":\"Ravenna\",\"RC\":\"Reggio Calabria\",\"RE\":\"Reggio Emilia\",\"RI\":\"Rieti\",\"RN\":\"Rimini\",\"RM\":\"Roma\",\"RO\":\"Rovigo\",\"SA\":\"Salerno\",\"VS\":\"Medio Campidano\",\"SS\":\"Sassari\",\"SV\":\"Savona\",\"SI\":\"Siena\",\"SR\":\"Siracusa\",\"SO\":\"Sondrio\",\"TA\":\"Taranto\",\"TE\":\"Teramo\",\"TR\":\"Terni\",\"TO\":\"Torino\",\"OG\":\"Ogliastra\",\"TP\":\"Trapani\",\"TN\":\"Trento\",\"TV\":\"Treviso\",\"TS\":\"Trieste\",\"UD\":\"Udine\",\"VA\":\"Varese\",\"VE\":\"Venezia\",\"VB\":\"Verbano-Cusio-Ossola\",\"VC\":\"Vercelli\",\"VR\":\"Verona\",\"VV\":\"Vibo Valentia\",\"VI\":\"Vicenza\",\"VT\":\"Viterbo\"},\"JP\":{\"JP01\":\"Hokkaido\",\"JP02\":\"\\u9752\\u68ee\\u5e02\",\"JP03\":\"\\u5ca9\\u624b\\u7e23\",\"JP04\":\"\\u5bae\\u57ce\\u7e23\",\"JP05\":\"\\u79cb\\u7530\\u7e23\",\"JP06\":\"\\u5c71\\u5f62\\u7e23\",\"JP07\":\"\\u798f\\u5cf6\\u7e23\",\"JP08\":\"\\u8328\\u57ce\\u7e23\",\"JP09\":\"\\u6803\\u6728\\u7e23\",\"JP10\":\"\\u7fa4\\u99ac\\u7e23\",\"JP11\":\"\\u57fc\\u7389\\u7e23\",\"JP12\":\"\\u5343\\u8449\\u7e23\",\"JP13\":\"\\u6771\\u4eac\\u90fd\",\"JP14\":\"\\u795e\\u5948\\u5ddd\\u7e23\",\"JP15\":\"\\u65b0\\u6f5f\\u5e02\",\"JP16\":\"\\u5bcc\\u5c71\\u5e02\",\"JP17\":\"\\u77f3\\u5ddd\\u7e23\",\"JP18\":\"\\u798f\\u4e95\\u7e23\",\"JP19\":\"\\u5c71\\u68a8\\u7e23\",\"JP20\":\"\\u9577\\u91ce\\u7e23\",\"JP21\":\"\\u5c90\\u961c\\u7e23\",\"JP22\":\"\\u975c\\u5ca1\\u7e23\",\"JP23\":\"\\u611b\\u77e5\\u7e23\",\"JP24\":\"\\u4e09\\u91cd\\u7e23\",\"JP25\":\"\\u6ecb\\u8cc0\\u7e23\",\"JP26\":\"\\u4eac\\u90fd\",\"JP27\":\"\\u5927\\u962a\\u5e9c\",\"JP28\":\"\\u5175\\u5eab\\u7e23\",\"JP29\":\"\\u5948\\u826f\\u7e23\",\"JP30\":\"\\u548c\\u6b4c\\u5c71\\u7e23\",\"JP31\":\"\\u9ce5\\u53d6\\u7e23\",\"JP32\":\"\\u5cf6\\u6839\\u7e23\",\"JP33\":\"\\u5ca1\\u5c71\\u7e23\",\"JP34\":\"\\u5ee3\\u5cf6\\u5e02\",\"JP35\":\"\\u5c71\\u53e3\\u7e23\",\"JP36\":\"\\u5fb7\\u5cf6\\u5e02\",\"JP37\":\"\\u9999\\u5ddd\\u7e23\",\"JP38\":\"\\u611b\\u5a9b\\u7e23\",\"JP39\":\"\\u9ad8\\u77e5\\u7e23\",\"JP40\":\"\\u798f\\u5ca1\\u7e23\",\"JP41\":\"\\u4f50\\u8cc0\\u7e23\",\"JP42\":\"\\u9577\\u5d0e\\u7e23\",\"JP43\":\"\\u718a\\u672c\\u7e23\",\"JP44\":\"\\u5927\\u5206\\u7e23\",\"JP45\":\"\\u5bae\\u5d0e\\u7e23\",\"JP46\":\"\\u9e7f\\u5152\\u5cf6\\u7e23\",\"JP47\":\"\\u6c96\\u7e69\\u7e23\"},\"LR\":{\"BM\":\"\\u4f2f\\u7c73\\u7e23\",\"BN\":\"\\u90a6\\u7e23\",\"GA\":\"\\u5df4\\u6ce2\\u76e7\\u7e23\",\"GB\":\"\\u5927\\u5df4\\u85a9\\u7e23\",\"GC\":\"\\u5927\\u89d2\\u5c71\\u7e23\",\"GG\":\"\\u5927\\u5404\\u5fb7\\u7e23\",\"GK\":\"\\u5927\\u514b\\u9b6f\\u7e23\",\"LO\":\"\\u6d1b\\u6cd5\\u7e23\",\"MA\":\"\\u99ac\\u53ca\\u6bd4\\u7e23\",\"MY\":\"Maryland\",\"MO\":\"\\u8499\\u7279\\u585e\\u62c9\\u591a\\u7e23\",\"NM\":\"\\u5be7\\u5df4\\u7e23\",\"RV\":\"\\u91cc\\u5f17\\u585e\\u65af\\u7e23\",\"RG\":\"\\u5409\\u6cb3\\u7e23\",\"SN\":\"\\u932b\\u8afe\\u7e23\"},\"MY\":{\"JHR\":\"Johor\",\"KDH\":\"Kedah\",\"KTN\":\"Kelantan\",\"LBN\":\"Labuan\",\"MLK\":\"Malacca (Melaka)\",\"NSN\":\"Negeri Sembilan\",\"PHG\":\"Pahang\",\"PNG\":\"Penang (Pulau Pinang)\",\"PRK\":\"Perak\",\"PLS\":\"Perlis\",\"SBH\":\"Sabah\",\"SWK\":\"Sarawak\",\"SGR\":\"Selangor\",\"TRG\":\"Terengganu\",\"PJY\":\"Putrajaya\",\"KUL\":\"\\u5409\\u9686\\u5761\"},\"MX\":{\"DF\":\"Ciudad de M\u00e9xico\",\"JA\":\"Jalisco\",\"NL\":\"Nuevo Le\u00f3n\",\"AG\":\"Aguascalientes\",\"BC\":\"Baja California\",\"BS\":\"Baja California Sur\",\"CM\":\"Campeche\",\"CS\":\"Chiapas\",\"CH\":\"Chihuahua\",\"CO\":\"Coahuila\",\"CL\":\"Colima\",\"DG\":\"Durango\",\"GT\":\"Guanajuato\",\"GR\":\"Guerrero\",\"HG\":\"Hidalgo\",\"MX\":\"Estado de M\u00e9xico\",\"MI\":\"Michoac\u00e1n\",\"MO\":\"Morelos\",\"NA\":\"Nayarit\",\"OA\":\"Oaxaca\",\"PU\":\"Puebla\",\"QT\":\"Quer\u00e9taro\",\"QR\":\"Quintana Roo\",\"SL\":\"San Luis Potos\u00ed\",\"SI\":\"Sinaloa\",\"SO\":\"Sonora\",\"TB\":\"Tabasco\",\"TM\":\"Tamaulipas\",\"TL\":\"Tlaxcala\",\"VE\":\"Veracruz\",\"YU\":\"Yucat\u00e1n\",\"ZA\":\"Zacatecas\"},\"MD\":{\"C\":\"Chi\u0219in\u0103u\",\"BL\":\"B\u0103l\u021bi\",\"AN\":\"Anenii Noi\",\"BS\":\"Basarabeasca\",\"BR\":\"Briceni\",\"CH\":\"Cahul\",\"CT\":\"Cantemir\",\"CL\":\"C\u0103l\u0103ra\u0219i\",\"CS\":\"C\u0103u\u0219eni\",\"CM\":\"Cimi\u0219lia\",\"CR\":\"Criuleni\",\"DN\":\"Dondu\u0219eni\",\"DR\":\"Drochia\",\"DB\":\"Dub\u0103sari\",\"ED\":\"Edine\u021b\",\"FL\":\"F\u0103le\u0219ti\",\"FR\":\"Flore\u0219ti\",\"GE\":\"UTA G\u0103g\u0103uzia\",\"GL\":\"Glodeni\",\"HN\":\"H\u00eence\u0219ti\",\"IL\":\"Ialoveni\",\"LV\":\"Leova\",\"NS\":\"Nisporeni\",\"OC\":\"Ocni\u021ba\",\"OR\":\"Orhei\",\"RZ\":\"Rezina\",\"RS\":\"R\u00ee\u0219cani\",\"SG\":\"S\u00eengerei\",\"SR\":\"Soroca\",\"ST\":\"Str\u0103\u0219eni\",\"SD\":\"\u0218old\u0103ne\u0219ti\",\"SV\":\"\u0218tefan Vod\u0103\",\"TR\":\"Taraclia\",\"TL\":\"Telene\u0219ti\",\"UN\":\"Ungheni\"},\"NP\":{\"BAG\":\"Bagmati\",\"BHE\":\"Bheri\",\"DHA\":\"Dhaulagiri\",\"GAN\":\"Gandaki\",\"JAN\":\"Janakpur\",\"KAR\":\"Karnali\",\"KOS\":\"Koshi\",\"LUM\":\"Lumbini\",\"MAH\":\"Mahakali\",\"MEC\":\"Mechi\",\"NAR\":\"Narayani\",\"RAP\":\"Rapti\",\"SAG\":\"Sagarmatha\",\"SET\":\"Seti\"},\"NZ\":{\"NL\":\"Northland\",\"AK\":\"Auckland\",\"WA\":\"Waikato\",\"BP\":\"Bay of Plenty\",\"TK\":\"Taranaki\",\"GI\":\"Gisborne\",\"HB\":\"Hawke\u2019s Bay\",\"MW\":\"Manawatu-Wanganui\",\"WE\":\"Wellington\",\"NS\":\"Nelson\",\"MB\":\"Marlborough\",\"TM\":\"Tasman\",\"WC\":\"West Coast\",\"CT\":\"Canterbury\",\"OT\":\"Otago\",\"SL\":\"Southland\"},\"NG\":{\"AB\":\"Abia\",\"FC\":\"Abuja\",\"AD\":\"Adamawa\",\"AK\":\"Akwa Ibom\",\"AN\":\"Anambra\",\"BA\":\"Bauchi\",\"BY\":\"Bayelsa\",\"BE\":\"Benue\",\"BO\":\"Borno\",\"CR\":\"Cross River\",\"DE\":\"Delta\",\"EB\":\"Ebonyi\",\"ED\":\"Edo\",\"EK\":\"Ekiti\",\"EN\":\"Enugu\",\"GO\":\"Gombe\",\"IM\":\"Imo\",\"JI\":\"Jigawa\",\"KD\":\"Kaduna\",\"KN\":\"Kano\",\"KT\":\"Katsina\",\"KE\":\"Kebbi\",\"KO\":\"Kogi\",\"KW\":\"Kwara\",\"LA\":\"Lagos\",\"NA\":\"Nasarawa\",\"NI\":\"Niger\",\"OG\":\"Ogun\",\"ON\":\"Ondo\",\"OS\":\"Osun\",\"OY\":\"Oyo\",\"PL\":\"Plateau\",\"RI\":\"Rivers\",\"SO\":\"Sokoto\",\"TA\":\"Taraba\",\"YO\":\"Yobe\",\"ZA\":\"Zamfara\"},\"PK\":{\"JK\":\"Azad Kashmir\",\"BA\":\"Balochistan\",\"TA\":\"FATA\",\"GB\":\"Gilgit Baltistan\",\"IS\":\"Islamabad Capital Territory\",\"KP\":\"Khyber Pakhtunkhwa\",\"PB\":\"Punjab\",\"SD\":\"Sindh\"},\"PE\":{\"CAL\":\"El Callao\",\"LMA\":\"Municipalidad Metropolitana de Lima\",\"AMA\":\"Amazonas\",\"ANC\":\"Ancash\",\"APU\":\"Apur\u00edmac\",\"ARE\":\"Arequipa\",\"AYA\":\"Ayacucho\",\"CAJ\":\"Cajamarca\",\"CUS\":\"Cusco\",\"HUV\":\"Huancavelica\",\"HUC\":\"Hu\u00e1nuco\",\"ICA\":\"Ica\",\"JUN\":\"Jun\u00edn\",\"LAL\":\"La Libertad\",\"LAM\":\"Lambayeque\",\"LIM\":\"Lima\",\"LOR\":\"Loreto\",\"MDD\":\"Madre de Dios\",\"MOQ\":\"Moquegua\",\"PAS\":\"Pasco\",\"PIU\":\"Piura\",\"PUN\":\"Puno\",\"SAM\":\"San Mart\u00edn\",\"TAC\":\"Tacna\",\"TUM\":\"Tumbes\",\"UCA\":\"Ucayali\"},\"PH\":{\"ABR\":\"Abra\",\"AGN\":\"Agusan del Norte\",\"AGS\":\"Agusan del Sur\",\"AKL\":\"Aklan\",\"ALB\":\"Albay\",\"ANT\":\"Antique\",\"APA\":\"Apayao\",\"AUR\":\"Aurora\",\"BAS\":\"Basilan\",\"BAN\":\"Bataan\",\"BTN\":\"Batanes\",\"BTG\":\"Batangas\",\"BEN\":\"Benguet\",\"BIL\":\"Biliran\",\"BOH\":\"Bohol\",\"BUK\":\"Bukidnon\",\"BUL\":\"Bulacan\",\"CAG\":\"Cagayan\",\"CAN\":\"Camarines Norte\",\"CAS\":\"Camarines Sur\",\"CAM\":\"Camiguin\",\"CAP\":\"Capiz\",\"CAT\":\"Catanduanes\",\"CAV\":\"Cavite\",\"CEB\":\"Cebu\",\"COM\":\"Compostela Valley\",\"NCO\":\"Cotabato\",\"DAV\":\"Davao del Norte\",\"DAS\":\"Davao del Sur\",\"DAC\":\"Davao Occidental\",\"DAO\":\"Davao Oriental\",\"DIN\":\"Dinagat Islands\",\"EAS\":\"Eastern Samar\",\"GUI\":\"Guimaras\",\"IFU\":\"Ifugao\",\"ILN\":\"Ilocos Norte\",\"ILS\":\"Ilocos Sur\",\"ILI\":\"Iloilo\",\"ISA\":\"Isabela\",\"KAL\":\"Kalinga\",\"LUN\":\"La Union\",\"LAG\":\"Laguna\",\"LAN\":\"Lanao del Norte\",\"LAS\":\"Lanao del Sur\",\"LEY\":\"Leyte\",\"MAG\":\"Maguindanao\",\"MAD\":\"Marinduque\",\"MAS\":\"Masbate\",\"MSC\":\"Misamis Occidental\",\"MSR\":\"Misamis Oriental\",\"MOU\":\"Mountain Province\",\"NEC\":\"Negros Occidental\",\"NER\":\"Negros Oriental\",\"NSA\":\"Northern Samar\",\"NUE\":\"Nueva Ecija\",\"NUV\":\"Nueva Vizcaya\",\"MDC\":\"Occidental Mindoro\",\"MDR\":\"Oriental Mindoro\",\"PLW\":\"Palawan\",\"PAM\":\"Pampanga\",\"PAN\":\"Pangasinan\",\"QUE\":\"Quezon\",\"QUI\":\"Quirino\",\"RIZ\":\"Rizal\",\"ROM\":\"Romblon\",\"WSA\":\"Samar\",\"SAR\":\"Sarangani\",\"SIQ\":\"Siquijor\",\"SOR\":\"Sorsogon\",\"SCO\":\"South Cotabato\",\"SLE\":\"Southern Leyte\",\"SUK\":\"Sultan Kudarat\",\"SLU\":\"Sulu\",\"SUN\":\"Surigao del Norte\",\"SUR\":\"Surigao del Sur\",\"TAR\":\"Tarlac\",\"TAW\":\"Tawi-Tawi\",\"ZMB\":\"Zambales\",\"ZAN\":\"Zamboanga del Norte\",\"ZAS\":\"Zamboanga del Sur\",\"ZSI\":\"Zamboanga Sibugay\",\"00\":\"Metro Manila\"},\"RO\":{\"AB\":\"Alba\",\"AR\":\"Arad\",\"AG\":\"Arge\u0219\",\"BC\":\"Bac\u0103u\",\"BH\":\"Bihor\",\"BN\":\"Bistri\u021ba-N\u0103s\u0103ud\",\"BT\":\"Boto\u0219ani\",\"BR\":\"Br\u0103ila\",\"BV\":\"Bra\u0219ov\",\"B\":\"Bucure\u0219ti\",\"BZ\":\"Buz\u0103u\",\"CL\":\"C\u0103l\u0103ra\u0219i\",\"CS\":\"Cara\u0219-Severin\",\"CJ\":\"Cluj\",\"CT\":\"Constan\u021ba\",\"CV\":\"Covasna\",\"DB\":\"D\u00e2mbovi\u021ba\",\"DJ\":\"Dolj\",\"GL\":\"Gala\u021bi\",\"GR\":\"Giurgiu\",\"GJ\":\"Gorj\",\"HR\":\"Harghita\",\"HD\":\"Hunedoara\",\"IL\":\"Ialomi\u021ba\",\"IS\":\"Ia\u0219i\",\"IF\":\"Ilfov\",\"MM\":\"Maramure\u0219\",\"MH\":\"Mehedin\u021bi\",\"MS\":\"Mure\u0219\",\"NT\":\"Neam\u021b\",\"OT\":\"Olt\",\"PH\":\"Prahova\",\"SJ\":\"S\u0103laj\",\"SM\":\"Satu Mare\",\"SB\":\"Sibiu\",\"SV\":\"Suceava\",\"TR\":\"Teleorman\",\"TM\":\"Timi\u0219\",\"TL\":\"Tulcea\",\"VL\":\"V\u00e2lcea\",\"VS\":\"\\u74e6\\u65af\\u76e7\\u4f0a\",\"VN\":\"\\u5f17\\u6717\\u6070\\u7e23\"},\"ZA\":{\"EC\":\"Eastern Cape\",\"FS\":\"Free State\",\"GP\":\"Gauteng\",\"KZN\":\"KwaZulu-Natal\",\"LP\":\"Limpopo\",\"MP\":\"Mpumalanga\",\"NC\":\"Northern Cape\",\"NW\":\"North West\",\"WC\":\"Western Cape\"},\"ES\":{\"C\":\"A Coru\u00f1a\",\"VI\":\"Araba\\\/\u00c1lava\",\"AB\":\"Albacete\",\"A\":\"Alicante\",\"AL\":\"Almer\u00eda\",\"O\":\"Asturias\",\"AV\":\"\u00c1vila\",\"BA\":\"Badajoz\",\"PM\":\"Baleares\",\"B\":\"Barcelona\",\"BU\":\"Burgos\",\"CC\":\"C\u00e1ceres\",\"CA\":\"C\u00e1diz\",\"S\":\"Cantabria\",\"CS\":\"Castell\u00f3n\",\"CE\":\"Ceuta\",\"CR\":\"Ciudad Real\",\"CO\":\"C\u00f3rdoba\",\"CU\":\"Cuenca\",\"GI\":\"Girona\",\"GR\":\"Granada\",\"GU\":\"Guadalajara\",\"SS\":\"Gipuzkoa\",\"H\":\"Huelva\",\"HU\":\"Huesca\",\"J\":\"Ja\u00e9n\",\"LO\":\"La Rioja\",\"GC\":\"Las Palmas\",\"LE\":\"Le\u00f3n\",\"L\":\"Lleida\",\"LU\":\"Lugo\",\"M\":\"Madrid\",\"MA\":\"M\u00e1laga\",\"ML\":\"Melilla\",\"MU\":\"Murcia\",\"NA\":\"Navarra\",\"OR\":\"Ourense\",\"P\":\"Palencia\",\"PO\":\"Pontevedra\",\"SA\":\"Salamanca\",\"TF\":\"Santa Cruz de Tenerife\",\"SG\":\"Segovia\",\"SE\":\"Sevilla\",\"SO\":\"Soria\",\"T\":\"Tarragona\",\"TE\":\"Teruel\",\"TO\":\"Toledo\",\"V\":\"Valencia\",\"VA\":\"Valladolid\",\"BI\":\"Bizkaia\",\"ZA\":\"Zamora\",\"Z\":\"Zaragoza\"},\"CH\":{\"AG\":\"Aargau\",\"AR\":\"Appenzell Ausserrhoden\",\"AI\":\"Appenzell Innerrhoden\",\"BL\":\"Basel-Landschaft\",\"BS\":\"Basel-Stadt\",\"BE\":\"Bern\",\"FR\":\"Fribourg\",\"GE\":\"Geneva\",\"GL\":\"Glarus\",\"GR\":\"Graub\u00fcnden\",\"JU\":\"Jura\",\"LU\":\"Luzern\",\"NE\":\"Neuch\u00e2tel\",\"NW\":\"Nidwalden\",\"OW\":\"Obwalden\",\"SH\":\"Schaffhausen\",\"SZ\":\"Schwyz\",\"SO\":\"Solothurn\",\"SG\":\"St. Gallen\",\"TG\":\"Thurgau\",\"TI\":\"Ticino\",\"UR\":\"Uri\",\"VS\":\"Valais\",\"VD\":\"Vaud\",\"ZG\":\"Zug\",\"ZH\":\"Z\u00fcrich\"},\"TZ\":{\"TZ01\":\"Arusha\",\"TZ02\":\"Dar es Salaam\",\"TZ03\":\"Dodoma\",\"TZ04\":\"Iringa\",\"TZ05\":\"Kagera\",\"TZ06\":\"Pemba North\",\"TZ07\":\"Zanzibar North\",\"TZ08\":\"Kigoma\",\"TZ09\":\"Kilimanjaro\",\"TZ10\":\"Pemba South\",\"TZ11\":\"Zanzibar South\",\"TZ12\":\"Lindi\",\"TZ13\":\"Mara\",\"TZ14\":\"Mbeya\",\"TZ15\":\"Zanzibar West\",\"TZ16\":\"Morogoro\",\"TZ17\":\"Mtwara\",\"TZ18\":\"Mwanza\",\"TZ19\":\"Coast\",\"TZ20\":\"Rukwa\",\"TZ21\":\"Ruvuma\",\"TZ22\":\"Shinyanga\",\"TZ23\":\"Singida\",\"TZ24\":\"Tabora\",\"TZ25\":\"Tanga\",\"TZ26\":\"Manyara\",\"TZ27\":\"Geita\",\"TZ28\":\"Katavi\",\"TZ29\":\"Njombe\",\"TZ30\":\"Simiyu\"},\"TH\":{\"TH-37\":\"\\u5b89\\u7d0d\\u4e4d\\u80fd\\u5e9c\",\"TH-15\":\"\\u7d05\\u7d71\\u5e9c\",\"TH-14\":\"\\u5927\\u57ce\\u5e9c\",\"TH-10\":\"\\u66fc\\u8c37\",\"TH-38\":\"\\u6c76\\u5e72\\u5e9c\",\"TH-31\":\"\\u6b66\\u91cc\\u5357\\u5e9c\",\"TH-24\":\"\\u5317\\u67f3\\u5e9c\",\"TH-18\":\"\\u731c\\u90a3\\u5e9c\",\"TH-36\":\"\\u731c\\u4e5f\\u5954\\u5e9c\",\"TH-22\":\"\\u5c16\\u7af9\\u6c76\\u5e9c\",\"TH-50\":\"\\u6e05\\u9081\\u5e9c\",\"TH-57\":\"\\u6e05\\u840a\\u5e9c\",\"TH-20\":\"\\u6625\\u6b66\\u91cc\\u5e9c\",\"TH-86\":\"\\u6625\\u84ec\\u5e9c\",\"TH-46\":\"\\u52a0\\u62c9\\u4fe1\\u5e9c\",\"TH-62\":\"\\u7518\\u70f9\\u78a7\\u5e9c\",\"TH-71\":\"\\u5317\\u78a7\\u5e9c\",\"TH-40\":\"\\u5b54\\u656c\\u5e9c\",\"TH-81\":\"\\u7532\\u7c73\\u5e9c\",\"TH-52\":\"\\u5357\\u90a6\\u5e9c\",\"TH-51\":\"\\u5357\\u5954\\u5e9c\",\"TH-42\":\"\\u9ece\\u5e9c\",\"TH-16\":\"\\u83ef\\u5bcc\\u91cc\\u5e9c\",\"TH-58\":\"\\u591c\\u8c50\\u980c\\u5e9c\",\"TH-44\":\"\\u746a\\u54c8\\u6c99\\u62c9\\u582a\\u5e9c\",\"TH-49\":\"\\u83ab\\u9054\\u6f22\\u5e9c\",\"TH-26\":\"\\u90a3\\u7a7a\\u90a3\\u80b2\\u5e9c\",\"TH-73\":\"\\u4f5b\\u7d71\\u5e9c\",\"TH-48\":\"\\u90a3\\u7a7a\\u5e15\\u8fb2\\u5e9c\",\"TH-30\":\"\\u5475\\u53fb\\u5e9c\",\"TH-60\":\"\\u5317\\u6b16\\u5761\\u5e9c\",\"TH-80\":\"\\u6d1b\\u5764\\u5e9c\",\"TH-55\":\"\\u96e3\\u5e9c\",\"TH-96\":\"\\u9676\\u516c\\u5e9c\",\"TH-39\":\"\\u5eca\\u78e8\\u5583\\u84b2\\u5e9c\",\"TH-43\":\"\\u5eca\\u958b\\u5e9c\",\"TH-12\":\"\\u6696\\u6b66\\u91cc\\u5e9c\",\"TH-13\":\"\\u5df4\\u541e\\u4ed6\\u5c3c\\u5e9c\",\"TH-94\":\"\\u5317\\u5927\\u5e74\\u5e9c\",\"TH-82\":\"\\u6500\\u7259\\u5e9c\",\"TH-93\":\"\\u535a\\u9054\\u502b\\u5e9c\",\"TH-56\":\"\\u5e15\\u582f\\u5e9c\",\"TH-67\":\"\\u78a7\\u5dee\\u6c76\\u5e9c\",\"TH-76\":\"\\u4f5b\\u4e15\\u5e9c\",\"TH-66\":\"\\u62ab\\u96c6\\u5e9c\",\"TH-65\":\"\\u5f6d\\u4e16\\u6d1b\\u5e9c\",\"TH-54\":\"\\u5e15\\u5e9c\",\"TH-83\":\"\\u666e\\u5409\\u5e9c\",\"TH-25\":\"\\u5df4\\u771f\\u5e9c\",\"TH-77\":\"\\u5df4\\u8700\\u5e9c\",\"TH-85\":\"\\u814a\\u8fb2\\u5e9c\",\"TH-70\":\"\\u53fb\\u4e15\\u5e9c\",\"TH-21\":\"\\u7f85\\u52c7\\u5e9c\",\"TH-45\":\"\\u9ece\\u9038\\u5e9c\",\"TH-27\":\"\\u6c99\\u7e73\\u5e9c\",\"TH-47\":\"\\u8272\\u8ecd\\u5e9c\",\"TH-11\":\"\\u5317\\u6b16\\u5e9c\",\"TH-74\":\"\\u9f8d\\u4ed4\\u539d\\u5e9c\",\"TH-75\":\"\\u591c\\u529f\\u5e9c\",\"TH-19\":\"\\u5317\\u6a19\\u5e9c\",\"TH-91\":\"\\u6c99\\u6566\\u5e9c\",\"TH-17\":\"\\u4fe1\\u6b66\\u91cc\\u5e9c\",\"TH-33\":\"\\u56db\\u8272\\u83ca\\u5e9c\",\"TH-90\":\"\\u5b8b\\u5361\\u5e9c\",\"TH-64\":\"\\u7d20\\u53ef\\u6cf0\\u5e9c\",\"TH-72\":\"\\u7d20\\u6500\\u6b66\\u91cc\\u5e9c\",\"TH-84\":\"\\u7d20\\u53fb\\u5e9c\",\"TH-32\":\"\\u7d20\\u6797\\u5e9c\",\"TH-63\":\"\\u9054\\u5e9c\",\"TH-92\":\"\\u8463\\u91cc\\u5e9c\",\"TH-23\":\"\\u9054\\u53fb\\u5e9c\",\"TH-34\":\"\\u70cf\\u6c76\\u5e9c\",\"TH-41\":\"\\u70cf\\u9686\\u5e9c\",\"TH-61\":\"\\u70cf\\u6cf0\\u4ed6\\u5c3c\\u5e9c\",\"TH-53\":\"\\u7a0b\\u9038\\u5e9c\",\"TH-95\":\"\\u4e5f\\u62c9\\u5e9c\",\"TH-35\":\"\\u76ca\\u68ad\\u901a\\u5e9c\"},\"TR\":{\"TR01\":\"Adana\",\"TR02\":\"Ad\u0131yaman\",\"TR03\":\"Afyon\",\"TR04\":\"A\u011fr\u0131\",\"TR05\":\"Amasya\",\"TR06\":\"Ankara\",\"TR07\":\"Antalya\",\"TR08\":\"Artvin\",\"TR09\":\"Ayd\u0131n\",\"TR10\":\"Bal\u0131kesir\",\"TR11\":\"Bilecik\",\"TR12\":\"Bing\u00f6l\",\"TR13\":\"Bitlis\",\"TR14\":\"Bolu\",\"TR15\":\"Burdur\",\"TR16\":\"Bursa\",\"TR17\":\"\u00c7anakkale\",\"TR18\":\"\u00c7ank\u0131r\u0131\",\"TR19\":\"\u00c7orum\",\"TR20\":\"Denizli\",\"TR21\":\"Diyarbak\u0131r\",\"TR22\":\"Edirne\",\"TR23\":\"Elaz\u0131\u011f\",\"TR24\":\"Erzincan\",\"TR25\":\"Erzurum\",\"TR26\":\"Eski\u015fehir\",\"TR27\":\"Gaziantep\",\"TR28\":\"Giresun\",\"TR29\":\"G\u00fcm\u00fc\u015fhane\",\"TR30\":\"Hakkari\",\"TR31\":\"Hatay\",\"TR32\":\"Isparta\",\"TR33\":\"\u0130\u00e7el\",\"TR34\":\"\u0130stanbul\",\"TR35\":\"\u0130zmir\",\"TR36\":\"Kars\",\"TR37\":\"Kastamonu\",\"TR38\":\"Kayseri\",\"TR39\":\"K\u0131rklareli\",\"TR40\":\"K\u0131r\u015fehir\",\"TR41\":\"Kocaeli\",\"TR42\":\"Konya\",\"TR43\":\"K\u00fctahya\",\"TR44\":\"Malatya\",\"TR45\":\"Manisa\",\"TR46\":\"Kahramanmara\u015f\",\"TR47\":\"Mardin\",\"TR48\":\"Mu\u011fla\",\"TR49\":\"Mu\u015f\",\"TR50\":\"Nev\u015fehir\",\"TR51\":\"Ni\u011fde\",\"TR52\":\"Ordu\",\"TR53\":\"Rize\",\"TR54\":\"Sakarya\",\"TR55\":\"Samsun\",\"TR56\":\"Siirt\",\"TR57\":\"Sinop\",\"TR58\":\"Sivas\",\"TR59\":\"Tekirda\u011f\",\"TR60\":\"Tokat\",\"TR61\":\"Trabzon\",\"TR62\":\"Tunceli\",\"TR63\":\"\u015eanl\u0131urfa\",\"TR64\":\"U\u015fak\",\"TR65\":\"Van\",\"TR66\":\"Yozgat\",\"TR67\":\"Zonguldak\",\"TR68\":\"Aksaray\",\"TR69\":\"Bayburt\",\"TR70\":\"Karaman\",\"TR71\":\"K\u0131r\u0131kkale\",\"TR72\":\"Batman\",\"TR73\":\"\u015e\u0131rnak\",\"TR74\":\"Bart\u0131n\",\"TR75\":\"Ardahan\",\"TR76\":\"I\u011fd\u0131r\",\"TR77\":\"Yalova\",\"TR78\":\"Karab\u00fck\",\"TR79\":\"Kilis\",\"TR80\":\"Osmaniye\",\"TR81\":\"D\u00fczce\"},\"US\":{\"AL\":\"Alabama\",\"AK\":\"Alaska\",\"AZ\":\"Arizona\",\"AR\":\"Arkansas\",\"CA\":\"California\",\"CO\":\"Colorado\",\"CT\":\"Connecticut\",\"DE\":\"Delaware\",\"DC\":\"District Of Columbia\",\"FL\":\"Florida\",\"GA\":\"Georgia\",\"HI\":\"Hawaii\",\"ID\":\"Idaho\",\"IL\":\"Illinois\",\"IN\":\"Indiana\",\"IA\":\"Iowa\",\"KS\":\"Kansas\",\"KY\":\"Kentucky\",\"LA\":\"Louisiana\",\"ME\":\"Maine\",\"MD\":\"Maryland\",\"MA\":\"Massachusetts\",\"MI\":\"Michigan\",\"MN\":\"Minnesota\",\"MS\":\"Mississippi\",\"MO\":\"Missouri\",\"MT\":\"Montana\",\"NE\":\"Nebraska\",\"NV\":\"Nevada\",\"NH\":\"New Hampshire\",\"NJ\":\"New Jersey\",\"NM\":\"New Mexico\",\"NY\":\"New York\",\"NC\":\"North Carolina\",\"ND\":\"North Dakota\",\"OH\":\"Ohio\",\"OK\":\"Oklahoma\",\"OR\":\"Oregon\",\"PA\":\"Pennsylvania\",\"RI\":\"Rhode Island\",\"SC\":\"South Carolina\",\"SD\":\"South Dakota\",\"TN\":\"Tennessee\",\"TX\":\"Texas\",\"UT\":\"Utah\",\"VT\":\"Vermont\",\"VA\":\"Virginia\",\"WA\":\"Washington\",\"WV\":\"West Virginia\",\"WI\":\"Wisconsin\",\"WY\":\"Wyoming\",\"AA\":\"Armed Forces (AA)\",\"AE\":\"Armed Forces (AE)\",\"AP\":\"Armed Forces (AP)\"},\"CN\":{\"CN1\":\"Yunnan \\\/ \u4e91\u5357\",\"CN2\":\"Beijing \\\/ \u5317\u4eac\",\"CN3\":\"Tianjin \\\/ \u5929\u6d25\",\"CN4\":\"Hebei \\\/ \u6cb3\u5317\",\"CN5\":\"Shanxi \\\/ \u5c71\u897f\",\"CN6\":\"Inner Mongolia \\\/ \u5167\u8499\u53e4\",\"CN7\":\"Liaoning \\\/ \u8fbd\u5b81\",\"CN8\":\"Jilin \\\/ \u5409\u6797\",\"CN9\":\"Heilongjiang \\\/ \u9ed1\u9f99\u6c5f\",\"CN10\":\"Shanghai \\\/ \u4e0a\u6d77\",\"CN11\":\"Jiangsu \\\/ \u6c5f\u82cf\",\"CN12\":\"Zhejiang \\\/ \u6d59\u6c5f\",\"CN13\":\"Anhui \\\/ \u5b89\u5fbd\",\"CN14\":\"Fujian \\\/ \u798f\u5efa\",\"CN15\":\"Jiangxi \\\/ \u6c5f\u897f\",\"CN16\":\"Shandong \\\/ \u5c71\u4e1c\",\"CN17\":\"Henan \\\/ \u6cb3\u5357\",\"CN18\":\"Hubei \\\/ \u6e56\u5317\",\"CN19\":\"Hunan \\\/ \u6e56\u5357\",\"CN20\":\"Guangdong \\\/ \u5e7f\u4e1c\",\"CN21\":\"Guangxi Zhuang \\\/ \u5e7f\u897f\u58ee\u65cf\",\"CN22\":\"Hainan \\\/ \u6d77\u5357\",\"CN23\":\"Chongqing \\\/ \u91cd\u5e86\",\"CN24\":\"Sichuan \\\/ \u56db\u5ddd\",\"CN25\":\"Guizhou \\\/ \u8d35\u5dde\",\"CN26\":\"Shaanxi \\\/ \u9655\u897f\",\"CN27\":\"Gansu \\\/ \u7518\u8083\",\"CN28\":\"Qinghai \\\/ \u9752\u6d77\",\"CN29\":\"Ningxia Hui \\\/ \u5b81\u590f\",\"CN30\":\"\\u6fb3\\u9580 \\\/ \u6fb3\u95e8\",\"CN31\":\"\\u897f\\u85cf \\\/ \u897f\u85cf\",\"CN32\":\"\\u65b0\\u7586 \\\/ \u65b0\u7586\"},\"HK\":{\"HONG KONG\":\"\\u9999\\u6e2f\\u5cf6\",\"KOWLOON\":\"\\u4e5d\\u9f8d\",\"NEW TERRITORIES\":\"\\u65b0\\u754c\"}}","i18n_select_state_text":"Select an option\u2026","curent_time":"2022-01-31","curent_time_h":"10","curent_time_m":"20","curent_time_s":"44"};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-relationship-manager/assets/js/admin.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woocommerce-customer-order-csv-export/lib/skyverge/woocommerce/assets/js/admin/sv-wp-admin-job-batch-handler.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    var gyrixnonce = {"ajaxSave":"bea2136e2a","ajaxAdd":"76b77466a2","ajaxGet":"5bfa4429b9"};
    /* ]]> */
    </script>
    <script type="text/javascript" src="https://d2otiughgt5pr2.cloudfront.net/wp-content/plugins/woo-order-note-templates/admin/js/template-script.min.js?ver=1.3.1579&amp;bi=177864704"></script>
    <style>
                #adminmenu #toplevel_page_activity_log_page div.wp-menu-image:before {
                    content: "\f321";
                }
            </style>
        <style>body.login {
    background: #43C6AC !important; /* fallback for old browsers */
    background: -webkit-linear-gradient(to left, #43C6AC , #F8FFAE) !important; /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to left, #43C6AC , #F8FFAE) !important; /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    }</style><style>
            #pre_bg {
                background: #f1f1f1;
                height: auto;
                border: 1px solid #ddd;
                color: #444;
                font-family: "Open Sans",sans-serif;
                font-size: 13px;
                line-height: 1.4em;
            }
            .pre_login {
                width: 320px;
                padding: 8% 0 0;
                margin: auto;
            }
            .pre_login #pre_loginform {
                margin-top: 20px;
                margin-left: 0;
                padding: 26px 24px 46px;
                font-weight: 400;
                overflow: hidden;
                background: #ffffff !important;
                -webkit-box-shadow: 0 1px 3px rgba(0,0,0,.13) !important;
                box-shadow: 0 1px 3px rgba(0,0,0,.13) !important;
                ;
            }
            input#pre_wp-submit {
                background: #43c6ac !important;
                border-color: #21a48a !important;
                -webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,0.15) !important;
                box-shadow: inset 0 1px 0 rgba(255,255,255,0.15) !important;
                color: #ffffff;
            }
            .pre_login #pre_loginform p {
                margin-bottom: 0;
            }
            .pre_login #pre_loginform p.pre_submit {
                margin: 0;
                padding: 0;
            }
            .pre_login * {
                margin: 0;
                padding: 0;
            }
            .pre_login h1 {
                text-align: center;
            }
            .pre_login h1 a {
                background-image: url("");
                -webkit-background-size: px !important;
                background-size: 100% !important;
                background-position: center top;
                background-repeat: no-repeat;
                color: #999;
                height: px !important;
                font-size: 20px;
                font-weight: 400;
                line-height: 1.3em;
                margin: 0 auto 25px;
                padding: 0;
                text-decoration: none;
                width: px !important;
                max-width: 320px;
                text-indent: -9999px;
                outline: 0;
                overflow: hidden;
                display: block;
            }
            .pre_login #pre_backtoblog a:hover,.pre_login #pre_nav a:hover,.pre_login h1 a:hover {
                color: #2ea2cc;
            }
            .pre_login #pre_loginform .pre_forgetmenot {
                font-weight: 400;
                float: left;
                margin-bottom: 0;
            }
            .pre_login .button-primary {
                float: right;
            }
            .pre_login label {
                color: #777;
                font-size: 14px;
            }
            label[for=pre_user_login], label[for=pre_user_pass], label[for=pre_rememberme] {
                color: #777777 !important;
            }
            .pre_login #pre_loginform .pre_forgetmenot label {
                font-size: 12px;
                line-height: 19px;
            }
            .pre_login #pre_backtoblog a:hover,.pre_login #pre_nav a:hover,.pre_login h1 a:hover {
                color: #2ea2cc;
            }
            .pre_login #pre_nav {
                margin: 24px 0 0;
                ;
            }
            #pre_backtoblog {
                margin: 16px 0 0;
                padding: 0 24px;
                display: none;
            }
            .pre_login #pre_backtoblog a,.pre_login #pre_nav a {
                text-decoration: none;
                color: #999;
                font-size: 13px;
            }
            a.pre_reg, a.pre_pass {
                padding: 0 0 0 24px;
                color: #999999 !important;
            }
            a.pre_reg:hover, a.pre_pass:hover {
                padding: 0 0 0 24px;
                color: #2ea2cc !important;
            }
            #pre_backtoblog a {
                color: #999999 !important;
            }
            #pre_backtoblog a:hover {
                color: #2ea2cc !important;
            }
            .pre_pass {
                padding: 0 !important;
            }
            .pre_login #pre_loginform .pre_input,.pre_login input[type=text] {
                font-size: 24px;
                width: 100%;
                padding: 3px;
                margin: 2px 6px 16px 0;
            }
            .pre_login #pre_loginform .pre_input,.pre_login #pre_loginform input[type=checkbox],.pre_login input[type=text] {
                background: #fbfbfb;
            }
            #pre_login#pre_loginform p.pre_submit {
                border: none;
                margin: -10px 0 20px;
            }
            #pre_loginform p.submit a.cancel:hover {
                text-decoration: none;
            }
            .pre_login #pre_loginform .pre_input,.pre_login input[type=text] {
                font-size: 24px;
                width: 100%;
                padding: 3px;
                margin: 2px 6px 16px 0;
            }
            .pre_login #pre_loginform .pre_input,.pre_login #pre_loginform input[type=checkbox],.pre_login input[type=text] {
                background: #fbfbfb;
            }
        </style>		<style type="text/css">#wpadminbar li#wp-admin-bar-pro-site {
                    float: right;
                }
    
                #wpadminbar li#wp-admin-bar-pro-site a {
    
                }
    
                #wpadminbar li#wp-admin-bar-pro-site a span {
    
                }
    
                #wpadminbar li#wp-admin-bar-pro-site a:hover span {
    
                }
            </style>
        <style type="text/css" media="screen">
    
    
    /* sidebar */
    #adminmenuback {
        background-color: #302d2d;
    }
    @media only screen and (max-width: 782px) {
        #adminmenuwrap {
            background-color: #302d2d;
        }
    }
    #adminmenu li.wp-menu-separator, #adminmenu #collapse-menu {
        border-top-color: #262323;
    }
    #adminmenu a, #adminmenu div.wp-menu-image:before, #collapse-menu, #collapse-menu #collapse-button div:after {
        color: #888888;
    }
    
    #adminmenu li.current a.menu-top, #adminmenu li.wp-has-current-submenu a.wp-has-current-submenu, #adminmenu .current div.wp-menu-image:before, #adminmenu .wp-has-current-submenu div.wp-menu-image:before, #adminmenu a.current:hover div.wp-menu-image:before, #adminmenu a.wp-has-current-submenu:hover div.wp-menu-image:before, #adminmenu li.wp-has-current-submenu:hover div.wp-menu-image:before {
        color: white;
    }
    #adminmenu .wp-submenu .wp-submenu-head, .folded #adminmenu .wp-submenu .wp-submenu-head {
        color: #ffffff;
    }
    #adminmenu .wp-has-current-submenu.opensub .wp-submenu .wp-submenu-head, .folded #adminmenu .wp-has-current-submenu .wp-submenu .wp-submenu-head {
        color: #ffffff;
    }
    .folded #adminmenu li.wp-has-current-submenu a.wp-has-current-submenu {
        background: #ea5340;
    }
    @media only screen and (max-width: 960px) {
        .auto-fold #adminmenu li.wp-has-current-submenu a.wp-has-current-submenu, #adminmenu .wp-has-current-submenu.opensub .wp-submenu {
            background: #212121;
        }
    }
    .folded #adminmenu .current div.wp-menu-image:before, .folded #adminmenu .wp-has-current-submenu div.wp-menu-image:before, .folded #adminmenu a.current:hover div.wp-menu-image:before, .folded #adminmenu a.wp-has-current-submenu:hover div.wp-menu-image:before, .folded #adminmenu li.wp-has-current-submenu:hover div.wp-menu-image:before {
        color: #ffffff;
    }
    @media only screen and (max-width: 960px) {
        .auto-fold #adminmenu .current div.wp-menu-image:before, .auto-fold #adminmenu .wp-has-current-submenu div.wp-menu-image:before, .auto-fold #adminmenu a.current:hover div.wp-menu-image:before, .auto-fold #adminmenu a.wp-has-current-submenu:hover div.wp-menu-image:before, .auto-fold #adminmenu li.wp-has-current-submenu:hover div.wp-menu-image:before {
            color: white;
        }
    }
    @media only screen and (max-width: 782px) {
        .auto-fold #adminmenu .current div.wp-menu-image:before, .auto-fold #adminmenu .wp-has-current-submenu div.wp-menu-image:before, .auto-fold #adminmenu a.current:hover div.wp-menu-image:before, .auto-fold #adminmenu a.wp-has-current-submenu:hover div.wp-menu-image:before, .auto-fold #adminmenu li.wp-has-current-submenu:hover div.wp-menu-image:before {
            color: white;
        }
    }
    #adminmenu .wp-submenu a, #adminmenu .wp-has-current-submenu .wp-submenu a, #adminmenu .wp-has-current-submenu.opensub .wp-submenu a {
        color: #bbbbbb;
    }
    /* sidebar submenu item hover text color */
    #adminmenu .wp-submenu a:hover, #adminmenu .wp-has-current-submenu .wp-submenu a:hover, #adminmenu .wp-has-current-submenu.opensub .wp-submenu a:hover {
        color: #888;
    }
    /* sidebar submenu current item hover text color */
    #adminmenu .opensub .wp-submenu li.current a, #adminmenu .wp-submenu li.current, #adminmenu .wp-submenu li.current a, #adminmenu .wp-submenu li.current a:focus, #adminmenu .wp-submenu li.current a:hover, #adminmenu a.wp-has-current-submenu:focus+.wp-submenu li.current a {
        color: white !important;
    }
    #adminmenu .wp-submenu {
        background: #212121;
    }
    #adminmenu li.wp-has-submenu.wp-not-current-submenu.opensub:hover:after {
        border-right-color: #212121;
    }
    #adminmenu .opensub .wp-submenu a {
        color: #bbbbbb;
    }
    /* submenu hover text color */
    #adminmenu .opensub .wp-submenu a:hover {
        color: white;
    }
    .folded #adminmenu .wp-has-current-submenu a:hover, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu a:hover {
        color: #ffd8d3;
    }
    .folded.sticky-menu #adminmenu .wp-has-current-submenu.opensub .wp-submenu a:hover {
        color: #ffd8d3;
    }
    @media only screen and (max-width: 960px) {
        .sticky-menu #adminmenu .wp-has-current-submenu.opensub .wp-submenu a:hover {
            color: #ffd8d3;
        }
    }
    .folded #adminmenu .wp-has-current-submenu a, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu a {
        color: #ffffff;
    }
    .folded.sticky-menu #adminmenu .wp-has-current-submenu.opensub .wp-submenu a {
        color: #ffffff;
    }
    @media only screen and (max-width: 960px) {
        .sticky-menu #adminmenu .wp-has-current-submenu.opensub .wp-submenu a {
            color: #ffffff;
        }
    }
    @media only screen and (max-width: 782px) {
        .folded #adminmenu .wp-has-current-submenu a, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu a {
            color: #bbbbbb;
        }
        .folded #adminmenu .wp-has-current-submenu a:hover, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu a:hover {
            color: #ffffff;
        }
    }
    .folded #adminmenu .wp-submenu li.current, .folded #adminmenu .wp-submenu li.current a, .folded #adminmenu .opensub .wp-submenu li.current, .folded #adminmenu .opensub .wp-submenu li.current a, .folded #adminmenu .opensub .wp-submenu li.current a:focus, .folded #adminmenu .opensub .wp-submenu li.current a:hover {
        color: #ffffff;
    }
    @media only screen and (max-width: 960px) {
        #adminmenu .wp-submenu li.current a, #adminmenu .opensub .wp-submenu li.current, #adminmenu .opensub .wp-submenu li.current a, #adminmenu .opensub .wp-submenu li.current a:focus, #adminmenu .opensub .wp-submenu li.current a:hover {
            color: #ffffff;
        }
        .sticky-menu #adminmenu .wp-submenu li.current a .sticky-menu #adminmenu .opensub .wp-submenu li.current, .sticky-menu #adminmenu .opensub .wp-submenu li.current a, .sticky-menu #adminmenu .opensub .wp-submenu li.current a:focus, .sticky-menu #adminmenu .opensub .wp-submenu li.current a:hover {
            color: #ffffff;
        }
    }
    @media only screen and (max-width: 960px) {
        .sticky-menu #adminmenu .wp-has-current-submenu.opensub.wp-menu-open .wp-submenu, .sticky-menu #adminmenu .wp-menu-open.opensub .wp-submenu, .sticky-menu #adminmenu a.wp-has-current-submenu.wp-menu-open:focus+.wp-submenu, .sticky-menu .no-js li.wp-has-current-submenu.wp-menu-open:hover .wp-submenu {
            background: #ea5340;
        }
    }
    .folded #adminmenu .wp-has-current-submenu .wp-submenu, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu, .folded #adminmenu a.wp-has-current-submenu:focus+.wp-submenu, .folded #adminmenu a.wp-has-current-submenu.opensub:focus+.wp-submenu, .folded #adminmenu .wp-has-current-submenu .wp-submenu .wp-submenu-head, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu .wp-submenu-head, .folded #adminmenu .wp-menu-arrow, .folded #adminmenu .wp-menu-arrow div, .folded #adminmenu li.current a.menu-top, .folded #adminmenu li.wp-has-current-submenu a.wp-has-current-submenu, .folded #adminmenu li.current.menu-top, .folded #adminmenu li.wp-has-current-submenu {
        background: #ea5340;
        color: #ffffff;
    }
    .folded #adminmenu .wp-has-current-submenu .wp-submenu .wp-submenu-head, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu .wp-submenu-head {
        background: none;
    }
    @media only screen and (max-width: 782px) {
        .folded #adminmenu .wp-has-current-submenu .wp-submenu, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu, .folded #adminmenu a.wp-has-current-submenu:focus+.wp-submenu, .folded #adminmenu a.wp-has-current-submenu.opensub:focus+.wp-submenu, .folded #adminmenu .wp-has-current-submenu .wp-submenu .wp-submenu-head, .folded #adminmenu .wp-has-current-submenu.opensub .wp-submenu .wp-submenu-head, .folded #adminmenu .wp-menu-arrow, .folded #adminmenu .wp-menu-arrow div, .folded #adminmenu li.current a.menu-top, .folded #adminmenu li.wp-has-current-submenu a.wp-has-current-submenu, .folded #adminmenu li.current.menu-top, .folded #adminmenu li.wp-has-current-submenu {
            background: none;
            color: #ea5340;
        }
    }
    @media only screen and (max-width: 960px) {
        #adminmenu .wp-has-current-submenu .wp-submenu .wp-submenu-head, #adminmenu .wp-menu-arrow, #adminmenu .wp-menu-arrow div, #adminmenu li.current a.menu-top, .folded #adminmenu li.current.menu-top, .folded #adminmenu li.wp-has-current-submenu {
            background: none;
            color: #ffffff;
        }
    }
    @media only screen and (max-width: 782px) {
        #adminmenu .wp-has-current-submenu .wp-submenu .wp-submenu-head, #adminmenu .wp-menu-arrow, #adminmenu .wp-menu-arrow div, #adminmenu li.current a.menu-top, .wp-responsive-open #adminmenu li.current a.menu-top, .folded #adminmenu .wp-has-current-submenu .wp-submenu, .folded #adminmenu a.wp-has-current-submenu:focus+.wp-submenu, .folded #adminmenu .wp-has-current-submenu .wp-submenu .wp-submenu-head, .folded #adminmenu li.current.menu-top, .folded #adminmenu li.wp-has-current-submenu {
            background: none;
            color: white;
        }
    }
    #adminmenu .awaiting-mod, #adminmenu .update-plugins, #sidemenu li a span.update-plugins, #adminmenu li a.wp-has-current-submenu .update-plugins, #adminmenu li.current a .awaiting-mod {
        background: #d54e21;
        color: #ffffff;
    }
    
    /* sidebar menu item text color */
    #adminmenu .wp-submenu a:focus, #adminmenu .wp-submenu a:hover, #adminmenu a:hover, #adminmenu li.menu-top>a:focus, #adminmenu li:hover div.wp-menu-image:before, #adminmenu li.opensub a, #collapse-menu:hover, #collapse-menu:hover #collapse-button div:after {
        color: white;
    }
    /* sidebar menu iten icon color */
    #adminmenu li a:focus div.wp-menu-image:before, #adminmenu li.opensub div.wp-menu-image:before, #adminmenu li:hover div.wp-menu-image:before{
        color: white ;
    }
    /* sidebar menu iten text color */
    #adminmenu li.menu-top:hover, #adminmenu li.opensub>a.menu-top, #adminmenu li>a.menu-top:focus{
        color: white;
    }
    
    .wp-has-current-submenu .wp-menu-name{
        color: white;
    }
    
    
    
    
    #wpfooter {
        background-color: #444343;
        color: #999999;
    }
    #wpfooter a {
        color: #ffffff;
    }
    #wpfooter a:hover {
        color: #ffffff;
    }
    a, .view-switch a.current:before {
        color: #277e9e;
    }
    a:hover {
        color: #277e9e;
    }
    #poststuff #post-body.columns-2 #side-sortables, .comment-php #submitdiv, #postbox-container-2, .howto, .ac_match, .subsubsub a.current {
        color: #555555;
    }
    span.wp-media-buttons-icon:before, .post-format-icon:before, .post-state-format:before, input[type=radio]:checked+label:before, input[type=checkbox]:checked:before {
        color: #555555;
    }
    .insert-media.add_media:hover span.wp-media-buttons-icon:before {
        color: #ffffff;
    }
    input[type=radio]:checked:before {
        background: #555555;
    }
    .accordion-section-title:after, .handlediv, .item-edit, .sidebar-name-arrow, .widget-action {
        color: #555555;
    }
    .wrap h2, #poststuff h3, .welcome-panel-content h3, #dashboard-widgets-wrap h3, .widefat tfoot tr th, .widefat thead tr th, th.manage-column a, th.sortable a:active, th.sortable a:focus, th.sortable a:hover {
        color: #222222;
    }
    input[type=checkbox]:focus, input[type=color]:focus, input[type=date]:focus, input[type=datetime-local]:focus, input[type=datetime]:focus, input[type=email]:focus, input[type=month]:focus, input[type=number]:focus, input[type=password]:focus, input[type=radio]:focus, input[type=search]:focus, input[type=tel]:focus, input[type=text]:focus, input[type=time]:focus, input[type=url]:focus, input[type=week]:focus, select:focus, textarea:focus {
        border-color: #2ea2cc;
    }
    .tablenav .tablenav-pages a:focus, .tablenav .tablenav-pages a:hover {
        background: #2ea2cc;
        color: #fff;
    }
    #side-sortablesback, .comment-php #submitdiv-back, #poststuff #post-body.columns-2 #side-sortables, .comment-php #submitdiv, #normal-sortables .postbox, #dashboard-widgets-wrap #normal-sortables .postbox, #dashboard-widgets-wrap #side-sortables .postbox, #dashboard-widgets-wrap #column3-sortables .postbox, #dashboard-widgets-wrap #column4-sortables .postbox, #dashboard-widgets-wrap #column5-sortables .postbox, #contextual-help-link-wrap, #screen-options-link-wrap {
        background-color: #eeecec;
        color: #555555;
    }
    @media only screen and (max-width: 850px) {
        .postbox {
            background-color: #eeecec;
            color: #555555;
        }
    }
    .wp-list-table tr:hover, table.comments tr:hover, .edit-tags-php #col-left, #col-leftback {
        background: #eeecec;
    }
    #poststuff h3 {
        color: #222222;
    }
    .postbox #misc-publishing-actions label[for=post_status]:before, #post-body .postbox #visibility:before, #post-body .postbox .misc-pub-revisions:before, .postbox .curtime #timestamp:before {
        color: #555555;
    }
    .postbox .howto, .postbox input[type=radio]:checked:before, .postbox input[type=checkbox]:checked:before {
        color: #555555;
    }
    .postbox a {
        color: #277e9e;
    }
    .postbox a:hover {
        color: #277e9e;
    }
    .postbox input[type=checkbox]:focus, .postbox input[type=color]:focus, .postbox input[type=date]:focus, .postbox input[type=datetime-local]:focus, .postbox input[type=datetime]:focus, .postbox input[type=email]:focus, .postbox input[type=month]:focus, .postbox input[type=number]:focus, .postbox input[type=password]:focus, .postbox input[type=radio]:focus, .postbox input[type=search]:focus, .postbox input[type=tel]:focus, .postbox input[type=text]:focus, .postbox input[type=time]:focus, .postbox input[type=url]:focus, .postbox input[type=week]:focus, .postbox select:focus, .postbox textarea:focus {
        border-color: #2ea2cc;
    }
    .postbox .accordion-section-title:after, .postbox .handlediv, .postbox .item-edit, .postbox .sidebar-name-arrow, .postbox .widget-action {
        color: #222222;
    }
    .postbox .accordion-section-title:after:hover, .postbox .handlediv:hover, .postbox .item-edit:hover, .postbox .sidebar-name-arrow:hover, .postbox .widget-action:hover {
        color: #2ea2cc;
    }
    .postbox {
        border-color: #dad8d8;
    }
    .wp-core-ui .button.button-primary {
        background: #2ea2cc;
        border-color: #2ea2cc;
        color: #ffffff;
    }
    .wp-core-ui .button.button-primary:hover {
        background: #1e8cbe;
        border-color: #1e8cbe;
        color: #ffffff;
    }
    .wp-core-ui .button, .wp-core-ui .button-secondary, .comment-php #minor-publishing .button {
        background: #dcd7d7;
        border-color: #dcd7d7;
        color: #555555;
    }
    .comment-php #minor-publishing .button:hover, .wp-core-ui .button-secondary:focus, .wp-core-ui .button-secondary:hover, .wp-core-ui .button.focus, .wp-core-ui .button.hover, .wp-core-ui .button:focus, .wp-core-ui .button:hover {
        background: #7d7878;
        border-color: #7d7878;
        color: #ffffff;
    }
    .wp-switch-editor.switch-html, .wp-switch-editor:hover {
        background: #eeecec!important;
    }
    .html-active .switch-html, .tmce-active .switch-tmce {
        background: #dcd7d7!important;
    }
    .wrap .add-new-h2, .wrap .add-new-h2:active {
        background: #2ea2cc;
        color: #ffffff;
    }
    .wrap .add-new-h2:hover {
        background: #1e8cbe;
        color: #ffffff;
    }
    .wp-core-ui .postbox .button.button-primary {
        background: #217dc7;
        border-color: #217dc7;
        color: #ffffff;
    }
    .wp-core-ui .postbox .button.button-primary:hover {
        background: #1e8cbe;
        border-color: #1e8cbe;
        color: #ffffff;
    }
    .wp-core-ui .postbox .button, .wp-core-ui .postbox .button-secondary, .comment-php .postbox #minor-publishing .button {
        background: #dcd7d7;
        border-color: #dcd7d7;
        color: #555555;
    }
    .wp-core-ui .postbox .button:hover, .comment-php .postbox #minor-publishing .button:hover, .wp-core-ui .postbox .button-secondary:focus, .wp-core-ui .postbox .button-secondary:hover, .wp-core-ui .postbox .button.focus, .wp-core-ui .postbox .button.hover, .wp-core-ui .postbox .button:focus, .wp-core-ui .postbox .button:hover {
        background: #7d7878;
        border-color: #7d7878;
        color: #ffffff;
    }
    #screen-meta-links a, #screen-meta-links a.show-settings {
        color: #777777;
        background: #eeecec!important;
    }
    #screen-meta-links a:hover, #screen-meta-links a.show-settings:hover {
        color: #333333;
        background: #eeecec!important;
    }
    #screen-meta-links a:after {
        color: #777777;
    }
    #screen-meta-links a:hover:after {
        color: #333333;
    }
    .wrap h2, #post-body-content>h2, .widefat thead th, .widefat tfoot th, .slate-settings .pageSection section, #slate__colorSchemes .colorNav ul, #welcome-panel, #wp-content-editor-tools, .wp-editor-expand #wp-content-editor-tools {
        border-color: #eeecec;
    }
    .nav-tab {
        background: #eeecec;
        border-color: #eeecec;
        color: #555555;
    }
    .nav-tab:hover {
        color: #555555;
    }
    
    
    
    
    
    
    
    
    
    /* header bar
    admin-bar bg*/
    #wpadminbar {
        background-color: white;
        border-bottom:1px solid  #e8e8e8;
    }
    /* admin-bar item bg*/
    #wpadminbar:not(.mobile) .ab-top-menu>li:hover>.ab-item{
        background-color: rgba(255,255,255,0);
        color: black;
    }
    #wpadminbar .quicklinks a.ab-item:focus .ab-icon:before{
      color:black;
      }
    #wpadminbar:not(.mobile) .ab-top-menu>li>.ab-item:focus{
      background:rgba(255,255,255,0);
    }
    #wpadminbar:not(.mobile)>#wp-toolbar li:hover span.ab-label{
      color:black;
    }
    #wpadminbar:not(.mobile)>#wp-toolbar a:focus span.ab-label{ 
      color:black; 
    }
    
    /* admin-bar item hover bg*/
    #wpadminbar .ab-top-menu>li.hover>.ab-item, #wpadminbar .ab-top-menu>li:hover>.ab-item, #wpadminbar .ab-top-menu>li>.ab-item:focus, #wpadminbar.nojq .quicklinks .ab-top-menu>li>.ab-item:focus{
        background-color: rgba(255,255,255,0);
    }
    /* admin-bar icon color*/
    #wpadminbar.mobile .quicklinks .ab-icon:before, #wpadminbar.mobile .quicklinks .ab-item:before{
        color:black;
    }
    
    /* admin-bar color */
    #wpadminbar #adminbarsearch:before, #wpadminbar .ab-icon:before, #wpadminbar .ab-item:before, #wpadminbar a.ab-item, #wpadminbar>#wp-toolbar span.ab-label, #wpadminbar>#wp-toolbar span.noticon {
        color: black;
    }
    
        /* admin-bar submenu bg*/
         #wpadminbar .menupop .ab-sub-wrapper, #wpadminbar .quicklinks .menupop ul.ab-sub-secondary, #wpadminbar .quicklinks .menupop ul.ab-sub-secondary .ab-submenu, .wp-responsive-open #wpadminbar #wp-admin-bar-menu-toggle a {
            background: white;
        }
    
        /* admin-bar hover icon color */
        #wpadminbar li .ab-item:focus:before{
            color: black ;
        }
    
        /* submenu hover icon color */
        #wpadminbar li a:focus .ab-icon:before, 
        #wpadminbar li.hover .ab-icon:before, 
        #wpadminbar li.hover .ab-item:before,
        #wpadminbar li:hover #adminbarsearch:before, 
        #wpadminbar li:hover .ab-icon:before, 
        #wpadminbar li:hover .ab-item:before,
        #wpadminbar>#wp-toolbar a:focus span.ab-label, 
        #wpadminbar>#wp-toolbar li.hover span.ab-label, 
        #wpadminbar>#wp-toolbar li:hover span.ab-label, 
        #wpadminbar .ab-top-menu>li.hover>.ab-item, 
        #wpadminbar .ab-top-menu>li:hover>.ab-item,
        #wpadminbar .quicklinks .menupop.hover ul li a, 
        #wpadminbar.nojs .quicklinks .menupop:hover ul li a ,
        #wpadminbar .quicklinks .ab-sub-wrapper .menupop.hover>a {
            color: black;
        }
    
        /* 文字顏色 */
        #wpadminbar .ab-submenu .ab-item, #wpadminbar .quicklinks .menupop ul li a, #wpadminbar .quicklinks .menupop ul li a strong{
            color: black;
        }
    
        /* 子選單 hover 文字顏色 */
        #wpadminbar .quicklinks .menupop ul li a:hover, #wpadminbar .quicklinks .menupop ul li a:hover strong, #wpadminbar .quicklinks .menupop.hover ul li a:hover, #wpadminbar.nojs .quicklinks .menupop:hover ul li a:hover, #wpadminbar .quicklinks .menupop .ab-sub-secondary>li>a:hover {
            background: #217dc7;
        }
        /* 子選單 hover 文字顏色 */
        #wpadminbar>#wp-toolbar .ab-sub-wrapper a.ab-item:hover span.sub-label , #wpadminbar>#wp-toolbar .ab-sub-wrapper a.ab-item:hover span.ab-icon:before{
            color:white;
        }  
        /* 子選單 左右距離 */
        #wpadminbar #wp-admin-bar-my-account.with-avatar #wp-admin-bar-user-actions>li{
            margin-left:0;
        }
        #wpadminbar #wp-admin-bar-user-actions>li{
            margin-right:0;
        }
        /* 子選單 文字顏色 */
        #wpadminbar:not(.mobile) .ab-top-menu>li>.ab-item:focus{
            color:black;
        }
        /* 子選單 focus 文字顏色 */
        #wpadminbar .quicklinks .menupop ul li a:focus, #wpadminbar .quicklinks .menupop ul li a:focus strong , #wpadminbar .quicklinks .menupop.hover ul li a:focus , #wpadminbar.nojs .quicklinks .menupop:hover ul li a:focus , #wpadminbar .quicklinks .menupop .ab-sub-secondary>li .ab-item:focus a{
            color:black;
        }
        /* 子選單 行高 */
        #wpadminbar .quicklinks .menupop ul li .ab-item,#wpadminbar .quicklinks .menupop.hover ul li .ab-item{
            height:32px;
            line-height:32px;
        }
    
    @media screen and (max-width: 782px){
        #wpadminbar .ab-sub-wrapper .ab-icon{
          font: 28px/1 dashicons !important;
          width: 44px;
          height: auto;
        }
        #wpcontent #wp-admin-bar-top-secondary>li#wp-admin-bar-my-account>a{
          width: 52px !important;
          text-indent: 100% !important;
        }
    }
    
    </style>			<style type="text/css">
                    /*<![CDATA[*/
                    .about-wrap h3 {
                        margin-top: 1em;
                        margin-right: 0;
                        margin-bottom: 0.1em;
                        font-size: 1.25em;
                        line-height: 1.3em;
                    }
                    .about-wrap .button-primary {
                        margin-top: 18px;
                    }
                    .about-wrap .button-hero {
                        color: #FFF!important;
                        border-color: #03a025!important;
                        background: #03a025 !important;
                        box-shadow: 0 1px 0 #03a025;
                        font-size: 1em;
                        font-weight: bold;
                    }
                    .about-wrap .button-hero:hover {
                        color:rgb(2, 247, 165);
                        background: #0AAB2E!important;
                        border-color: #0AAB2E!important;
                    }
                    .about-wrap p {
                        margin-top: 0.6em;
                        margin-bottom: 0.8em;
                        line-height: 1.6em;
                        font-size: 14px;
                    }
                    .about-wrap .feature-section {
                        padding-bottom: 5px;
                    }
                    /*]]>*/
                </style>
                        <style>
            i.mce-i-wcopc {
                font: 400 20px/1 dashicons;
                padding: 0;
                vertical-align: top;
                speak: none;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
                margin-left: -2px;
                padding-right: 2px
            }
            </style>
                <script>
        jQuery(document).ready(function() {    
            var newOption = '';
            jQuery("#order_note_type").append(newOption);
            jQuery("#order_note_type").change(function() {
               var orderNote =  jQuery(this).find("option:selected").attr('content');
               jQuery("textarea#add_order_note").val(orderNote.replace(/<br\s*\/?>/mg,"\n"));
            });
        });
        </script>
                <script async="" src="https://static.hotjar.com/c/hotjar-928599.js?sv=6"></script><script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script><script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script></head>


</head>

<body bgcolor='white'>

<div style="width:1060px;margin:auto">
    <FORM METHOD="post" ACTION="emp.do" >
        <label><b>會員編號</b></label>
        <input type="text" name="empno" size="10px">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="搜尋">
    </FORM>
    <span class="displaying-num">1 個項目</span>
    <table class="wp-list-table widefat fixed striped ">
		<thead>
			<tr>
				<td id="cb" class="manage-column column-cb check-column"><label
					class="screen-reader-text" for="cb-select-all-1">選取全部</label><input
					id="cb-select-all-1" type="checkbox"></td>
				<th scope="col" id="customer_status"
					class="manage-column column-customer_status column-primary"><span
					class="status_head tips">顧客狀態</span></th>
				<th scope="col" id="customer_name"
					class="manage-column column-customer_name sortable asc"><span>顧客</span><span
						class="sorting-indicator"></span></th>
				<th scope="col" id="email" class="manage-column column-email">聯絡方式</th>
				<th scope="col" id="customer_notes"
					class="manage-column column-customer_notes"><span
					class="ico_notes tips">顧客備註</span></th>
				<th scope="col" id="last_purchase"
					class="manage-column column-last_purchase sortable asc"><span>最後一次消費</span><span
						class="sorting-indicator"></span></th>
				<th scope="col" id="order_value"
					class="manage-column column-order_value sortable asc"><span>顧客價值</span><span
						class="sorting-indicator"></span></th>
				<th scope="col" id="crm_actions"
					class="manage-column column-crm_actions">動作</th>
			</tr>
		</thead>

		<tbody id="the-list">
			<tr>
				<th scope="row" class="check-column"><label
					class="screen-reader-text" for="cb-select-1">選擇 TinyBot
						Sample</label><input type="checkbox" name="customer_id[]" id="customer_1"
					value="1"></th>
				<td
					class="customer_status column-customer_status has-row-actions column-primary"
					data-colname="顧客狀態"><div style="position: relative;">
						<span class="Customer tips"></span>
					</div>
					<button type="button" class="toggle-row">
						<span class="screen-reader-text">顯示更多細節</span>
					</button></td>
				<td class="customer_name column-customer_name" data-colname="顧客"><a
					href="admin.php?page=wc_crm&amp;c_id=1"><img alt=""
						src="https://secure.gravatar.com/avatar/0a89ab651877a21e1d57064f907b1de6?s=32&amp;d=mm&amp;r=g"
						srcset="https://secure.gravatar.com/avatar/0a89ab651877a21e1d57064f907b1de6?s=64&amp;d=mm&amp;r=g 2x"
						class="avatar avatar-32 photo" height="32" width="32"></a> <strong><a
						href="admin.php?page=wc_crm&amp;c_id=1">TinyBot Sample</a></strong> (訪客)</td>
				<td class="email column-email" data-colname="聯絡方式"><span
					title="電子郵件：service.tinybot@gmail.com">service.tinybot@gmail.com</span><br>
				<span class="crm_phone">0000000000</span></td>
				<td class="customer_notes column-customer_notes" data-colname="顧客備註"><span
					class="note-off">-</span></td>
				<td class="last_purchase column-last_purchase" data-colname="最後一次消費"><a
					href="https://tinybot.cc/littlefarm/wp-admin/post.php?post=2866&amp;action=edit">#2866</a>
					- <abbr title="2018/04/11 6:23:52 下午">2018/04/11</abbr></td>
				<td class="order_value column-order_value" data-colname="顧客價值"><span
					class="woocommerce-Price-amount amount"><span
						class="woocommerce-Price-currencySymbol">NT$</span>0</span></td>
				<td class="crm_actions column-crm_actions" data-colname="動作"><a
					class="button tips edit" href="?page=wc_crm&amp;c_id=1">編輯顧客</a><a
					class="button tips view"
					href="edit.php?s=service.tinybot%40gmail.com&amp;post_status=all&amp;post_type=shop_order&amp;shop_order_status&amp;_customer_user&amp;paged=1&amp;mode=list&amp;search_by_email_only">查看訂單</a><a
					class="button tips email"
					href="?page=wc_crm&amp;screen=email&amp;c_id=1">寄送信件</a><a
					class="button tips phone"
					href="post-new.php?post_type=wc_crm_calls&amp;c_id=1">Place
						Call</a></td>
			</tr>
		</tbody>

	</table>
</div>

