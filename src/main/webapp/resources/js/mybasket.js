$(document).ready(function(){
    $("input:checkbox[id='total_list_select_check']").each(function() {
        $("#all_product_remove_li").css('display', 'inline');
        $("#small_move_mb_center").css('margin-left' , '213px');
        this.checked = true;
    });
    $("input:checkbox[name='mb_product_cb']").each(function() {
        this.checked = true;
    });
    let x = document.getElementById('#mb_product_arrival_date');
    let today = new Date();
    let month = today.getMonth() + 1;  // 월
    let date = today.getDate()+ 1;  // 날짜
    let day = today.getDay()+ 1;  // 요일
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
            $("input:checkbox[name='mb_product_cb']").each(function() {
                this.checked = true;
            });
            $("#all_product_remove_li").css('display', 'inline');
            $("#small_move_mb_center").css('margin-left' , '213px');
            changecart(x)

        }else{
            $("input:checkbox[name='mb_product_cb']").each(function() {
                this.checked = false;
            });
            $("#all_product_remove_li").css('display', 'none');
            $("#small_move_mb_center").css('margin-left' , '295px');
            changecart(x)
        }
    });
});

let mbnum = document.getElementById('mbnum_result').innerText;

let checked = new Array(mbnum);
let product_temp = 0;
let shipPay_temp = 0;
let product_static_temp = 0;
let shipPay_static_temp = 0;
let total_price_temp = 0;

// checked 초기화
for (let v = 0; v <4-1; v++){
    checked[v] = false;
}

$("#mb_product_cb" + 1).change(function() { changecart(1) } );
$("#mb_product_cb" + 2).change(function() { changecart(2) } );
$("#mb_product_cb" + 3).change(function() { changecart(3) } );
$("#mb_product_cb" + 4).change(function() { changecart(4) } );

function changecart(x) {

    if ($(this).is(":checked")) {  // 체크되면 체크 항목의 가격 배송비를 전체 금액에 합산
        product_static_temp = 0;
        shipPay_static_temp = 0;
        total_price_temp = 0;
        if ($('#mb_product_cb1').is(":checked")){
            product_temp = parseInt($('#mb_product_info_price1').text());
            product_static_temp = product_static_temp + product_temp;

            shipPay_temp = parseInt($('#mb_product_info_shipPay1').text());
            shipPay_static_temp = shipPay_static_temp + shipPay_temp;

            total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;

        }
        if ($('#mb_product_cb2').is(":checked")){
            product_temp = parseInt($('#mb_product_info_price2').text());
            product_static_temp = product_static_temp + product_temp;

            shipPay_temp = parseInt($('#mb_product_info_shipPay2').text());
            shipPay_static_temp = shipPay_static_temp + shipPay_temp;

            total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
        }
        if ($('#mb_product_cb3').is(":checked")){
            product_temp = parseInt($('#mb_product_info_price3').text());
            product_static_temp = product_static_temp + product_temp;

            shipPay_temp = parseInt($('#mb_product_info_shipPay3').text());
            shipPay_static_temp = shipPay_static_temp + shipPay_temp;

            total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
        }
        if ($('#mb_product_cb4').is(":checked")){
            product_temp = parseInt($('#mb_product_info_price4').text());
            product_static_temp = product_static_temp + product_temp;

            shipPay_temp = parseInt($('#mb_product_info_shipPay4').text());
            shipPay_static_temp = shipPay_static_temp + shipPay_temp;

            total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
        }
            // 스택 총 값에 해당 스택 상품값과 스택 배송비 추가 하는 로직
            // 그 값을 웹에 보내는 로직

    } else {    // 체크가 해제되면 체크 항목의 가격 배송비를 전체 금액에서 빼기
        product_static_temp = 0;
        shipPay_static_temp = 0;
        total_price_temp = 0;
        if ($('#mb_product_cb1').is(":checked")){
            product_temp = parseInt($('#mb_product_info_price1').text());
            product_static_temp = product_static_temp + product_temp;

            shipPay_temp = parseInt($('#mb_product_info_shipPay1').text());
            shipPay_static_temp = shipPay_static_temp + shipPay_temp;

            total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;

        }
        if ($('#mb_product_cb2').is(":checked")){
            product_temp = parseInt($('#mb_product_info_price2').text());
            product_static_temp = product_static_temp + product_temp;

            shipPay_temp = parseInt($('#mb_product_info_shipPay2').text());
            shipPay_static_temp = shipPay_static_temp + shipPay_temp;

            total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
        }
        if ($('#mb_product_cb3').is(":checked")){
            product_temp = parseInt($('#mb_product_info_price3').text());
            product_static_temp = product_static_temp + product_temp;

            shipPay_temp = parseInt($('#mb_product_info_shipPay3').text());
            shipPay_static_temp = shipPay_static_temp + shipPay_temp;

            total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
        }
        if ($('#mb_product_cb4').is(":checked")){
            product_temp = parseInt($('#mb_product_info_price4').text());
            product_static_temp = product_static_temp + product_temp;

            shipPay_temp = parseInt($('#mb_product_info_shipPay4').text());
            shipPay_static_temp = shipPay_static_temp + shipPay_temp;

            total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
        }
            // 스택 총 값에 해당 스택 상품값과 스택 배송비 뺴는 로직

    }
    $("#total_mb_product_price").text(product_static_temp);
    $("#total_mb_shipPay_price").text(shipPay_static_temp);
    $("#total_mb_order_price").text(product_static_temp + shipPay_static_temp);
}

$('#mb_login_btn').on('click',function (){
    location.href = '/login/login';
});

$("#all_product_remove_btn").on('click', function () {
    if (confirm('정말 모든 상품을 장바구니에서 삭제하겠습니까?')) {

        for (let i = 1; i <= mbnum; i++) {
            let mbnotemp = document.getElementById('mb_product_mbno'+i).innerText
            location.href = '/mybasket/delete'
            $.ajax({
                url: '/mybasket/delete',
                type: 'POST',
                data: {mbno: mbnotemp}
            })
        }
        location.href = '/mybasket/list';
}
});


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

for (let k = 1; k <= mbnum; k++) {
    $("#mb_item_amount"+k).change(function() {
        let mbnotemp = document.getElementById('mb_product_mbno'+k).innerText
        let mbamounttemp = $(this).val();
        $.ajax({
            url: '/mybasket/update',
            type: 'POST',
            data: {mbno: mbnotemp, mbamount: mbamounttemp}
        })
        location.href = '/mybasket/list'
    });
}

$('#going_shopping').on('click',function (){
    location.href = '/eshop/list?bigGenre=coffe&cp=1';
});

// checked 된것만 구매페이지로 던지기




// 구매후에 해당 상품들 장바구니에서 삭제