<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커피 머신 조사</title>
</head>
<body>
<h2> 커피 머신 조사</h2>
<form action="researchPrint2.jsp" method="post">
    <table>
        <tr>
            <td>고객명 : </td>
            <td>
                <input type="text" name="name" size="20">
            </td>
        </tr>
        <tr>
            <td>우유제품 가능여부 : </td>
            <td>
                <input type="radio" name="flavor" value="1" checked="checked">추출만 가능
                <input type="radio" name="flavor" value="2" >라떼 가능
            </td>
        </tr>

        <tr>
            <td>가격대</td>
            <td>
                <input type="radio" name ="cbody" value="1">10만원대
                <input type="radio" name ="cbody" value="2" checked>20만원대
                <input type="radio" name ="cbody" value="3">30만원 이상
            </td>
        </tr>

        <tr>
            <td>전기사용량</td>
            <td>
                <input type="radio" name="bitter" value="1">500W 이하
                <input type="radio" name="bitter" value="2" checked>1000W
                <input type="radio" name="bitter" value="3">1000W 초과
            </td>
        </tr>

        <tr>
            <td>디자인/색상</td>
            <td>
                <input type="radio" name="roasting" value="1">실버
                <input type="radio" name="roasting" value="2" checked>블랙
                <input type="radio" name="roasting" value="3">화이트
            </td>
        </tr>

        <tr>
            <td>우유 거품기</td>
            <td>
                <input type="radio" name="kindcoffee" value="1" checked>거품기 없음
                <input type="radio" name="kindcoffee" value="2" >거품기 장착
            </td>

        </tr>

        <tr align="center">
            <td><input type="submit" value="전송"></td>
            <td><input type="reset" value="초기화"></td>

        </tr>

    </table>

</form>

</body>
</html>