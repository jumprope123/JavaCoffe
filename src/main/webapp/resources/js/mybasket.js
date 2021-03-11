$(document).ready(function(){
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
            alert("전체 상품을 체크했습니다");
            $("input:checkbox[name='mb_product_cb']").each(function() {
                this.checked = true;
            });
            $("#all_product_remove_li").css('display', 'inline');
            $("#small_move_mb_center").css('margin-left' , '213px');
        }else{
            alert("체크 해제되었습니다!");
            $("input:checkbox[name='mb_product_cb']").each(function() {
                this.checked = false;
            });
            $("#all_product_remove_li").css('display', 'none');
            $("#small_move_mb_center").css('margin-left' , '295px');
        }
    });


});

let mbnum = document.getElementById('mbnum_result').innerText;
//
// let checked = new Array(mbnum);
// let product_temp = 0;
// let shipPay_temp = 0;
// let product_static_temp = 0;
// let shipPay_static_temp = 0;
// let total_price_temp = 0;
//
// // checked 초기화
// for (let v = 0; v <mbnum-1; v++){
//     checked[v] = false;
// }
//
// for (let j = 1; j <= mbnum; j++) {
//     product_temp = document.getElementById('mb_product_info_price'+j).innerText;
//     shipPay_temp = document.getElementById('mb_product_info_shipPay'+j).innerText;
//
//     $("#mb_product_cb" + j).change(function () {
//         if ($("#mb_product_cb"+j).is(":checked")) {
//
//             if (checked[j-1] == false) {
//                 product_static_temp += parseInt(product_temp);
//                 shipPay_static_temp += parseInt(shipPay_temp);
//                 total_price_temp = parseInt(product_static_temp) + parseInt(shipPay_static_temp);
//                 // 스택 총 값에 해당 스택 상품값과 스택 배송비 추가 하는 로직
//                 // 그 값을 웹에 보내는 로직
//             }
//             checked[j - 1] = true;
//         }
//         if (!$("#mb_product_cb"+j).is(":checked")){
//             if (checked[j-1]==true){
//                 product_static_temp -= parseInt(product_temp);
//                 shipPay_static_temp -= parseInt(shipPay_temp);
//                 total_price_temp = parseInt(product_static_temp) + parseInt(shipPay_static_temp);
//                 // 스택 총 값에 해당 스택 상품값과 스택 배송비 뺴는 로직
//             }
//             checked[j-1]==false;
//         }
//         $("#total_mb_product_price").text(product_static_temp);
//         $("#total_mb_shipPay_price").text(shipPay_static_temp);
//         $("#total_mb_order_price").text(total_price_temp);
//     });
// }

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