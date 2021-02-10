<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!-- http cache control 관련 코드 : jsp-->
<%response.setHeader("Pragma","no-cache"); response.setDateHeader("Expires",0); response.setHeader("Cache-Control", "no-cache"); %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- http cache control 관련 코드 : meta-->


    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/customCSS.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <style>
        .fatdiv {padding: 15px;}
        .margin30{margin: 30px 0;}
        .colblack {color: black}
    </style>
    <title>Java Coffe</title>
</head>
<body>
<div class="container">
   <tiles:insertAttribute name="header"/>

    <tiles:insertAttribute name="main" />

   <tiles:insertAttribute name="footer"/>
</div>
<!--로그인 모달-->
<tiles:insertAttribute name="modal"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>

