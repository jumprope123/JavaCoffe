<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .coffee_and_machine_ul {
      list-style: none;
    }

    .coffee_and_machine_li {
      width : 250px;
      background-color : #000;
      padding : 20px;
      border-top : solid 5px #dfdfdf; /* 상단에만 테두리 생성 */
      transition : background-color 0.2s, margin-left 0.5s;
    }

    .coffee_and_machine_li :hover {
      background-color: gray;
      margin-left: 10px;
    }

      .coffee_and_machine_btn {
        width: 200px;
        height: 30px;
        color: white;
        background: #000;
        border: #fff 1px solid;
      }

</style>
<div id="main margin30 container" style="height: 700px;">


  <ul class="coffee_and_machine_ul">
    <li class="coffee_and_machine_li"><button class="coffee_and_machine_btn" onclick='open_form("/CoffeeAndMachine/intro")'>현 페이지</button></li>
    <li class="coffee_and_machine_li"><button class="coffee_and_machine_btn" onclick='open_form("/CoffeeAndMachine/researchForm")'>커피원두 선택 가이드</button></li>
    <li class="coffee_and_machine_li"><button class="coffee_and_machine_btn" onclick='open_form("/CoffeeAndMachine/researchForm2")'>커피머신 선택 가이드</button></li>
    <li class="coffee_and_machine_li"><button class="coffee_and_machine_btn" onclick='open_form("/CoffeeAndMachine/view2")'>커피 원두지식</button></li>
    <li class="coffee_and_machine_li"><button class="coffee_and_machine_btn" onclick='open_form("/CoffeeAndMachine/view1")'>커피 머신지식</button></li>
  </ul>

  <iframe id="iframeS" src="/CoffeeAndMachine/intro" scrolling="yes" frameborder="no" width="1200" height="700"
          STYLE="position: absolute; top: 200px; left: 400px; "></iframe>

</div>


