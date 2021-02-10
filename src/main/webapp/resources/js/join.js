
// jquery로 이벤트 추가하기 : $('대상').on('이벤트종류', function() {} );
// agree
$('#agreebtn').on('click',function () {
    if (!$('#agree1').is(':checked')){
        alert('이용약관에 동의하세요!');
    }else if (!$('#agree2').is(':checked')){
        alert('개인정보약관에 동의하세요!');
    }else {
        location.href = '/join/checkme';
    }
});

// 동의함
$('#disagreebtn').on('click',function () {location.href = '/index';}); //동의하지 않음


//checkme

// 실명 확인 하기
$('#check2btn').on('click',function (){
    if ($('#name2').val() == ''){
        alert('이름을 입력하세요');
    }else if ($('#jumin1').val() == ''){
        alert('주민등록번호를 입력하세요');
    }else if ($('#jumin2').val() == ''){
        alert('주민등록번호 뒷자리를 입력하세요');
    }else if (!$('#usejm').is(':checked')){
        alert('주민등록번호 처리에 동의해주세요')
    }else {
        location.href = '/join/joinme?name=' + $('#name2').val() +
            '&jumin1=' + $('#jumin1').val() +
            '&jumin2=' + $('#jumin2').val();
        //결과 : /join/joinme?name=이름&jumin=주민번호
    }
});

// 실명 확인 취소하기
$('#cancel2btn').on('click',function (){
    if (confirm('정말 취소하시겠습니까?'))
        location.href = '/index';
});


//joinme

//회원가입하기
$('#joinbtn').on('click',function () {
    if ($('#newuid').val() == ''){
        alert('아이디를 입력해주세요');
    }else if ($('#newpwd').val() == ''){
        alert('비밀번호를 입력해주세요');
    }else if ($('#repwd').val() == ''){
        alert('비밀번호 확인란을 입력해주세요');
    }else if ($('#newpwd').val() != $('#repwd').val()){
        alert('비밀번호가 일치하지 않습니다.');
    }else if ($('#zip1').val() == ''||$('#zip2').val() == ''||$('#add1').val() == ''){
        alert('우편번호를 검색해주세요');
    }else if ($('#add2').val() == ''){
        alert('나머지 주소를 입력해주세요');
    }else if ($('#email1').val() == ''||$('#email2').val() == ''){
        alert('이메일주소를 입력해주세요');
    }else if ($('#hp2').val() == '' || $('#hp3').val() == ''){
        alert('전화번호를 입력해주세요');
    }else if (grecaptcha.getResponse() == ""){ //grecaptcha는 헤드에있는 자바스크립트 내에 작성된 코드임
        alert("자동가입 방지 확인 필요!");
    }else {
        // recaptcha 코드 유효성 검사를 위한 변수값 설정
        // alert(grecaptcha.getResponse());
        // 구글 recaptcha 코드 확인

        // 분리된 데이터 합치기
        $('#jumin').val($('#jumin1').val() + '-' + $('#jumin2').val());
        $('#zipcode').val($('#zip1').val() + '-' + $('#zip2').val());
        $('#email').val($('#email1').val() + '@' + $('#email2').val());
        $('#phone').val($('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val());

        // 클라이언트에서 생성한 코드를 서버에서도 확인하기 위한 목적
        $('#g-recaptcha').val(grecaptcha.getResponse());

        $('#joinfrm').attr('action', '/join/joinme');
        $('#joinfrm').attr('method', 'post');
        $('#joinfrm').submit();
    }
})

//회원가입 취소하기
$('#cancelbtn').on('click',function () {
    if (confirm('정말 취소하시겠습니까?'))
        location.href = '/index';
})


// 우편번호 처리
$('#findbtn').on('click',function () {
  $.ajax({
      url: '/join/zipcode',
      type: 'GET',
      data: {dong: $('#dong').val()}
  })
      .done(function (data){
          // 서버로 넘어온 데이터는 JSON형식이므로
          // 출력시 Object로 보여짐
          let opts = "";
          $.each(data, function () { // 행단위 반복처리
              let zip = "";
              $.each(this, function (k,v) { // 열단위 반복처리
                  if (v !== null) {
                      zip += v + " ";
                  }
              })
              opts += '<option>' + zip + '</option>';
          })
          //기존 option태그 제거
          $('#addrlist').find("option").remove();
          //새로만든 option태그 추가
          $('#addrlist').append(opts);
      })
      .fail(function (xhr,status,error) {
          alert(xhr,status, + "/" + error);
      });
});

//우편번호 보내기
$('#sendbtn').on('click', function () {
    let addr = $('#addrlist option:selected').val();

    if (addr == undefined) {
        alert('주소를 선택하세요');
        return;
    } // 주소를 선택하지 않고 버튼을 클릭하는 경우

    let addrs = addr.split(' '); //선택한 주소를 공백으로 나눔
    // 분리된 주소를 지정한 위치로 보냄
    // 우편번호는 '-'로 분리해서 zip1, zip2 에 보냄
    $('#zip1').val(addrs[0].split('-')[0]);
    $('#zip2').val(addrs[0].split('-')[1]);
    // 공백으로 분리한 나머지 주소중 '시,구,동'을 addr1로 보냄
    $('#addr1').val(addrs[1]+" "+addrs[2]+" "+addrs[3]);

    //기존 검색 결과를 제거
    $('#addrlist').find("option").remove();
    $('#dong').val('');

    //우편번호 검색창 닫음
    $('#zipmodal').modal('hide');
})

//우편번호 모달창 x버튼 클릭시 처리
$('#modalx').on('click', function () {
    $('#addrlist').find("option").remove();
    $('#dong').val('');
    $('#zipmodal').modal('hide');
});

// 이메일 처리
//option:selected => select 요소들 중 선택한 객체를 알아냄
// 선택한 객체.text() : 태그 사이의 문자
// 선택한 객체.val() : 태그의 val속성 값
$('#email3').on('change',function () {
    let val = $('#email3 option:selected').text();
    if (val == '직접 입력하기'){
        $('#email2').attr('readonly', false);
        $('#email2').val('');
    }else {
        $('#email2').attr('readonly', true);
        $('#email2').val(val);
    }
});

// 아이디 중복체크
$('#newuid').on('blur',function () {checkuid();})
$('#newuid').on('focus',function () {
    $('#uidmsg').text('6~16 자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.');
    $('#uidmsg').attr('style', 'color:red !important');
});

function checkuid(){
    let uid = $('#newuid').val().trim();
    if (uid == '') {
        $('#uidmsg').text('6~16 자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.')
        return;
    }
    $.ajax({
        url: '/join/checkuid',
        type: 'GET',
        data: { uid: $('#newuid').val() }
        }) // 비동기 요청 설정
        .done(function (data){
            let msg = '사용 불가 아이디입니다.';
            if (data.trim() == 0){
                msg = '사용 가능 아이디입니다.';
                $('#uidmsg').attr('style', 'color:blue !important');
            }
            $('#uidmsg').text(msg);
        }) // 비동기 요청 성공시
        .fail(function (xhr, status, error){
            alert(xhr,status, + "/" + error)
        }); // 비동기 요청 실패시
}

// joinok
$('#go2index').on('click',function () {
    location.href = '/index';
})
