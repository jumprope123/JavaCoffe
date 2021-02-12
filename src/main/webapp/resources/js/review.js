$('#reviewWriteOkBtn').on('click',function () {
    if ($('#title').val() == ''){
        alert('제목을 입력하세요');
    }else if($('#contents').val()==''){
        alert('내용을 입력하세요');
    }else if ($('#file1').val()==''){
        alert('사진을 1개이상 첨부해주세요')
    }else if (grecaptcha.gtResponse()==""){
        alert('자동 작성 방지 확인을 클릭해주세요');
    }else {
        $('#g-recaptcha').val(grecaptcha.getResponse());
        $('#reviewfrm').attr('method','post');
        $('#reviewfrm').attr('enctype','multipart/form-data');
        $('#reviewfrm').attr('action','/gallery/write');
        $('#reviewfrm').submit();

    }
})