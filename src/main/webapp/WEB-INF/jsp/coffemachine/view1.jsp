<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .machine_header { }
        .machine_header a h4 {color: #856404; margin-top: 20px; font-size: 14px; word-spacing: 3px }

        .machine_img_box { margin-top: 50px; width: 650px; height: 580px; }

        .machine_info_box { width: 330px; height: 600px; }

        .info_detail_specs { font-size: 16px; letter-spacing: 3px }

        .info_detail_name { font-size: 35px; font-weight: bolder; line-height: 100%; letter-spacing: 3px }

        .productDetailColorSwitcher { margin-top: 60px; font-size: 13px; letter-spacing: 3px; font-weight: bold }

        .coffemachine_button { margin-top: 13px }

        .coffemachine_info_detail { word-break: break-all; margin-top: 50px }


    </style>
</head>
<body>
<div id="main">
    <div id="wrap" style="margin: 0 auto; width: 996px; height: 600px;">

        <div class="machine_header">
            <a href="#" style="text-decoration-line: none;">
                <h4> < 머신 페이지로 돌아가기</h4>
            </a>
        </div>

        <div class="machine_img_box" style="float:left " >
            <img id="cmImg1" src="/img/cmm/cmwh.png" alt="커피머신">
        </div>

        <div class="machine_info_box" style="float:left ">
            <div>
                <span class="info_detail_specs">바리스타</span>
            </div>
            <div>
                <span class="info_detail_name">바리스타 레시피<br>메이커</span>
            </div>

            <div>
                <div class="productDetailColorSwitcher">색상</div>
                <div class="coffemachine_button row text-center align-items-center mt-3" style="margin-left: 10px;">
                    <button id="mc1Btn" type="button" class="btn bg-white mr-1" style="border: 1px solid gray">White</button>
                    <button id="mc2Btn" type="button" class="btn bg-black text-white mr-1" style="border: 1px solid gray">Black</button>
                    <button id="mc3Btn" type="button" class="btn" style="background-color: rgb(184,184,178); border: 1px solid gray">Silver</button>

                </div>
            </div>

            <div>
                <div class="coffemachine_info_detail" style="text-align: justify">
                    <p>카페에서 즐기는 다양한 레시피를 이제 집에서도 쉽게 만들어보세요.
                        <br>네스프레소 바리스타는 아이스 커피부터 라테 아트까지, 20가지 이상의 레시피를 누구나 간편하게 만들 수 있게 해주는 레시피 메이커입니다.
                        네스프레소 바리스타는 아이스 커피부터 라테 아트까지, 20가지 이상의 레시피를 누구나 간편하게 만들 수 있게 해주는 레시피 메이커입니다.</p>
                    <p>네스프레소 앱과 연동하면 시즌 한정 레시피를 추가로 즐길 수 있습니다.</p>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>