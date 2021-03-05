<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
    <meta charset="UTF-8">
    <title>커피 선호도 조사결과</title>
    <style type="text/css">
        b {
            font-size: 16pt;
        }
    </style>
</head>
<body>
<h2>커피 설문 결과</h2>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    out.println("이름 : <b>" + name +"</b><br>");

    String flavor = request.getParameter("flavor");
    out.println("우유제품 가능여부 : ");
    if (flavor.equals("1")){
        out.println("<b>추출만 가능</b><br>");
    }else {
        out.println("<b>라떼 가능</b><br>");
    }

    String cbodyArr[] = request.getParameterValues("cbody");
    out.println("적정한 가격대는 : ");
    for(String cbody : cbodyArr){
        int n = Integer.parseInt(cbody);
        switch (n) {
            case 1: out.println("<b>10만원대</b>입니다.<br>");
                break;
            case 2: out.println("<b>20만원대</b>입니다.<br>");
                break;
            case 3: out.println("<b>30만원 이상</b>입니다.<br>");
                break;
        }
    }

    String bitterArr[] = request.getParameterValues("bitter");
    out.println("전기사용량 : ");
    for(String bitter : bitterArr){
        int n = Integer.parseInt(bitter);
        switch (n) {
            case 1: out.println("<b>500W 이하 </b>입니다.<br>");
                break;
            case 2: out.println("<b>1000W </b>입니다.<br>");
                break;
            case 3: out.println("<b>1000W 초과 </b>입니다.<br>");
                break;
        }
    }

    String roastingArr[] = request.getParameterValues("roasting");
    out.println("당신이 좋아하는 색상은 : ");
    for(String roasting : roastingArr){
        int n = Integer.parseInt(roasting);
        switch (n) {
            case 1: out.println("<b>실버</b>입니다.<br>");
                break;
            case 2: out.println("<b>블랙</b>입니다.<br>");
                break;
            case 3: out.println("<b>화이트</b>입니다.<br>");
                break;
        }
    }

    String kindcoffee = request.getParameter("kindcoffee");
    out.println("우유 거품기 : ");
    if(kindcoffee.equals("1")){
        out.println("<b>거품기 없음</b><br><br><br>");
    }else{
        out.println("<b>거품기 장착</b><br>");
    }

    out.println("그래서 추천해드리는 커피머신은 종류2 입니다.");
%>

<br>
<b><a href="javascript:history.go(-1)">다시</a></b>


</body>
</html>