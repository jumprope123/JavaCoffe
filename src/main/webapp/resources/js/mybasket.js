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
        case 0: getday = "일"; break;
        case 1: getday = "월"; break;
        case 2: getday = "화"; break;
        case 3: getday = "수"; break;
        case 4: getday = "목"; break;
        case 5: getday = "금"; break;
        case 6: getday = "토"; break;
    }
    $(".mb_product_arrival_date").text("내일"+ "(" + getday+ ") " + month + "/" + date + " 도착 예정");

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

let mbnum = parseInt(document.getElementById('mbnum_result').innerText);

let product_temp = 0;
let shipPay_temp = 0;
let product_static_temp = 0;
let shipPay_static_temp = 0;
let total_price_temp = 0;

// checked 초기화
for (let v_idx = 1; v_idx <= mbnum; v_idx++){
    let mb_index = "#mb_product_cb" + v_idx;
    $(mb_index).change(function() { changecart(v_idx) } );
}
//
// $("#mb_product_cb" + 1).change(function() { changecart(1) } );
// $("#mb_product_cb" + 2).change(function() { changecart(2) } );
// $("#mb_product_cb" + 3).change(function() { changecart(3) } );
// $("#mb_product_cb" + 4).change(function() { changecart(4) } );

function changecart(x) {

    if ($(this).is(":checked")) {  // 체크되면 체크 항목의 가격 배송비를 전체 금액에 합산
        product_static_temp = 0;
        shipPay_static_temp = 0;
        total_price_temp = 0;
        for (let vv_idx = 1; vv_idx <= mbnum; vv_idx++) {
            let ttt = "#mb_product_cb" + vv_idx;
            let ppp = "#mb_product_info_price" + vv_idx;
            let sss = "#mb_product_info_shipPay" + vv_idx;
            if ($(ttt).is(":checked")) {
                product_temp = parseInt($(ppp).text());
                product_static_temp = product_static_temp + product_temp;

                shipPay_temp = parseInt($(sss).text());
                shipPay_static_temp = shipPay_static_temp + shipPay_temp;

                total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            }
        }
    }
    else {
        product_static_temp = 0;
        shipPay_static_temp = 0;
        total_price_temp = 0;
        for (let vv_idx = 1; vv_idx <= mbnum; vv_idx++) {
            let ttte = "#mb_product_cb" + vv_idx;
            let pppe = "#mb_product_info_price" + vv_idx;
            let ssse = "#mb_product_info_shipPay" + vv_idx;
            if ($(ttte).is(":checked")) {
                product_temp = parseInt($(pppe).text());
                product_static_temp = product_static_temp + product_temp;

                shipPay_temp = parseInt($(ssse).text());
                shipPay_static_temp = shipPay_static_temp + shipPay_temp;

                total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            }
        }
    }
                    //     if ($('#mb_product_cb1').is(":checked")){
                    //         product_temp = parseInt($('#mb_product_info_price1').text());
                    //         product_static_temp = product_static_temp + product_temp;
                    //
                    //         shipPay_temp = parseInt($('#mb_product_info_shipPay1').text());
                    //         shipPay_static_temp = shipPay_static_temp + shipPay_temp;
                    //
                    //         total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
                    //
                    //     }
            //
            //     }
            // }
            //    if ($('#mb_product_cb1').is(":checked")){
            //     product_temp = parseInt($('#mb_product_info_price1').text());
            //     product_static_temp = product_static_temp + product_temp;
            //
            //     shipPay_temp = parseInt($('#mb_product_info_shipPay1').text());
            //     shipPay_static_temp = shipPay_static_temp + shipPay_temp;
            //
            //     total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            //
            // }
            // if ($('#mb_product_cb2').is(":checked")){
            //     product_temp = parseInt($('#mb_product_info_price2').text());
            //     product_static_temp = product_static_temp + product_temp;
            //
            //     shipPay_temp = parseInt($('#mb_product_info_shipPay2').text());
            //     shipPay_static_temp = shipPay_static_temp + shipPay_temp;
            //
            //     total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            // }
            // if ($('#mb_product_cb3').is(":checked")){
            //     product_temp = parseInt($('#mb_product_info_price3').text());
            //     product_static_temp = product_static_temp + product_temp;
            //
            //     shipPay_temp = parseInt($('#mb_product_info_shipPay3').text());
            //     shipPay_static_temp = shipPay_static_temp + shipPay_temp;
            //
            //     total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            // }
            // if ($('#mb_product_cb4').is(":checked")){
            //     product_temp = parseInt($('#mb_product_info_price4').text());
            //     product_static_temp = product_static_temp + product_temp;
            //
            //     shipPay_temp = parseInt($('#mb_product_info_shipPay4').text());
            //     shipPay_static_temp = shipPay_static_temp + shipPay_temp;
            //
            //     total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            // }
            // 스택 총 값에 해당 스택 상품값과 스택 배송비 추가 하는 로직
            // 그 값을 웹에 보내는 로직

            // } else {    // 체크가 해제되면 체크 항목의 가격 배송비를 전체 금액에서 빼기
            //     product_static_temp = 0;
            //     shipPay_static_temp = 0;
            //     total_price_temp = 0;
            //     if ($('#mb_product_cb1').is(":checked")){
            //         product_temp = parseInt($('#mb_product_info_price1').text());
            //         product_static_temp = product_static_temp + product_temp;
            //
            //         shipPay_temp = parseInt($('#mb_product_info_shipPay1').text());
            //         shipPay_static_temp = shipPay_static_temp + shipPay_temp;
            //
            //         total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            //
            //     }
            //     if ($('#mb_product_cb2').is(":checked")){
            //         product_temp = parseInt($('#mb_product_info_price2').text());
            //         product_static_temp = product_static_temp + product_temp;
            //
            //         shipPay_temp = parseInt($('#mb_product_info_shipPay2').text());
            //         shipPay_static_temp = shipPay_static_temp + shipPay_temp;
            //
            //         total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            //     }
            //     if ($('#mb_product_cb3').is(":checked")){
            //         product_temp = parseInt($('#mb_product_info_price3').text());
            //         product_static_temp = product_static_temp + product_temp;
            //
            //         shipPay_temp = parseInt($('#mb_product_info_shipPay3').text());
            //         shipPay_static_temp = shipPay_static_temp + shipPay_temp;
            //
            //         total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            //     }
            //     if ($('#mb_product_cb4').is(":checked")){
            //         product_temp = parseInt($('#mb_product_info_price4').text());
            //         product_static_temp = product_static_temp + product_temp;
            //
            //         shipPay_temp = parseInt($('#mb_product_info_shipPay4').text());
            //         shipPay_static_temp = shipPay_static_temp + shipPay_temp;
            //
            //         total_price_temp = total_price_temp + shipPay_static_temp + product_static_temp;
            //     }
            // 스택 총 값에 해당 스택 상품값과 스택 배송비 뺴는 로직
        // }
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
};

for (let k = 1; k <= mbnum; k++) {//추가
    let mbnotemp = document.getElementById('mb_product_mbno'+k).innerText
    let mbamounttemp =  $("#mb_item_amount"+k).val();
    $("#purchase_mb"+k).val(mbamounttemp);
};

$('#going_shopping').on('click',function (){
    location.href = '/eshop/list?bigGenre=coffe&cp=1';
});

// checked 된것만 구매페이지로 던지기
$('#going_buying').on('click',function (){
    // let mbnototal = ""
    // let totalproductprice_buyshop = $('#total_mb_product_price').text();
    // let totalshipPay_buyshop = $('#total_mb_shipPay_price').text();
    // let totalprice_buyshop = $('#total_mb_order_price').text();

    for (let vv_idx = 1; vv_idx <= mbnum; vv_idx++){
        let mb_indexx = "#mb_product_cb" + vv_idx;
        if ($(mb_indexx).is(":checked")) {
            // let mbnotempp = document.getElementById('mb_product_mbno'+vv_idx).innerText
            // mbnototal = mbnototal + mbnotempp + ",";
            $('#eno_mb'+vv_idx).attr("disabled",false)
            $('#fnames_mb'+vv_idx).attr("disabled",false)
            $('#brand_mb'+vv_idx).attr("disabled",false)
            $('#title_mb'+vv_idx).attr("disabled",false)
            $('#shipPay_mb'+vv_idx).attr("disabled",false)
            $('#purchase_mb'+vv_idx).attr("disabled",false)
            $('#discount_mb'+vv_idx).attr("disabled",false)
            $('#dcPrice_mb'+vv_idx).attr("disabled",false)
            $('#ogPrice_mb'+vv_idx).attr("disabled",false)
        }
    }
    // mbnototal = mbnototal.slice(0,-1);
    // $.ajax({
    //     url: '/buylist/mb_buyPage',
    //     type: 'POST',
    //     data: {
    //         mbno: mbnototal ,
    //         totalprice: totalprice_buyshop,
    //         allproductprice: totalproductprice_buyshop,
    //         allshipPay: totalshipPay_buyshop
    //     }
    // })
    // location.href = '/buylist/mb_buyPage'


    $('#going_buying_form').attr('method','POST');
    $('#going_buying_form').attr('action','/buylist/mb_buyPage'); //나중에 /buylist/buyPageBind로 변경하세요
    $('#going_buying_form').submit();
});


// 구매후에 해당 상품들 장바구니에서 삭제