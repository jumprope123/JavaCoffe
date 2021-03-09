<%@ page pageEncoding="UTF-8" %>

<div id="main margin30 container">
    <div class="margin30 container">
        <h3 class="main_join"><img src="/img/login/GLYPHICONS/glyphicons_043_group.png">회원가입</h3>
        <hr>
    </div>

    <ul class="breadcrumb">
        <li class="breadcrumb-item" >
            <button type="button" class="btn btn-success btn-sm" disabled>
                이용약관</button></li>
        <li class="breadcrumb-item active ">
            <button type="button" class="btn btn-success btn-sm" disabled>
                실명확인</button></li>
        <li class="breadcrumb-item ">
            <button type="button" class="btn btn-light btn-sm" disabled>
                정보입력</button></li>
        <li class="breadcrumb-item ">
            <button type="button" class="btn btn-light btn-sm" disabled>
                가입완료</button></li>
    </ul>

    <div class="container margin100">
        <h2 class="site_agree">실명확인</h2>
        <small class="text-muted site_agree_gray">회원으로 가입하는 방법에는 2가지 방법이 있습니다.
            아래에서 원하는 방법을 선택해주세요&middot; <br>
            입력하신 정보는 가입완료 전까지 본 사이트에 저장되지 않습니다.</small>
        <hr>
    </div>
    <%--실명회원 가입 부분--%>
    <div class="card card-body bg-light margin1050">
        <h3 class="margin30 font-weight-bold real_join">실명확인 회원가입</h3>
        <form id="chkfrm" action="/join/joinme" method="post"> <%--<<<<<<<<<<<<<<<<<<<<<<<<< 뭐가문제지--%>
            <div class="row">
                <div class="col-5 offset-1">
                    <div class="form-group row">
                        <label for="name2"
                               class="col-4 col-form-label real_name">이름</label>
                        <input type="text" id="name2" name="name2"
                               class="form-control col-6">
                    </div>

                    <div class="form-group row" >
                        <label for="jumin1"
                               class="col-4 col-form-label real_jumin">주민번호</label>
                        <input type="text" id="jumin1" name="jumin1" size="10" maxlength="6"
                               class="form-control col-3">&nbsp;
                        <label class="col-form-label">&mdash;</label>&nbsp;
                        <input type="password" id="jumin2" name="jumin2" size="15" maxlength="7"
                               class="form-control col-3">

                    </div>

                    <div class="form-group row">
                        <label class="col-4"></label>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" id="usejm"
                                   class="custom-control-input"> <%--onclick="checkName() || checkJuminNo()">--%> <%--<<<<<<<<<<<<<<<<<<<<<<<<<<<<잠깐 해제--%>
                            <label for="usejm" class="custom-control-label ">
                                주민등록번호 처리에 동의합니다.
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-5">
                    <ul class="font-weight-bold warning_font">
                        <li>실명확인 회원가입시 공개 게시판 이용이 가능합니다</li>
                        <li>타인의 주민등록번호를 임의로 사용하면 <br>
                            <span class="text-danger">'주민등록법'에 의해
                                3년 이하의 징역 또는 1천만원 이하의 벌금</span>이 부과될 수 있습니다. </li>
                        <li>입력하신 주민등록번호는 <span class="text-danger">별도 저장되지 않으면,
                                신용평가기관을 통한 실명확인용</span>으로만 이용됩니다.</li>
                        <li>개인정보보호법에 따라 <span class="text-danger">이용 동의</span>를 받습니다.</li>
                    </ul>
                </div>
            </div>

            <div class="row margin30">
                <div class="col-12 text-center">
                    <form method="post">
                    <button type="button" class="btn btn-primary" id="check2btn">
                        <i class="bi bi-check"></i>확인하기</button>
                    </form>
                    <button type="button" class="btn btn-danger" id="cancle2btn">
                        <i class="bi bi-x"></i>취소하기</button>
                </div>
            </div>

        </form>
    </div><!-- 실명확인 회원가입 -->



    <div class="all_agree_bottom"></div>

  <script>
      function checkJuminNo() { // 주민등록번호 유효성 검사 구문
          var jumins3 = $("#jumin1").val() + $("#jumin2").val();
          //주민등록번호 생년월일 전달

         // var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정      <<<<<<<<<<<<<<< 일단 잠굼
          var buf = new Array(13);

          //주민번호 유효성 검사
          if (!fmt.test(jumins3)) {
              alert("주민등록번호 형식에 맞게 입력해주세요");
              $("#jumin1").val("");
              $("#jumin2").val("");
              $("#jumin1").focus();
              $('#usejm').prop("checked", false);
              return false

          }


          //주민번호 존재 검사
          for (var i = 0; i < buf.length; i++) {
              buf[i] = parseInt(jumins3.charAt(i));
          }
          var multipliers = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];// 밑에 더해주는 12자리 숫자들
          var sum = 0;

          for (var i = 0; i < 12; i++) {
              sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서
          }
          if ((11 - (sum % 11)) % 10 != buf[12]) {
              alert("잘못된 주민등록번호 입니다.");
              $("#jumin1").val("");
              $("#jumin2").val("");
              $("#jumin1").focus();
              $('#usejm').prop("checked", false);
              return false;

          }

          var birthYear = (jumins3.charAt(6) <= "2") ? "19" : "20";
          birthYear += $("#jumin1").val().substr(0, 2);
          var birthMonth = $("#jumin1").val().substr(2, 2);
          var birthDate = $("#jumin1").val().substr(4, 2);
          var birth = new Date(birthYear, birthMonth, birthDate);


          $("#years").val(birthYear);
          $("#months").val(birthMonth);
          $("#dates").val(birthDate);



      }
  function checkName() { // 이름 유효성 검사 구문
          var nameExp = /^[가-힣]{2,4}$/;
          var name = document.getElementById("name2");

      if(nameExp.test(name.value) === false){
          alert("이름형식이 맞지 않습니다.");
          $("#name2").val("");
          $("#name2").focus();
          $('#usejm').prop("checked", false);
          return false;
      }
  }


    </script>

</div><!-- main -->
<!-- main -->