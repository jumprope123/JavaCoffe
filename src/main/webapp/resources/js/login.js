$('#Login_Btn').on('click',function (){
    $('#Login_Btn').attr('action', '/index'); //
    $('#Login_Btn').attr('method', 'post');
    $('#Login_Btn').submit();
    location.href = '/index';
});

$('#hloginbtn1').on('click',function (){
    location.href = '/login/loginDel';
});

$('#h_mybasket').on('click',function (){
    location.href = '/mybasket/list';
});

$('#h_mymemberinfo').on('click',function (){
    location.href = '/member/memberInfo';
});


$('#s_hloginbtn').on('click',function (){
    $('#s_hloginbtn').attr('action', '/index'); //
    $('#s_hloginbtn').attr('method', 'post');
    $('#s_hloginbtn').submit();
    location.href = '/index';
});


var joinorbind = $('#joinorbind').val();
if (joinorbind == 100){
    alert('회원가입 후 sns연동해주세요.');
}
/*  여기서 부터 카카오  코드*/
function logout() {
    localStorage.clear();
    sessionStorage.clear();
    alert('로그아웃 완료')
}

/* ========================== 여기서 부터 카카오  코드*/
/**/
    window.Kakao.init("9c38cdfacc89f99ac0fe0615bba90cd9")
    console.log(Kakao.isInitialized());

    function kakaoLogin(){
    window.Kakao.Auth.login({
        scope:'profile,account_email,gender',
        success: function(authObj){
            console.log(authObj);
            window.Kakao.API.request({
                url:'/v2/user/me',
                success: res => {
                    const kakao_account = res.kakao_account;
                    console.log(kakao_account);
                }
            });
        }
    })

}

function kakaoLogout() {
    Kakao.Auth.logout(function(response) {
        alert(response + 'logout');
    });
}

$('#hjoinbtn').on('click',function () {
    location.href = "/join/agree"
})