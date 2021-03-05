// list
$('#newbd').on('click',function () {
    let param = "?cp=" + $('#cp').val()
    location.href = '/board/write' + param;
})

$('#bdfindbtn').on('click',function () {
    let param = "?findtype=" + $('#findtype').val();
    param += "&findkey=" + $('#findkey').val();
    location.href = "/board/find" + param + '&cp=1';
})

// view
$('#listbdbtn').on('click', function () {
    // history.back(); // 비추
    // location.href = "/board/list?cp=1";  // 첫 페이지로
    location.href = "/board/list?cp=" + $('#cp').val();
})

// 이전게시물 클릭시
$('#Boardprevbtn').on('click',function () {
    // if($('#bno').val() == $('#bno').val()){
    //     alert('첫번째 게시물입니다');
    // }
    location.href = '/board/prevView?bno=' + $('#bno').val() + "&cp=" + $('#cp').val();
})

//다음게시물 클릭시
$('#Boardnextbtn').on('click',function () {
    location.href = '/board/nextView?bno=' + $('#bno').val() + "&cp=" + $('#cp').val();
})

//추천
$('#thumbbtn').on('click', function () {
    if ($('#thumbBoard').val() == 'no'){
        $('#thumbBoard').val('yes');
        alert('해당 게시글을 추천하였습니다.');
        $('#thumbbtn').html('<i class="bi bi-hand-thumbs-down bidragup"></i>취소하기');
    }else {
        $('#thumbBoard').val('no');
        alert('해당 게시글의 추천을 취소하였습니다.');
        $('#thumbbtn').html('<i class="bi bi-hand-thumbs-up bidragup"></i>추천하기');
    }
    var checkThumb = $('#thumbBoard').val();
    $.ajax({
        url: '/board/thumbUp',
        type: 'GET',
        data: {bno: $('#bno').val(), checkThumb: checkThumb}
    })
        .done(function (data) {
            let thumbs = data["thumbs"];
            $('#thumbs').text(thumbs);
        })
})

//수정
$('#upbdbtn').on('click', function () {
    if (confirm('정말로 이 글을 수정하시겠습니까?')) {
        let param = "?bno=" + $('#bno').val();
        param += "&cp=" + $('#cp').val()
        param += "&userid=" + $('#userid').val();
        location.href = '/board/update' + param;
    }
})

//삭제
$('#rmbdbtn').on('click', function () {
    if (confirm('정말로 이 글을 삭제하시겠습니까?')) {
        let param = '?bno=' + $('#bno').val();
        param += "&cp=" + $('#cp').val()
        param += "&userid=" + $('#userid').val();
        location.href = '/board/delete' + param;
    }
})

//댓글
$('#bdcmtbtn').on('click',function () {
    if ($('#reply').val() == '') alert('댓글을 작성하세요');
    else {
        $('#uid').val('테스트계정');
        $('#replyfrm').attr('method','post');
        $('#replyfrm').attr('action','/board/replyok');
        $('#replyfrm').submit();
    }
})

//대댓글 대화상자 띄우기
function addReply(cno) {
    $('#replyModal').modal('show');
    $('#cno').val(cno); // 대댓글 작성시 부모댓글의 번호를 cno에 저장
}

//댓글 수정하기 창
function modiReplyForBoard(rno,reply){
    $('#modiReplyForBoard').val(reply);
    $('#modifyreplycno').val(rno);
    $('#replyModify').modal('show');
}

//댓글 수정하기
$('#modifyokbtn').on('click',function () {
    if ($('#modiReplyForBoard').val()=='') alert('수정할 내용을 작성하세요');
    else {
        $('#mmrpfrm').attr('method','post');
        $('#mmrpfrm').attr('action','/board/replyModiOk');
        alert($('#modiReplyForBoard').val());
        alert($('#modifyreplycno').val());
        $('#mmrpfrm').submit();
    }
})

// 댓글 수정창 취소
$('#modifycencelbtn').on('click',function () {
    $('#replyModify').modal('hide');
})

//댓글 삭제하기 모듈
function delReplyForBoard(rno) {
    $('#deletereplycno').val(rno);
    $('#replyDelete').modal('show');
}
// 댓글 삭제완료
$('#deleteokbtn').on('click',function () {
    $('#dmrpfrm').attr('method','post');
    $('#dmrpfrm').attr('action','/board/delreply');
    $('#dmrpfrm').submit();
})

// 댓글 삭제창 취소
$('#deletecencelbtn').on('click',function () {
    $('#replyDelete').modal('hide');
})

// 대댓글 작성하기
$('#rpbtn').on('click',function () {
    if ($('#rereply').val() == '') alert('내용을 작성하세요');
    else {
        $('#rpfrm').attr('method','post');
        $('#rpfrm').attr('action','/board/replyok');
        $('#rpfrm').submit();
    }
})


// write
$('#newbdbtn').on('click',function () {     //작성완료
    if ($('#title').val() == '') alert('제목을 작성하세요!');
    else if ($('#contents').val() == '') alert('본문을 작성하세요!');
    else {
        $('#g-recaptcha').val(grecaptcha.getResponse());
        $('#newbdfrm').attr('method', 'post');
        $('#newbdfrm').attr('enctype', 'multipart/form-data');
        $('#newbdfrm').attr('action', '/board/writeok');
        $('#newbdfrm').submit();
    }
})

$('#Boardcancelbtn').on('click',function () {   //취소하기
    history.go(-1);
});


//update
$('#Boardupbdokbtn').on('click',function () {    //수정완료
    if ($('#title').val() == '') alert('제목을 작성하세요!');
    else if ($('#contents').val() == '') alert('본문을 작성하세요!');
    else { (confirm('정말로 수정 하시겠습니까?'))
        $('#g-recaptcha').val(grecaptcha.getResponse());
        $('#upbdfrm').attr('method','post');
        $('#upbdfrm').attr('enctype','multipart/form-data');
        $('#upbdfrm').attr('action','/board/update');
        $('#upbdfrm').submit();
    }
});

$('#Boardccupbdbtn').on('click',function () {    //취소하기
    history.go(-1);
});

