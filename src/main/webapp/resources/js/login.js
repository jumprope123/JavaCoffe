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

$('#s_hloginbtn').on('click',function (){
    $('#s_hloginbtn').attr('action', '/index'); //
    $('#s_hloginbtn').attr('method', 'post');
    $('#s_hloginbtn').submit();
    location.href = '/index';
});

