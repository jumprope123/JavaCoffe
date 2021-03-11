<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
    <meta charset="UTF-8">
    <title>머신 추천 알고리즘 결과</title>
    <style type="text/css">
        b {
            font-size: 16pt;
        }
    </style>
</head>
<body>
<h2>머신 추천 알고리즘 결과</h2>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    out.println("이름 : <b>" + name +"</b><br>");

    int sum = 0;

    String flavor = request.getParameter("flavor");
    out.println("우유제품 가능여부 : ");
    if (flavor.equals("1")){
        out.println("<b>추출만 가능</b><br>");
        sum = sum + Integer.parseInt(flavor);
    }else {
        out.println("<b>라떼 가능</b><br>");
        sum = sum + Integer.parseInt(flavor);
    }

    String cbodyArr[] = request.getParameterValues("cbody");
    out.println("적정한 가격대는 : ");
    for(String cbody : cbodyArr){
        int n = Integer.parseInt(cbody);
        switch (n) {
            case 1: out.println("<b>10만원대</b>입니다.<br>");
                sum = sum + n;
                break;
            case 2: out.println("<b>20만원대</b>입니다.<br>");
                sum = sum + n;
                break;
            case 3: out.println("<b>30만원 이상</b>입니다.<br>");
                sum = sum + n;
                break;
        }
    }

    String bitterArr[] = request.getParameterValues("bitter");
    out.println("전기사용량 : ");
    for(String bitter : bitterArr){
        int n = Integer.parseInt(bitter);
        switch (n) {
            case 1: out.println("<b>500W 이하 </b>입니다.<br>");
                sum = sum + n;
                break;
            case 2: out.println("<b>1000W </b>입니다.<br>");
                sum = sum + n;
                break;
            case 3: out.println("<b>1000W 초과 </b>입니다.<br>");
                sum = sum + n;
                break;
        }
    }

    String roastingArr[] = request.getParameterValues("roasting");
    out.println("당신이 좋아하는 색상은 : ");
    for(String roasting : roastingArr){
        int n = Integer.parseInt(roasting);
        switch (n) {
            case 1: out.println("<b>실버</b>입니다.<br>");
                sum = sum + 1;
                break;
            case 2: out.println("<b>블랙</b>입니다.<br>");
                sum = sum + 20;
                break;
            case 3: out.println("<b>화이트</b>입니다.<br>");
                sum = sum + 50;
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

    if(kindcoffee.equals("1")){
        out.println("거품기 없이 추출만 가능한 제품중에서 추천드리는 제품은");
        }else{
        out.println("거품기가 있는 머신중에서 추천드리는 제품은");
            }

    if(sum>50){
        out.println(" '화이트' 색상에 제품a 입니다.");
    }else if(sum>20){
        out.println(" '블랙' 색상에 제품b 입니다.");
    }else{
        out.println(" '실버' 색상에 제품c 입니다.");
    }


%>

<br>
<b><a href="javascript:history.go(-1)">다시</a></b>


</body>
</html>