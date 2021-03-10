$(document).ready(function(){
    let x = document.getElementById('#mb_product_arrival_date');
    let today = new Date();
    let month = today.getMonth() + 1;  // 월
    let date = today.getDate()+1;  // 날짜
    let day = today.getDay()+1;  // 요일
    let getday = "";
    switch (day%7){
        case 1: getday = "월요일"; break;
        case 2: getday = "화요일"; break;
        case 3: getday = "수요일"; break;
        case 4: getday = "목요일"; break;
        case 5: getday = "금요일"; break;
        case 6: getday = "토요일"; break;
        case 7: getday = "일요일"; break;
    }
    $(".mb_product_arrival_date").text(getday+ " " + month + "/" + date + " 도착 예정");

    $("#total_list_select_check").change(function(){
        if($("#total_list_select_check").is(":checked")) {
            alert("전체 상품을 체크했습니다");
            $("input:checkbox[name='mb_product_cb']").each(function() {
                this.checked = true;
            });
        }else{
            alert("체크 해제되었습니다!");
            $("input:checkbox[name='mb_product_cb']").each(function() {
                this.checked = false;
            });
        }
    });
});

$('#total_list_select_check')

$('#mb_login_btn').on('click',function (){
    location.href = '/login/login';
});

let mbnum = document.getElementById('mbnum_result').innerText;

for (let i = 1; i <= mbnum; i++) {
    $("#mb_cancel_btn"+i).on('click', function () {
        if (confirm('정말로 이 상품을 장바구니에서 삭제하겠습니까?')) {
            let mbnotemp = document.getElementById('mb_product_mbno'+i).innerText
            location.href = '/mybasket/delete'
            $.ajax({
                url: '/mybasket/delete',
                type: 'POST',
                data: {mbno: mbnotemp}
            })
            alert('장바구니에서 해당 상품이 삭제되었습니다.');
            location.href = '/mybasket/list';
        }
    });
}

$('#going_shopping').on('click',function (){
    location.href = '/eshop/list?bigGenre=coffe&cp=1';
});