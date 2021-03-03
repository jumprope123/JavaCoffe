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

// 이전글 클릭시
$('#Boardprevbtn').on('click',function () {
    location.href = '/board/preview?bno=' + $('#bno').val() + "&cp=" + $('#cp').val();;
})

//다음글 클릭시
$('#Boardnextbtn').on('click',function () {
    location.href = '/board/preview?bno=' + $('#bno').val() + "&cp=" + $('#cp').val();;
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
        $('#upbdfrm').attr('method','post');
        $('#upbdfrm').attr('action','/board/update');
        $('#upbdfrm').submit();
    }
});

$('#Boardccupbdbtn').on('click',function () {    //취소하기
    history.go(-1);
});