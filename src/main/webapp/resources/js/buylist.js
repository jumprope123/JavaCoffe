$('#buyPageUsePoints').on('input',function () {
    var point = parseInt($('#buyPagePoints').val());
    var usePoint = parseInt($('#buyPageUsePoints').val());
    var resultPoint = parseInt($('#buyPageUsePoints').val());;
    var beforeFinalPrice = parseInt($('#beforeFinalPrice').val());

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

    $('#buyPageUsePoints').val(resultPoint);
    $('#finalUsingPoint').text(resultPoint)
    $('#finalPrice').text(beforeFinalPrice - resultPoint);
    $('#afterFinalPrice').val(beforeFinalPrice - resultPoint);
})


$('#buylistcancelBtn').on('click',function () {
    if (confirm('정말 취소하시겠습니까?')){
        history.back();
    }
})



$('#buylistOkBtn').on('click',function () {
    $('#buyPageForm').attr('method','post');
    $('#buyPageForm').attr('action','/buylist/buyProcess');
    $('#buyPageForm').submit();
})

var forPlusPoint = $('#forPlusPoint').text();
$('#plusPoint').val(forPlusPoint);