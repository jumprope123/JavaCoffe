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

        .ProductDetails_intensity { margin-top: 50px }

        .ProductDetails_Notes { margin-top: 30px }

        .ProductDetails_Aromatic { margin-top: 30px }

        .coffemachine_info_detail { word-break: break-all; margin-top: 50px }


    </style>
</head>
<body>
<div id="main">
    <!-- 커피1 -->
    <div id="wrap1" style="margin: 0 auto; width: 996px; height: 700px;">

        <div class="machine_header">
            <a href="#" style="text-decoration-line: none;">
                <h4> < 커피 페이지로 돌아가기</h4>
            </a>
        </div>

        <div class="machine_img_box" style="float:left " >
            <img id="cmImg1" src="/img/cmm/coffeebean1.png" alt="커피머신">
        </div>

        <div class="machine_info_box" style="float:left ">
            <div>
                <span class="info_detail_specs">케이프타운</span>
            </div>
            <div>
                <span class="info_detail_name">케이프타운<br>에비고 룽고</span>
            </div>

            <div>
              <div class="ProductDetails_intensity ProductDetails_col-wrapper">
                  <span class="ProductDetails_info">강도 : </span>
                  <span class="ProductDetails_col-data ProductDetails_intensity step">
                      <span class="ProductDetails_col-data ProductDetails_intensity step int">
                          ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □</span>
                      <span class="ProductDetails_intensity step-label">10</span>
                  </span>
              </div>
            </div>

            <div class="ProductDetails_Aromatic ProductDetails_col-wrapper">
                <span class="ProductDetails-info">아로마 프로파일: </span>
                <span class="ProductDetails_col-data">진한 로스티함</span>
            </div>

            <div class="ProductDetails_Notes ProductDetails_col-wrapper">
                <span class="ProductDetails_info">아로마 노트: </span>
                <span class="ProductDetails_col-data">로스팅향, 우디향</span>
            </div>

            <div>
                <div class="coffemachine_info_detail" style="text-align: justify">
                    <p><b>케이프 타운 엔비보 룽고</b><br>
                    <br>커피 무역 항로의 주요 항구였던 남아프리카공화국의 케이프타운에서는 풍부한 바디감과 진한 우디향의 강도 높은 커피를 즐겨 왔습니다. 케이프타운의 로컬 커피스타일을 즐겨 보세요.
                    <br><br>[룽고 커피란?] 룽고 커피란 이탈리아어로 “길다”라는 뜻으로, 에스프레소보다 오래 추출하여 110ml로 즐기는 커피 입니다.
                    네스프레소 오리지널 머신의 룽고 버튼을 눌러 최상의 룽고 커피를 즐겨 보세요.</p>
                </div>
            </div>

        </div>
    </div>
    <!-- 커피2 -->
    <div id="wrap2" style="margin: 0 auto; width: 996px; height: 700px;">
        <div class="machine_img_box" style="float:left " >
            <img id="cmImg2" src="/img/cmm/coffeebean2.png" alt="커피머신">
        </div>

        <div class="machine_info_box" style="float:left ">
            <div>
                <span class="info_detail_specs">스톡홀름</span>
            </div>
            <div>
                <span class="info_detail_name">스톨홀름<br>포티시오 룽고</span>
            </div>

            <div>
                <div class="ProductDetails_intensity ProductDetails_col-wrapper">
                    <span class="ProductDetails_info">강도 : </span>
                    <span class="ProductDetails_col-data ProductDetails_intensity step">
                      <span class="ProductDetails_col-data ProductDetails_intensity step int">
                          ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □</span>
                      <span class="ProductDetails_intensity step-label">8</span>
                  </span>
                </div>
            </div>

            <div class="ProductDetails_Aromatic ProductDetails_col-wrapper">
                <span class="ProductDetails-info">아로마 프로파일: </span>
                <span class="ProductDetails_col-data">깊은 풍미와 풍부한 바디감</span>
            </div>

            <div class="ProductDetails_Notes ProductDetails_col-wrapper">
                <span class="ProductDetails_info">아로마 노트: </span>
                <span class="ProductDetails_col-data">로스팅향, 맥아향</span>
            </div>

            <div>
                <div class="coffemachine_info_detail" style="text-align: justify">
                    <p><b>스톡홀름 포티시오 룽고</b><br>
                        <br>스웨덴에서는 북유럽의 긴 겨울을 지내면서 이웃과 함께 다크 로스팅된 맥아향의 커피를 즐기는 커피타임인 피카를 가졌습니다. 시나몬롤과 잘 어울리는 깊은 풍미의 진한 맥아향 커피로 피카를 즐겨 보세요.
                        <br><br>[룽고 커피란?] 룽고 커피란 이탈리아어로 “길다”라는 뜻으로, 에스프레소보다 오래 추출하여 110ml로 즐기는 커피 입니다.
                        네스프레소 오리지널 머신의 룽고 버튼을 눌러 최상의 룽고 커피를 즐겨 보세요.</p>
                </div>
            </div>

        </div>
    </div>
    <!-- 커피3 -->
    <div id="wrap3" style="margin: 0 auto; width: 996px; height: 700px;">
        <div class="machine_img_box" style="float:left " >
            <img id="cmImg3" src="/img/cmm/coffeebean3.png" alt="커피머신">
        </div>

        <div class="machine_info_box" style="float:left ">
            <div>
                <span class="info_detail_specs">비엔나</span>
            </div>
            <div>
                <span class="info_detail_name">비엔나<br>리니지오 룽고</span>
            </div>

            <div>
                <div class="ProductDetails_intensity ProductDetails_col-wrapper">
                    <span class="ProductDetails_info">강도 : </span>
                    <span class="ProductDetails_col-data ProductDetails_intensity step">
                      <span class="ProductDetails_col-data ProductDetails_intensity step int">
                          ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □</span>
                      <span class="ProductDetails_intensity step-label">6</span>
                  </span>
                </div>
            </div>

            <div class="ProductDetails_Aromatic ProductDetails_col-wrapper">
                <span class="ProductDetails-info">아로마 프로파일: </span>
                <span class="ProductDetails_col-data">부드럽고 균형 잡힌 풍미</span>
            </div>

            <div class="ProductDetails_Notes ProductDetails_col-wrapper">
                <span class="ProductDetails_info">아로마 노트: </span>
                <span class="ProductDetails_col-data">맥아향, 곡물향</span>
            </div>

            <div>
                <div class="coffemachine_info_detail" style="text-align: justify">
                    <p><b>비엔나 리니지오 룽고</b><br>
                        <br>비엔나 커피하우스에서 커피 애호가들은 부드러운 바디감을 가진 곡물향의 커피를 즐겨 왔습니다. 부드럽고 균형감 있는 풍미의 커피가 선사하는 오스트리아의 우아한 커피 문화를 느껴 보세요.
                        <br><br>[룽고 커피란?] 룽고 커피란 이탈리아어로 “길다”라는 뜻으로, 에스프레소보다 오래 추출하여 110ml로 즐기는 커피 입니다.
                        네스프레소 오리지널 머신의 룽고 버튼을 눌러 최상의 룽고 커피를 즐겨 보세요.</p>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>