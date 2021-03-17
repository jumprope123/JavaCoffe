$('#bigGenre').on('change',function () {
    if ($('#bigGenre option:selected').val() == 'coffe'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='bean'>원두</option>");
        $('#smallGenre').append("<option value='coffemix'>커피믹스</option>");
        $('#smallGenre').append("<option value='coffestick'>스틱</option>");
    } else if ($('#bigGenre option:selected').val() == 'tea'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='teabag'>티백</option>");
        $('#smallGenre').append("<option value='icetea'>아이스티</option>");
    } else if ($('#bigGenre option:selected').val() == 'syrup'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='syrub'>시럽</option>");
        $('#smallGenre').append("<option value='source'>소스</option>");
        $('#smallGenre').append("<option value='powder'>파우더</option>");
    } else if ($('#bigGenre option:selected').val() == 'vending'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='vendingmc'>자판기</option>");
        $('#smallGenre').append("<option value='icemc'>제빙기</option>");
    } else if ($('#bigGenre option:selected').val() == 'takeoutcup'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='takeoutcup'>테이크아웃컵</option>");
        $('#smallGenre').append("<option value='petcup'>페트컵</option>");
    } else if ($('#bigGenre option:selected').val() == 'drink'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='fatcan'>뚱캔</option>");
        $('#smallGenre').append("<option value='slimcan'>슬림캔</option>");
        $('#smallGenre').append("<option value='pet'>페트</option>");
        $('#smallGenre').append("<option value='bottle'>병</option>");
    } else if ($('#bigGenre option:selected').val() == 'disposable'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='petcup'>페트컵</option>");
        $('#smallGenre').append("<option value='papercup'>종이컵</option>");
        $('#smallGenre').append("<option value='tissue'>화장지/냅킨류</option>");
        $('#smallGenre').append("<option value='disposable'>일회용품</option>");
    } else if ($('#bigGenre option:selected').val() == 'food1'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='ricefry'>볶음밥</option>");
        $('#smallGenre').append("<option value='nuddle'>면/떡</option>");
        $('#smallGenre').append("<option value='dimsum'>만두</option>");
        $('#smallGenre').append("<option value='hotbar'>핫바</option>");
    } else if ($('#bigGenre option:selected').val() == 'food2'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='porkcutlet'>돈까스</option>");
        $('#smallGenre').append("<option value='friedpotato'>감자튀김</option>");
        $('#smallGenre').append("<option value='fishcake'>어묵</option>");
    }
}); //select문 기능구현

$(document).ready(function () {
    $("#img").change(function () {
        var imgname = $(this)[0].files[0].name;
        var imgtype = imgname.substring(imgname.lastIndexOf(".")+1).toLowerCase();
        if (!(imgtype == 'jpg' || imgtype == 'png' || imgtype == 'jpeg' || imgtype == 'bmp' || imgtype == 'gif')){
            alert('확장자가 png, jpeg, bmp, gif 인 이미지파일만 선택가능합니다.');
            $('#img').val('');
            document.getElementById('imgLable').innerText = '업로드할 이미지파일을 선택하세요';
        }else {
            document.getElementById('imgLable').innerText = imgname;
        }
        $('#xbox4').addClass('invisible');//수정페이지를 위한 코드추가
    })
}); // 이미지파일 업로드 기능 구현

$('#inputOK').on('click',function () {
    if ($('#title').val()=='') alert('제품명을 입력하세요');
    else if ($('#brand').val()=='') alert('브랜드명을 입력하세요');
    else if ($('#ogprice').val()=='') alert('할인전 가격으로 노출할 가격을 입력하세요(가짜가격)');
    else if ($('#dcprice').val()=='') alert('실제로 판매하실 가격을 입력하세요(진짜가격)');
    else if ($('#dcprice').val() > $('#ogprice').val()) alert('할인 전 가격이 할인 후 가격보다 클 수 없습니다')
    else if ($('#bigGenre').val()=='') alert('대분류는 비어있을수가 없습니다. 관리자에게 연락하세요');
    else if ($('#smallGenre').val()=='') alert('소분류는 비어있을수가 없습니다. 관리자에게 연락하세요');
    else if ($('#code').val()=='') alert('상품코드를 입력하세요');
    else if ($('#simpleExplain').val()=='') alert('상품 상세설명을 간단하게라도 작성해주세요');
    else if ($('#shippay').val()=='') alert('배송비는 비어있을수가 없습니다. 관리자에게 연락하세요');
    else if ($('#stuck').val()=='') alert('재고는 비어있을수가 없습니다. 재고가 없다면 0을 입력하세요');
    else if ($('#img').val()=='') alert('대표이미지 1개는 필수로 첨부되어야 합니다');
    else {
        $('#Adminfrm').attr('method','post');
        $('#Adminfrm').attr('enctype','multipart/form-data');
        $('#Adminfrm').attr('action','/admin/writeok');
        $('#Adminfrm').submit();
    }
}) // 입력완료 버튼 클릭시 form value값들이 모두 리셋되는거 수정해야함.

$('#cancel').on('click',function () {
    if (confirm('정말 취소하시겠습니까?'))
    history.back();
}) //취소하기 버튼 클릭시

function processMod(buyno) {
    var status = $('#processModify'+buyno).val();
    $('#processVal'+buyno).text(status);
    $.ajax({
        url:'/admin/processModify',
        type: 'GET',
        data: {buyno: buyno, process:status}
    })
    alert(buyno+' 번의 배송상황을 '+status+' 로 수정하였습니다');
}

$('#adminFindBtn').on('click',function () {
    var adminSearchTxt = $('#adminSearchTxt').val()
    location.href = '/admin/find?cp=1&adminSearchTxt='+adminSearchTxt;
})

$('#goToAdminWrite').on('click',function () {
    location.href = '/admin/write';
})

$('#goToAdminHandle').on('click',function () {
    location.href = '/admin/handle';
})

