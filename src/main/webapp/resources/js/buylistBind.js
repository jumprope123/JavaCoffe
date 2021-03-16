$('#buyPageUsePointsBind').on('input',function () {
    var point = parseInt($('#buyPagePointsBind').val());
    var usePoint = parseInt($('#buyPageUsePointsBind').val());
    var resultPoint = parseInt($('#buyPageUsePointsBind').val());;
    var beforeFinalPrice = parseInt($('#beforeFinalPriceBind').val());

    if (isNaN(usePoint)) {
        alert('잘못 입력하셨습니다');
        resultPoint = 0;
    }
    if (usePoint < 0) {
        alert('음수는 입력할 수 없습니다.');
        resultPoint = 0;
    }

    if (usePoint > point) {
        alert('사용포인트는 보유포인트를 초과할 수 없습니다.');
        resultPoint = 0;
    }

    if (beforeFinalPrice - resultPoint < 0){
        alert('총 결재금액은 음수가 될 수 없습니다.');
        resultPoint = 0;
    }

    $('#buyPageUsePointsBind').val(resultPoint);
    $('#finalUsingPointBind').text(resultPoint)
    $('#finalPriceBind').text(beforeFinalPrice - resultPoint);
    $('#afterFinalPriceBind').val(beforeFinalPrice - resultPoint);
})


$('#buylistBindcancelBtn').on('click',function () {
    if (confirm('정말 취소하시겠습니까?')){
        history.back();
    }
})

$('#buylistBindOkBtn').on('click',function () {
    $('#buyPageBindForm').attr('method','post');
    $('#buyPageBindForm').attr('action','/buylist/buyBindProcess');
    $('#buyPageBindForm').submit();
})

var forPlusPoint = $('#forPlusPointBind').text();
$('#plusPointBind').val(forPlusPoint);