<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!-- http cache control 관련 코드 : jsp-->
<%response.setHeader("Pragma","no-cache"); response.setDateHeader("Expires",0); response.setHeader("Cache-Control", "no-cache"); %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- http cache control 관련 코드 : meta-->


    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/Member.css">
    <link rel="stylesheet" href="/css/Login.css">
<%--    <link rel="stylesheet" href="/css/find.css">--%>
    <link rel="stylesheet" href="/css/customCSS.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/navi.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <%-- 추가 스타일 --%>
    <title>JAVAPRESSO</title>
</head>
<body id="body" onresize="showscrollbar()">
<div class="container1" style="min-width: 1850px;">
    <tiles:insertAttribute name="header"/>

    <tiles:insertAttribute name="main" />

    <tiles:insertAttribute name="footer"/>
</div>

<script>
    function showscrollbar() {
        if (window.innerWidth < 1850){
            $('#body').css('overflow-x','scroll');
        }else {
            $('#body').css('overflow-x','hidden');
        }
    }
</script>
<!--로그인 모달-->
<%--<tiles:insertAttribute name="modal"/>--%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/review.js"></script>
<%-- Login,Joing - Woo --%>
<script src="/js/login.js"></script>
<script src="/js/join.js"></script>
<script src="/js/zipcode.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<%-- Login,Joing - Woo --%>
<script src="/js/board.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- _findshop-hwang -->
<script src="/js/findshop.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1CCvsEeWN2zyvgcL8RGZ67905NDrwOgM&callback=initMap&region=kr"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1CCvsEeWN2zyvgcL8RGZ67905NDrwOgM&libraries=places"></script>
<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1CCvsEeWN2zyvgcL8RGZ67905NDrwOgM&callback=initAutocomplete&libraries=places&v=weekly"></script>
<!-- // _findshop-hwang -->
<script src="/js/admin.js"></script>
<script src="/js/eshop.js"></script>
<script src="/js/coffeMachine.js"></script>
<script src="/js/buylist.js"></script>
<script src="/js/memberInfo.js"></script>
<script src="/js/mybasket.js"></script>
<script src="/js/coffeMachine.js"></script>
<script src="/js/researchPrint.js"></script>


<script>
    function open_form(url){
        $('#iframeS').attr('src' , url);
    }
</script>


</body>
</html>

<!-- main -->
