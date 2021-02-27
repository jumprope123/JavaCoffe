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
        $('#smallGenre').append("<option value='can'>캔</option>");
        $('#smallGenre').append("<option value='pet'>페트</option>");
        $('#smallGenre').append("<option value='bottle'>병</option>");
    } else if ($('#bigGenre option:selected').val() == 'disposable'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='papercup'>종이컵</option>");
        $('#smallGenre').append("<option value='disposable'>일회용품</option>");
    } else if ($('#bigGenre option:selected').val() == 'food1'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='ricefry'>볶음밥</option>");
        $('#smallGenre').append("<option value='dimsum'>만두</option>");
        $('#smallGenre').append("<option value='hotbar'>핫바</option>");
    } else if ($('#bigGenre option:selected').val() == 'food2'){
        $('#smallGenre').find('option').remove();
        $('#smallGenre').append("<option value='porkcutlet'>돈까스</option>");
        $('#smallGenre').append("<option value='friedpotato'>감자튀김</option>");
        $('#smallGenre').append("<option value='fishcake'>어묵</option>");
    }
});