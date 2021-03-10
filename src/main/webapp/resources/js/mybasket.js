$('#mb_login_btn').on('click',function (){
    location.href = '/login/login';
});

$('.mb_cancel_btn').on('click',function (){
    if (confirm('정말로 이 상품을 장바구니에서 삭제하겠습니까?')) {
        location.href = '/mybasket/delete'
        $.ajax({
            url: '/mybasket/delete',
            type: 'POST',
            data: {mbno: $('#mbno').val()}
        })
    }
});

$('#going_shopping').on('click',function (){
    location.href = '/eshop/list?bigGenre=coffe&cp=1';
});