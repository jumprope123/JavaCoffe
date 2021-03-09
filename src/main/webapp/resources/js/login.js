$('#Login_Btn').on('click',function (){
    $('#Login_Btn').attr('action', '/index'); //
    $('#Login_Btn').attr('method', 'post');
    $('#Login_Btn').submit();
    location.href = '/index';
});