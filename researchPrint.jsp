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

    int sum =0; //알고리즘 계산 위한 정수합계 변수

    String flavor = request.getParameter("flavor");
    out.println("맛(산미) : ");
    if (flavor.equals("1")){
        out.println("<b>시큼한 맛</b><br>");
        sum = sum + Integer.parseInt(flavor);
            }else {
        out.println("<b>담백고소한 맛</b><br>");
        sum = sum + Integer.parseInt(flavor);
        }

    String cbodyArr[] = request.getParameterValues("cbody");
    out.println("당신이 좋아하는 커피 바디감은");
        for(String cbody : cbodyArr){
            int n = Integer.parseInt(cbody);
            switch (n) {
                case 1: out.println("<b>묵직한 바디감의 부드러운 목넘김</b>입니다.<br>");
                sum = sum + n;
                break;
                case 2: out.println("<b>중간정도 바디감의 부담스럽지 않은 목넘김</b>입니다.<br>");
               sum = sum + n;
                    break;
                case 3: out.println("<b>가벼운 바디감의 담백한 목넘김</b>입니다.<br>");
                sum = sum + n;
                    break;
            }
        }

        String bitterArr[] = request.getParameterValues("bitter");
        out.println("당신이 좋아하는 커피의 쓴맛 정도는");
        for(String bitter : bitterArr){
            int n = Integer.parseInt(bitter);
            switch (n) {
                case 1: out.println("<b>연한맛 </b>입니다.<br>");
                    sum = sum + n;
                break;
                case 2: out.println("<b>중간정도 쓰기 </b>입니다.<br>");
                    sum = sum + n;
                    break;
                case 3: out.println("<b>악마처럼 쓴맛 </b>입니다.<br>");
                    sum = sum + n;
                    break;
            }
        }

        String roastingArr[] = request.getParameterValues("roasting");
        out.println("당신이 좋아하는 로스팅정도는");
        for(String roasting : roastingArr){
            int n = Integer.parseInt(roasting);
            switch (n) {
                case 1: out.println("<b>마일드 로스팅</b>입니다.<br>");
                    sum = sum + n;
                break;
                case 2: out.println("<b>미디엄 로스팅</b>입니다.<br>");
                    sum = sum + n;
                    break;
                case 3: out.println("<b>다크 로스팅</b>입니다.<br>");
                    sum = sum + n;
                    break;
            }
        }

    String kindcoffee = request.getParameter("kindcoffee");
        out.println("커피원두배합 : ");
        if(kindcoffee.equals("1")){
            out.println("<b>아라비카100%</b><br><br><br>");
            sum = sum + 1;
        }else{
            out.println("<b>혼합원두</b><br>");
            sum = sum + 2;
        }




        out.println("총 점수는" + sum + "입니다");

        if(sum >10){
            out.println("강렬한 커피를 좋아하시는 당신께 '커피3' 을 추천해드립니다.");
        } else if(sum >6){
            out.println("중간정도의  커피를 좋아하시는 당신께 '커피2' 을 추천해드립니다.");
        } else{
            out.println("마일드한 커피를 좋아하시는 당신께 '커피1' 을 추천해드립니다.");
        }

%>

        <br>
<b><a href="javascript:history.go(-1)">다시</a></b>


</body>
</html>
