<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>

<%
    MemService memSvc = new MemService();
    List<MemVO> list = memSvc.getAll();
    pageContext.setAttribute("list",list);
    MemVO memVO = (MemVO) request.getAttribute("memVO");
%>

<!DOCTYPE html>
<!-- saved from url=(0038)https://shopee.tw/user/account/profile -->
<html lang="zh-Hant">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1240,shrink-to-fit=no">
    <meta name="shopee:git-sha" content="d6504aeef596b7d401a7f2e10121f3e3e9eb2137">
    <meta name="shopee:version" content="pc-v4.108.1">

    <script>dataLayer = []</script>
    <script>!function (e, t, a, n, r) { e[n] = e[n] || [], e[n].push({ "gtm.start": (new Date).getTime(), event: "gtm.js", country: "tw" }); var g = t.getElementsByTagName(a)[0], m = t.createElement(a); m.async = !0, m.src = "https://www.googletagmanager.com/gtm.js?id=GTM-WJZQSJF", g.parentNode.insertBefore(m, g) }(window, document, "script", "dataLayer")</script>
    <link href="./蝦皮購物 _ 花得更少買得更好_files/bundle.57fe1e2ad5aca5e20f23.css" rel="stylesheet">
    <style data-href="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg//assets/1714.97be9cb79641e5619edf.css">
        .pAJkCU {
            height: 18.75rem;
            margin: 12.5rem auto 1.25rem;
            display: block
        }

        ._1gN_jU {
            text-align: center;
            font-size: 1rem;
            color: #222
        }

        ._1VLvDx {
            border: .0625rem solid rgba(0, 0, 0, .14);
            border-radius: .625rem;
            margin: .625rem;
            padding: .625rem;
            text-align: center
        }

        ._3sjFp {
            border-radius: .125rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0 1rem;
            overflow: hidden;
            outline: none;
            flex: 0 0 auto;
            position: relative
        }

        ._3sjFp:active:before {
            content: "";
            background-color: rgba(0, 0, 0, .05);
            position: absolute;
            bottom: 0;
            right: 0;
            top: 0;
            left: 0
        }

        .lJMau {
            height: 2.75rem
        }

        ._3zn07 {
            height: 2.25rem;
            min-width: 4rem
        }

        ._18F8b {
            height: 1.75rem;
            min-width: 4rem;
            padding: 0 .75rem
        }

        .uxSdp {
            height: 1.25rem;
            min-width: 3.25rem;
            padding: 0 .5rem
        }

        .xCn81 {
            background: transparent
        }

        .TOjHY.AHhqR {
            color: #fff;
            border: .0625rem solid transparent;
            background: #ee4d2d;
            background: var(--nc-primary, #ee4d2d)
        }

        .TOjHY.xCn81 {
            color: #ee4d2d;
            color: var(--nc-primary, #ee4d2d);
            border: .0625rem solid #ee4d2d;
            border: .0625rem solid var(--nc-primary, #ee4d2d)
        }

        .TOjHY.xCn81:active:before {
            background-color: #ee4d2d;
            background-color: var(--nc-primary, #ee4d2d);
            opacity: .05
        }

        ._1-4Xn.xCn81 {
            color: rgba(0, 0, 0, .87);
            color: var(--nc-text-primary, rgba(0, 0, 0, .87));
            border: .0625rem solid rgba(0, 0, 0, .26)
        }

        ._1qQAl.xCn81 {
            color: #fff;
            border: .0625rem solid #fff
        }

        ._1qQAl.xCn81:active:before {
            background-color: #fff;
            opacity: .26
        }

        ._3sjFp:disabled {
            color: rgba(0, 0, 0, .26);
            color: var(--nc-util-disabled, rgba(0, 0, 0, .26))
        }

        ._3sjFp:disabled.xCn81 {
            border-color: rgba(0, 0, 0, .09);
            border-color: var(--nc-util-line, rgba(0, 0, 0, .09))
        }

        ._3sjFp:disabled._1qQAl.xCn81 {
            border-color: hsla(0, 0%, 100%, .54);
            color: hsla(0, 0%, 100%, .4)
        }

        ._3sjFp:disabled.TOjHY.AHhqR {
            background: rgba(0, 0, 0, .09)
        }

        ._2HCeY {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap
        }

        ._19rDu {
            margin-left: .25rem
        }

        ._193wCc {
            transition: margin-top .3s cubic-bezier(.4, 0, .2, 1);
            -webkit-overflow-scrolling: touch
        }

        ._193wCc._3cVWns {
            margin-top: 7.4375rem
        }

        ._193wCc._3GgbTj {
            margin-top: 11.125rem
        }

        .stardust-dropdown {
            position: relative
        }

        .stardust-dropdown__item-body {
            transition: height .4s cubic-bezier(.4, 0, .2, 1), opacity .4s cubic-bezier(.4, 0, .2, 1);
            height: 0;
            opacity: 0;
            overflow: hidden
        }

        .stardust-dropdown__item-body--open {
            height: auto;
            opacity: 1
        }

        ._3SsG4j {
            text-decoration: none;
            color: rgba(0, 0, 0, .87);
            display: block;
            margin-bottom: .9375rem;
            color: rgba(0, 0, 0, .65)
        }

        ._2PrdXX:hover,
        ._3SzYTH {
            color: #ee4d2d
        }

        ._2PrdXX {
            font-size: .875rem;
            display: block
        }

        ._2PrdXX,
        ._3aAm2h {
            text-transform: capitalize;
            transition: color .1s cubic-bezier(.4, 0, .2, 1)
        }

        ._3aAm2h {
            text-decoration: none;
            color: rgba(0, 0, 0, .87);
            display: flex;
            align-items: center;
            margin-bottom: .9375rem
        }

        ._3aAm2h._3RsaDw,
        ._3aAm2h:hover {
            color: #ee4d2d
        }

        ._21F-bS {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 1.25rem;
            height: 1.25rem;
            line-height: 1.25rem;
            text-align: center;
            border-radius: 50%;
            color: #fff;
            flex-shrink: 0;
            margin-right: .625rem
        }

        ._21F-bS>img {
            width: 100%;
            height: 100%
        }

        ._2i7380 {
            line-height: 1rem
        }

        ._3CHLlN {
            font-weight: 500;
            margin-right: .3125rem
        }

        ._3W8r9U {
            vertical-align: middle;
            position: absolute
        }

        ._3aiYwk {
            display: block;
            padding: 0 0 .1875rem 2.125rem
        }

        ._1_68zU {
            display: flex;
            padding: 15px 0;
            border-bottom: 1px solid #efefef
        }

        ._2BuJEf,
        .shopee-avatar {
            width: 50px;
            height: 50px
        }

        ._2uLDqN {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding-left: 15px;
            overflow: hidden
        }

        ._2lG70n {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            min-height: 1rem;
            font-weight: 600;
            margin-bottom: 5px;
            color: #333
        }

        ._27BCO5 {
            color: #888;
            text-transform: capitalize;
            text-decoration: none
        }

        .CQhyq2 {
            margin-top: .9375rem;
            display: flex;
            align-items: center
        }

        .CQhyq2+._3XeQLS {
            margin-top: 1.25rem
        }

        ._3XeQLS {
            margin-top: .9375rem
        }

        ._3XeQLS .oNy5z2 {
            margin-left: 2.125rem
        }

        ._3PN9C9 {
            height: 1.5rem;
            width: 1.5rem;
            border-radius: 50%;
            margin-right: .625rem
        }

        .oNy5z2 {
            height: 1rem;
            width: 8.75rem
        }

        ._2ZEaD {
            background-color: #a4aaaa;
            background-image: linear-gradient(90deg, #a4aaaa, #000 25%, #a4aaaa 50%);
            background-repeat: no-repeat;
            background-size: 200% 100%;
            background-position: 100% 0;
            -webkit-animation: _2ZEaD 1.5s infinite;
            animation: _2ZEaD 1.5s infinite;
            -webkit-transform: translateZ(0);
            transform: translateZ(0)
        }

        ._2ZEaD .geCJg {
            background: #fff;
            isolation: isolate;
            mix-blend-mode: screen
        }

        ._2ZEaD .M6lQx {
            background: #f1f0f0
        }

        @-webkit-keyframes _2ZEaD {
            0% {
                background-position: 100% 0
            }

            to {
                background-position: -100% 0
            }
        }

        @keyframes _2ZEaD {
            0% {
                background-position: 100% 0
            }

            to {
                background-position: -100% 0
            }
        }

        ._36cLcR {
            display: block;
            width: 180px;
            flex-shrink: 0
        }

        ._1ZnP-m {
            list-style: none;
            padding: 0;
            margin: 27px 0 0;
            cursor: pointer
        }

        ._1QwuCJ {
            display: flex;
            padding: 1.25rem 0 3.125rem
        }

        ._3D9BVC {
            position: relative;
            flex-grow: 1;
            width: 980px;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            margin-left: 1.6875rem;
            min-width: 0;
            background: #fff;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .13);
            border-radius: .125rem
        }

        ._3pDGyR {
            position: absolute;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            background-color: transparent
        }

        /*# sourceMappingURL=https://shopee.sg/assets/1714.97be9cb79641e5619edf.css.map*/
    </style>
    <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
    <title>蝦皮購物 | 花得更少買得更好</title>
    <link rel="stylesheet" type="text/css" href="./蝦皮購物 _ 花得更少買得更好_files/2825.51680d86fe84cd4ddf65.css">
</head>

<body style="" class="nt-s nl-l">

    <div id="main">
        <div>
            <div class="shopee-progress-bar"></div>
            <div class="_193wCc">
                <div class="container _1QwuCJ">
                    <div class="_36cLcR"></div>
                    <div class="_3D9BVC">
                        <div class="h4QDlo" role="main">
                            <div class="_2YiVnW">
                                <div class="_2w2H6X">
                                    <h1 class="_3iiDCN">我的檔案</h1>
                                    <div class="TQG40c">管理你的檔案以保護你的帳戶</div>
                                </div>
                                <div class="goiz2O">
                                    <div class="pJout2">
                                        <form>
                                            <div class="_3BlbUs">
                                                <div class="_1iNZU3">
                                                    <div class="_2PfA-y"><label>會員帳號</label></div>
                                                    <div class="_2_JugQ">
                                                        <div class="_2bdFDW">
                                                            <div class="_3S9myJ">seansu411</div><button
                                                                class="_2CLMxo"></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="_3BlbUs">
                                                <div class="_1iNZU3">
                                                    <div class="_2PfA-y"><label>會員帳號</label></div>
                                                    <div class="_2_JugQ">
                                                        <div class="_2bdFDW">
                                                            <div class="_3S9myJ">seansu411</div><button
                                                                class="_2CLMxo"></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="_3BlbUs">
                                                <div class="_1iNZU3">
                                                    <div class="_2PfA-y"><label>姓名</label></div>
                                                    <div class="_2_JugQ">
                                                        <div class="input-with-validator-wrapper">
                                                            <div class="input-with-validator"><input type="text"
                                                                    placeholder="" maxlength="255" value="谷小舖"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="_3BlbUs">
                                                <div class="_1iNZU3">
                                                    <div class="_2PfA-y"><label>Email</label></div>
                                                    <div class="_2_JugQ">
                                                        <div class="_2bdFDW">
                                                            <div class="_3S9myJ">se**********@gmail.com</div><button
                                                                class="_2CLMxo">變更</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="_3BlbUs">
                                                <div class="_1iNZU3">
                                                    <div class="_2PfA-y"><label>手機號碼</label></div>
                                                    <div class="_2_JugQ">
                                                        <div class="_2bdFDW">
                                                            <div class="_3S9myJ">**********65</div><button
                                                                class="_2CLMxo">變更</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="_3BlbUs">
                                                <div class="_1iNZU3">
                                                    <div class="_2PfA-y"><label>賣場名稱</label></div>
                                                    <div class="_2_JugQ">
                                                        <div class="input-with-validator-wrapper">
                                                            <div class="input-with-validator"><input type="text"
                                                                    placeholder="" maxlength="255" value="seansu411">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="_3BlbUs">
                                                <div class="_1iNZU3">
                                                    <div class="_2PfA-y"><label>性別</label></div>
                                                    <div class="_2_JugQ">
                                                        <div class="_119wWy">
                                                            <div class="stardust-radio-group" role="radiogroup">
                                                                <div class="stardust-radio stardust-radio--checked"
                                                                    tabindex="0" role="radio" aria-checked="true">
                                                                    <div
                                                                        class="stardust-radio-button stardust-radio-button--checked">
                                                                        <div
                                                                            class="stardust-radio-button__outer-circle">
                                                                            <div
                                                                                class="stardust-radio-button__inner-circle">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="stardust-radio__content">
                                                                        <div class="stardust-radio__label">男性</div>
                                                                    </div>
                                                                </div>
                                                                <div class="stardust-radio" tabindex="0" role="radio"
                                                                    aria-checked="false">
                                                                    <div class="stardust-radio-button">
                                                                        <div
                                                                            class="stardust-radio-button__outer-circle">
                                                                            <div
                                                                                class="stardust-radio-button__inner-circle">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="stardust-radio__content">
                                                                        <div class="stardust-radio__label">女性</div>
                                                                    </div>
                                                                </div>
                                                                <div class="stardust-radio" tabindex="0" role="radio"
                                                                    aria-checked="false">
                                                                    <div class="stardust-radio-button">
                                                                        <div
                                                                            class="stardust-radio-button__outer-circle">
                                                                            <div
                                                                                class="stardust-radio-button__inner-circle">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="stardust-radio__content">
                                                                        <div class="stardust-radio__label">其他</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="_3BlbUs">
                                                <div class="_1iNZU3">
                                                    <div class="_2PfA-y"><label>生日</label></div>
                                                    <div class="_2_JugQ">
                                                        <div class="_2w5iZe">
                                                            <div class="shopee-dropdown shopee-dropdown--has-selected shopee-dropdown--opened"
                                                                style="position: relative;">
                                                                <div
                                                                    class="shopee-dropdown__entry shopee-dropdown__entry--selected">
                                                                    <span>11</span><svg
                                                                        enable-background="new 0 0 11 11"
                                                                        viewBox="0 0 11 11" x="0" y="0"
                                                                        class="shopee-svg-icon icon-arrow-up">
                                                                        <g>
                                                                            <path
                                                                                d="m11 8.5c0-.1 0-.2-.1-.3l-5-6c-.1-.1-.3-.2-.4-.2s-.3.1-.4.2l-5 6c-.2.2-.1.5.1.7s.5.1.7-.1l4.6-5.5 4.6 5.5c.2.2.5.2.7.1.1-.1.2-.3.2-.4z">
                                                                            </path>
                                                                        </g>
                                                                    </svg></div>
                                                                <div class="shopee-popover shopee-popover--default"
                                                                    aria-role="tooltip"
                                                                    style="position: absolute; top: 40px; left: 0px; width: 147.708px; z-index: 600;">
                                                                </div>
                                                            </div>
                                                            <div class="shopee-dropdown shopee-dropdown--has-selected"
                                                                style="position: relative;">
                                                                <div
                                                                    class="shopee-dropdown__entry shopee-dropdown__entry--selected">
                                                                    <span>四月</span><svg
                                                                        enable-background="new 0 0 11 11"
                                                                        viewBox="0 0 11 11" x="0" y="0"
                                                                        class="shopee-svg-icon icon-arrow-down">
                                                                        <g>
                                                                            <path
                                                                                d="m11 2.5c0 .1 0 .2-.1.3l-5 6c-.1.1-.3.2-.4.2s-.3-.1-.4-.2l-5-6c-.2-.2-.1-.5.1-.7s.5-.1.7.1l4.6 5.5 4.6-5.5c.2-.2.5-.2.7-.1.1.1.2.3.2.4z">
                                                                            </path>
                                                                        </g>
                                                                    </svg></div>
                                                            </div>
                                                            <div class="shopee-dropdown shopee-dropdown--has-selected"
                                                                style="position: relative;">
                                                                <div
                                                                    class="shopee-dropdown__entry shopee-dropdown__entry--selected">
                                                                    <span>1995</span><svg
                                                                        enable-background="new 0 0 11 11"
                                                                        viewBox="0 0 11 11" x="0" y="0"
                                                                        class="shopee-svg-icon icon-arrow-down">
                                                                        <g>
                                                                            <path
                                                                                d="m11 2.5c0 .1 0 .2-.1.3l-5 6c-.1.1-.3.2-.4.2s-.3-.1-.4-.2l-5-6c-.2-.2-.1-.5.1-.7s.5-.1.7.1l4.6 5.5 4.6-5.5c.2-.2.5-.2.7-.1.1.1.2.3.2.4z">
                                                                            </path>
                                                                        </g>
                                                                    </svg></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="_31PFen"><button type="button"
                                                    class="btn btn-solid-primary btn--m btn--inline"
                                                    aria-disabled="false">儲存</button></div>
                                        </form>
                                    </div>
                                    <div class="_1aIEbS">
                                        <div class="X1SONv">
                                            <div class="_1FzaUZ">
                                                <div class="TgSfgo"
                                                    style="background-image: url(&quot;https://cf.shopee.tw/file/eacb318f5bafe749eaa83798c21482d4&quot;);">
                                                </div>
                                            </div><input class="_2xS5eV" type="file" accept=".jpg,.jpeg,.png"><button
                                                type="button" class="btn btn-light btn--m btn--inline">選擇圖片</button>
                                            <div class="_3Jd4Zu">
                                                <div class="_3UgHT6">檔案大小:最大1MB</div>
                                                <div class="_3UgHT6">檔案限制: .JPEG, .PNG</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div></div>
            <div class="qgeUgW" id="BackgroundImagePortalAnchor"></div>
        </div>
    </div>
    <div id="modal">
        <div>
            <div class="shopee-modal__transition-appear-done shopee-modal__transition-enter-done"></div>
        </div>
    </div>
    <div class="shopee__kZMc3xKQ4ab">
        <div class="shopee__3o9SfdFxcoiKs"></div>
    </div>
    <div class="shopee__fo0dKsgoukkfcaik">
        <div class="shopee-modal-xbcA3dFx0Ck"></div>
    </div>
	<jsp:include page="/footer/footer.jsp" flush="true"/>
	<jsp:include page="/header/header.jsp" flush="true"/>













</body>

</html>