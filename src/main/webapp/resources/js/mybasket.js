$('#mb_login_btn').on('click',function (){
    location.href = '/login/login';
});

$('.mb_cancel_btn').on('click',function (){
    if (confirm('정말로 이 상품을 장바구니에서 삭제하겠습니까?')) {
        location.href = '/mybasket/delete'
        $.ajax({
            url: '/mybasket/delete',
            type: 'GET',
            data: {mbno: $('#mbno').val(), checkThumb: checkThumb}
        })
    }
});

$('#rmbdbtn').on('click', function () {
    if (confirm('정말로 이 글을 삭제하시겠습니까?')) {
        let param = '?bno=' + $('#bno').val();
        param += "&cp=" + $('#cp').val()
        param += "&userid=" + $('#userid').val();
        location.href = '/board/delete' + param;
    }
})