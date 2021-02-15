// jquery 선택자에 for문을 적용하는방법을 알면 적용하기
// 이미지파일 확장자 제한 및 선택한 파일이름 띄우기 1~5
$(document).ready(function () {
    $("#file1").change(function () {
        var file1name = $(this)[0].files[0].name;
        var file1type = file1name.substring(file1name.lastIndexOf(".")+1).toLowerCase();
        if (!(file1type == 'jpg' || file1type == 'png' || file1type == 'jpeg' || file1type == 'bmp' || file1type == 'gif')){
            alert('확장자가 png, jpeg, bmp, gif 인 이미지파일만 선택가능합니다.');
            $('#file1').val('');
            document.getElementById('file1Lable').innerText = '업로드할 이미지파일을 선택하세요1';
        }else {
            document.getElementById('file1Lable').innerText = file1name;
        }
    })
})

$(document).ready(function () {
    $("#file2").change(function () {
        var file2name = $(this)[0].files[0].name;
        var file2type = file2name.substring(file2name.lastIndexOf(".")+1).toLowerCase();
        if (!(file2type == 'jpg' || file2type == 'png' || file2type == 'jpeg' || file2type == 'bmp' || file2type == 'gif')){
            alert('확장자가 png, jpeg, bmp, gif 인 이미지파일만 선택가능합니다.');
            $('#file2').val('');
            document.getElementById('file2Lable').innerText = '업로드할 이미지파일을 선택하세요2';
        }else {
            document.getElementById('file2Lable').innerText = file2name;
        }
    })
})

$(document).ready(function () {
    $("#file3").change(function () {
        var file3name = $(this)[0].files[0].name;
        var file3type = file3name.substring(file3name.lastIndexOf(".")+1).toLowerCase();
        if (!(file3type == 'jpg' || file3type == 'png' || file3type == 'jpeg' || file3type == 'bmp' || file3type == 'gif')){
            alert('확장자가 png, jpeg, bmp, gif 인 이미지파일만 선택가능합니다.');
            $('#file3').val('');
            document.getElementById('file3Lable').innerText = '업로드할 이미지파일을 선택하세요3';
        }else {
            document.getElementById('file3Lable').innerText = file3name;
        }
    })
})

$(document).ready(function () {
    $("#file4").change(function () {
        var file4name = $(this)[0].files[0].name;
        var file4type = file4name.substring(file4name.lastIndexOf(".")+1).toLowerCase();
        if (!(file4type == 'jpg' || file4type == 'png' || file4type == 'jpeg' || file4type == 'bmp' || file4type == 'gif')){
            alert('확장자가 png, jpeg, bmp, gif 인 이미지파일만 선택가능합니다.');
            $('#file4').val('');
            document.getElementById('file4Lable').innerText = '업로드할 이미지파일을 선택하세요4';
        }else {
            document.getElementById('file4Lable').innerText = file4name;
        }
    })
})

$(document).ready(function () {
    $("#file5").change(function () {
        var file5name = $(this)[0].files[0].name;
        var file5type = file5name.substring(file5name.lastIndexOf(".")+1).toLowerCase();
        if (!(file5type == 'jpg' || file5type == 'png' || file5type == 'jpeg' || file5type == 'bmp' || file5type == 'gif')){
            alert('확장자가 png, jpeg, bmp, gif 인 이미지파일만 선택가능합니다.');
            $('#file5').val('');
            document.getElementById('file5Lable').innerText = '업로드할 이미지파일을 선택하세요5';
        }else {
            document.getElementById('file5Lable').innerText = file5name;
        }
    })
})

// 입력완료 버튼 클릭시 동작 정의
$('#reviewWriteOkBtn').on('click',function () {

    if ($('#title').val() == ''){
        alert('제목을 입력하세요');
    }else if($('#contents').val()==''){
        alert('내용을 입력하세요');
    }else if ($('#file1').val()==''){
        alert('사진을 1개이상 첨부해주세요')
    }else if (grecaptcha.getResponse()==""){
        alert('자동 작성 방지 확인을 클릭해주세요');
    }else {
        $('#g-recaptcha').val(grecaptcha.getResponse());
        $('#reviewfrm').attr('method','post');
        $('#reviewfrm').attr('enctype','multipart/form-data');
        $('#reviewfrm').attr('action','/review/write');
        $('#reviewfrm').submit();

    }
})

$('#reviewWritecancelbtn').on('click',function () {
    if (confirm('정말 취소하시겠습니까?')){
        location.href = '/review/list?cp=1';
    }
})

// 목록으로 버튼 클릭시
$('#listReviewBtn').on('click',function () {
    location.href = '/review/list?cp=1';
})

$('#newReview').on('click',function () {
    location.href = '/review/write';
})

function showimg(rno) {
    location.href = '/review/view?rno=' + rno;
}

$('#reviewFindBtn').on('click',function () {
    if ($('#findkey').val()==''){
        alert('검색하실 내용을 입력하세요');
        return;
    }
    let param = "?findtype=" + $('#findtype').val();
    param += "&findkey=" + $('#findkey').val();
    location.href = "/review/find" + param + '&cp=1';
})

//댓글남기기 버튼 클릭시
$('#reviewcmtbtn').on('click',function () {
    if ($('#reply').val() == '') alert('댓글을 작성하세요');
    else {
        $('#uid').val('테스트계정'); //나중에 삭제
        $('#replyfrm').attr('method','post');
        $('#replyfrm').attr('action','/review/replyok');
        $('#replyfrm').submit();
    }
})

// 대댓글을 위한 댓글의 추가 버튼 클릭시
function addReply(commentNo) {
    $('#replyModal').modal('show');
    $('#commentNo').val(commentNo); // 대댓글 작성시 부모댓글의 번호를 cno에 저장
} //대댓글 대화상자 띄우기

//대댓글 작성하기
$('#rpbtn').on('click',function () {
    if ($('#rereply').val()=='') alert('내용을 작성하시오');
    else {
        $('#rpfrm').attr('method','post');
        $('#rpfrm').attr('action','/review/replyok');
        $('#rpfrm').submit();
    }
})

// 대댓글추가창 닫기
$('#rpcencelbtn').on('click',function () {
    $('#replyModal').modal('hide');
})


// 댓글 수정을 위한 댓글의 수정 버튼 클릭시 내용물 다 채워서 띄우기
function modiReply(replyNo,reply) {
    $('#modireply').val(reply);
    $('#modireplyNo').val(replyNo);
    $('#replyModifyModal').modal('show');
}

//댓글 수정하기
$('#modirpbtn').on('click',function () {
    if ($('#modireply').val()=='') alert('내용을 작성하시오');
    else {
        $('#rpmdfrm').attr('method','post');
        $('#rpmdfrm').attr('action','/review/replyModiOk');
        $('#rpmdfrm').submit();
    }
})

// 댓글 수정창 닫기
$('#modcencelirpbtn').on('click',function () {
    $('#replyModifyModal').modal('hide');
})


//댓글 삭제모달
function delReply(replyNo) {
    $('#delreplyNo').val(replyNo);
    $('#replydeleteModal').modal('show');
}
// 댓글 삭제하기
$('#delrpbtn').on('click',function () {
    $('#rpdelfrm').attr('method','post');
    $('#rpdelfrm').attr('action','/review/replydel');
    $('#rpdelfrm').submit();
})

// 댓글 삭제창 닫기
$('#delcencelrpbtn').on('click',function () {
    $('#replydeleteModal').modal('hide');
})
