$('#mb_login_btn').on('click',function (){
    location.href = '/login/login';
});

$('.mb_cancel_btn').on('click',function (){
    if (confirm('정말로 이 상품을 장바구니에서 삭제하겠습니까?')) {
        let mbnotemp = $('#mb_product_mbno').innerText
        location.href = '/mybasket/delete'
        $.ajax({
            url: '/mybasket/delete',
            type: 'POST',
            data: { mbno : mbnotemp }
        })
        alert(mbnotemp);
        alert('장바구니에서 해당 상품이 삭제되었습니다.');
        location.href = '/mybasket/list';
    }
});

$('#going_shopping').on('click',function (){
    location.href = '/eshop/list?bigGenre=coffe&cp=1';
});