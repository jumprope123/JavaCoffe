<%@ page pageEncoding="UTF-8" %>
<div style="width: 800px;" id="main">
<h2> 커피 선호도 조사</h2>
<form action="/CoffeeAndMachine/researchPrint" method="get">
    <table>
        <tr>
            <td>고객명 : </td>
            <td>
                <input type="text" name="name" size="20">
            </td>
        </tr>
        <tr>
            <td>맛(산미) : </td>
            <td>
                <input type="radio" name="flavor" value="1" checked="checked">시큼함
                <input type="radio" name="flavor" value="2" >담백
             </td>
        </tr>

        <tr>
            <td>바디감(목넘김)</td>
            <td>
                <input type="radio" name ="cbody" value="1">부드러운목넘김
                <input type="radio" name ="cbody" value="2" checked>중간정도목넘김
                <input type="radio" name ="cbody" value="3">담백한넘김
            </td>
        </tr>

        <tr>
            <td>쓴맛강도</td>
            <td>
            <input type="radio" name="bitter" value="1">연함
            <input type="radio" name="bitter" value="2" checked>중간
            <input type="radio" name="bitter" value="3">매우씀
            </td>
        </tr>

        <tr>
            <td>로스팅</td>
            <td>
            <input type="radio" name="roasting" value="1">마일드
            <input type="radio" name="roasting" value="2" checked>미디엄
            <input type="radio" name="roasting" value="3">다크
            </td>
        </tr>

        <tr>
            <td>원두배합</td>
            <td>
            <input type="radio" name="kindcoffee" value="1" checked>아라비카100
            <input type="radio" name="kindcoffee" value="2" >혼합
            </td>

        </tr>

        <tr align="center">
            <td><input type="submit" value="전송"></td>
            <td><input type="reset" value="초기화"></td>

        </tr>

    </table>

</form>
</div>