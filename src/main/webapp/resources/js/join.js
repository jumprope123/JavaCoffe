
// jquery로 이벤트 추가하기 : $('대상').on('이벤트종류', function() {} );
// agree
$('#okagree').on('click', function() {
    if (!$('#agree1').is(':checked'))   // 만약에 !는 not checked 체크표시확인
        alert('이용약관에 동의하세요');
    else if(!$('#agree2').is(':checked'))
        alert('개인정보 활용에 동의하세요');
    else
        location.href = '/join/checkme';
});

// 동의함
$('#noagree').on('click', function() {
    if (confirm('정말 취소하시겠습니까?')) {
        alert('메인페이지로 이동합니다')
     location.href = '/index'
    }
    }); // 컨펌창을 통해서 확인하면 메인페이지로 가는 안내문구와 메인페이지로 이동\

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
        //location.href = '/join/joinme?name=' + $('#name2').val()
        //    + '&jumin1=' + $('#jumin1').val()
        //    + '&jumin2=' + $('#jumin2').val();\\
        $('#chkfrm').submit();

    }
});

// 실명 확인 취소하기
$('#cancle2btn').on('click',function (){
    if (confirm('정말 취소하시겠습니까?'))
        alert('메인페이지로 이동합니다')
        location.href = '/index';
});

//joinme
//회원가입하기
$('#joinbtn').on('click',function () {
    if ($('#newid').val() == '') {
        alert('아이디를 입력해주세요');
    }else if ($('#name').val() == '') {
        alert('이름을 입력해주세요'); // <<<< 이건 만약에 바로 joinme 사이트로 들어가서 공백인 상태로 넘어감을 방지하기위해
    }else if ($('#jumin1').val() == '' || ($('#jumin2').val() == '')){
        alert('주민등록번호를 입력해주세요');  // <<<< 이것도 마찬가지 joinme 사이트로 들어가서 공백인 상태로 넘어감을 방지하기위해
    }else if ($('#newpwd').val() == ''){
        alert('비밀번호를 입력해주세요');
    }else if ($('#repwd').val() == ''){
        alert('비밀번호 확인란을 입력해주세요');
    }else if ($('#newpwd').val() != $('#repwd').val()){
        alert('비밀번호가 일치하지 않습니다.');
    }else if ($('#sample6_postcode').val() == ''||$('#sample6_address').val() == ''||$('#sample6_detailAddress').val() == ''){
        alert('우편번호를 검색해주세요');
    }else if ($('#email1').val() == ''||$('#email2').val() == ''){
        alert('이메일주소를 입력해주세요');
    }else if ($('#hp2').val() == '' || $('#hp3').val() == '') {
        alert('전화번호를 입력해주세요');
    }else if ($('#hp1').val() == '선택'){
        alert('국번을 선택해주세요');
    }else if (grecaptcha.getResponse() == "") { //grecaptcha는 헤드에있는 자바스크립트 내에 작성된 코드임
        alert("자동가입 방지 확인 필요!");
    }else {


        // 분리된 데이터 합치기
        $('#jumin').val($('#jumin1').val() + '-' + $('#jumin2').val());
        $('#zipcode').val($('#sample6_postcode').val() + $('#sample6_address').val() + $('#sample6_detailAddress').val() + $('#sample6_extraAddress').val() );
        $('#email').val($('#email1').val() + '@' + $('#email2').val());
        $('#phone').val($('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val());

        // 클라이언트에서 생성한 코드를 서버에서도 확인하기 위한 목적
        $('#g-recaptcha').val(grecaptcha.getResponse());

        $('#joinfrm').attr('action', '/join/joinme'); //
        $('#joinfrm').attr('method', 'post');
        $('#joinfrm').submit();
    }
});

//회원가입 취소하기
$('#cancelbtn').on('click',function () {
    if (confirm('정말 취소하시겠습니까?'))
        location.href = '/index';
})



// 이메일 처리
//option:selected => select 요소들 중 선택한 객체를 알아냄
// 선택한 객체.text() : 태그 사이의 joinbtn문자
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
function checkuid() {  // 아이디 중복체크 버튼 생성
    let uid = $('#newid').val().trim();
    if (uid == '') {
        return;
    }

    $.ajax({
        url: '/join/checkuid',
        type: 'GET',
        data: {uid: $('#newid').val()}
    })  // 비동기 요청 설정

        .done(function (data) {
            if (data.trim() == '0') {
                var msg0 = alert('사용 가능 아이디입니다');
                $('#uidmsg').attr('style', 'color: blue !important');
            } else if (data.trim() == '1'){
                var msg1 = alert('사용 불가 아이디입니다');
            }
            $('#uidmsg').text(msg0);
        }) // 비동기 요청 성공시

        .fail(function (xhr, status, error) {
            alert(xhr.status, +"/" + error);
        });// 비동기 요청 실패시
}

// joinok
$('#go2index').on('click',function () {
    location.href = '/index';
})
//



