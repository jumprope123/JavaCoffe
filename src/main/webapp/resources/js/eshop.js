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