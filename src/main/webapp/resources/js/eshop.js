$('#eshop1btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=coffe&cp=1';
})
$('#eshop2btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=tea&cp=1';
})
$('#eshop3btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=syrup&cp=1';
})
$('#eshop4btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=vending&cp=1';
})
$('#eshop5btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=takeoutcup&cp=1';
})
$('#eshop6btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=drink&cp=1';
})
$('#eshop7btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=disposable&cp=1';
})
$('#eshop8btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=food1&cp=1';
})
$('#eshop9btn').on('click',function () {
    location.href = '/eshop/list?bigGenre=food2&cp=1';
})

$('#showCntChangeForEhsop').on('change',function () {
    var linkForCnt = $('#linkForCnt').val()
    var showCntChangeForEhsop = $('#showCntChangeForEhsop').val();
    location.href = linkForCnt+'&cnt='+showCntChangeForEhsop;

})

function showimgForEshop(eno) {
    location.href = '/eshop/view?eno='+eno;
}

$(document).ready(function () {
    var big = $('#hiddenBigGenre').val();
    var sm = $('#hiddenSmallGenre').val();

    if (big == 'coffe'){
        $('#spanBig').text('원두|커피믹스|스틱');
        switch (sm){
            case 'bean': $('#spanSamll').text('원두'); break;
            case 'coffemix': $('#spanSamll').text('커피믹스'); break;
            default : $('#spanSamll').text('스틱'); break;
        }
    }else if (big == 'tea'){
        $('#spanBig').text('차류[티백/아이스티]');
        switch (sm){
            case 'teabag': $('#spanSamll').text('티백'); break;
            default : $('#spanSamll').text('아이스티'); break;
        }
    }else if (big == 'syrup'){
        $('#spanBig').text('시럽|소스|파우더');
        switch (sm){
            case 'syrub': $('#spanSamll').text('시럽'); break;
            case 'source': $('#spanSamll').text('소스'); break;
            default : $('#spanSamll').text('파우더'); break;
        }
    }else if (big == 'vending'){
        $('#spanBig').text('자판기|제빙기');
        switch (sm){
            case 'vendingmc': $('#spanSamll').text('자판기'); break;
            default : $('#spanSamll').text('제빙기'); break;
        }
    }else if (big == 'takeoutcup'){
        $('#spanBig').text('테이크아웃컵|페트컵');
        switch (sm){
            case 'takeoutcup': $('#spanSamll').text('테이크아웃컵'); break;
            default : $('#spanSamll').text('페트컵'); break;
        }
    }else if (big == 'drink'){
        $('#spanBig').text('음료수[캔/페트/병]');
        switch (sm){
            case 'fatcan': $('#takeoutcup').text('뚱캔'); break;
            case 'slimcan': $('#takeoutcup').text('슬림캔'); break;
            case 'pet': $('#takeoutcup').text('페트'); break;
            default : $('#spanSamll').text('병'); break;
        }
    }else if (big == 'disposable'){
        $('#spanBig').text('종이컵|일회용품');
        switch (sm){
            case 'petcup': $('#spanSamll').text('페트컵'); break;
            case 'papercup': $('#spanSamll').text('종이컵'); break;
            case 'tissue': $('#spanSamll').text('화장지/냅킨류'); break;
            default : $('#spanSamll').text('일회용품'); break;
        }
    }else if (big == 'food1'){
        $('#spanBig').text('볶음밥|만두|핫바');
        switch (sm){
            case 'ricefry': $('#spanSamll').text('볶음밥'); break;
            case 'nuddle': $('#spanSamll').text('면/떡'); break;
            case 'dimsum': $('#spanSamll').text('만두'); break;
            default : $('#spanSamll').text('핫바'); break;
        }
    }else {
        $('#spanBig').text('돈까스|감튀|어묵');
        switch (sm){
            case 'porkcutlet': $('#spanSamll').text('돈까스'); break;
            case 'friedpotato': $('#spanSamll').text('감자튀김'); break;
            default : $('#spanSamll').text('어묵'); break;
        }
    }
})

$('#popUpBoxBtn').on('click',function () {
    $('#popUpBox').attr('style','display:block; position:absolute; z-index:10;');
})

$('#eshopViewXIcon').on('click',function () {
    $('#popUpBox').attr('style','display:none');
})

$('#eshopViewNum').on('change',function () {
    var rawInput = $('#eshopViewNum').val();
    var typeint = parseInt(rawInput); //무조건 숫자형으로 바꿈
    var eshopHiddenStock = parseInt($('#eshopHiddenStock').val()); //재고받아옴
    if (isNaN(typeint)) typeint = 1;
    if (typeint <= 0) typeint = 1;
    $('#eshopViewNum').val(typeint);
    if (typeint>eshopHiddenStock) {
        alert('주문수량은 재고를 초과할 수 없습니다.');
        typeint = 1;
        $('#eshopViewNum').val(typeint);
    }
    var priceForResult = parseInt($('#priceForResult').val());
    var resultPrice = typeint * priceForResult
    $('#eshopResultPrice').text(resultPrice+'원');
    $('#ehsopFinalResultPrice').text(resultPrice);
})

$('#eshopUpBtn').on('click',function () {
    var rawInput = $('#eshopViewNum').val();
    var typeint = parseInt(rawInput); //무조건 숫자형으로 바꿈
    var eshopHiddenStock = parseInt($('#eshopHiddenStock').val()); //재고받아옴
    var newint = typeint + 1;
    $('#eshopViewNum').val(newint);
    if (newint>eshopHiddenStock){
        alert('주문수량은 재고를 초과할 수 없습니다.');
        newint = 1;
        $('#eshopViewNum').val(newint);
    }
    var priceForResult = parseInt($('#priceForResult').val());
    var resultPrice = newint * priceForResult
    $('#eshopResultPrice').text(resultPrice+'원');
    $('#ehsopFinalResultPrice').text(resultPrice);
})

$('#eshopDownBtn').on('click',function () {
    var rawInput = $('#eshopViewNum').val();
    var typeint = parseInt(rawInput); //무조건 숫자형으로 바꿈
    var eshopHiddenStock = parseInt($('#eshopHiddenStock').val()); //재고받아옴
    var newint = typeint - 1;
    if (newint <= 0) newint = 1;
    $('#eshopViewNum').val(newint);
    if (newint>eshopHiddenStock){
        alert('주문수량은 재고를 초과할 수 없습니다.');
        newint = 1;
        $('#eshopViewNum').val(newint);
    }
    var priceForResult = parseInt($('#priceForResult').val());
    var resultPrice = newint * priceForResult
    $('#eshopResultPrice').text(resultPrice+'원');
    $('#ehsopFinalResultPrice').text(resultPrice);
})

$('#eshopCuponBtn').on('click',function () {
    alert('저희가 돈이없어서 ㅠㅠ 쿠폰은 없다구용~');
})


function jumpToImgExplain() {
    location.href ="#eshopExplainImg"
}

function jumpToImgExchange() {
    location.href ="#eshopExchangeImg"
}