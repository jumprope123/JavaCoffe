<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src = "https://www.google.com/recaptcha/api.js"></script>

<!--로그인하지않았다면 list페이지로 강제 전환-->
<c:if test="test${empty UID}">
    <c:redirect url="/board/list?cp=1"/>
</c:if>

<div id = "main" class="container">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i>고객센터</h3>
        <hr>
    </div>

    <form id="newbdfrm">
        <div class="row margin1050">
            <div class="col-6">
                <h4><i class="bi bi-plus-circle-fill bidragup"></i> 새글쓰기</h4>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listbdbtn" class="btn btn-light"><i class="bi bi-card-list bidragup"></i>목록으로</button>

            </div>
        </div><!--상단버튼-->

        <input type="hidden" id="cp" value="${param.cp}">

        <div class="card card-body bg-light margin1050">
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">제목</label>
                <input type="text" id="title" name="title" class="form-control col-9">
            </div>
            <div class="form-group row">
                <label for="uid" class="col-form-label col-2 text-right">작성자</label>
                <input type="text" id="uid" name="userid" class="form-control col-9" readonly value="${UID}">
            </div>
            <div class="form-group row">
                <label for="contents" class="col-form-label col-2 text-right">본문내용</label>
                <textarea type="text" id="contents" name="contents" class="form-control col-9" rows="15"></textarea>
            </div>
            <!--파일첨부 시작-->
            <div class="form-group row">
                <label for="contents" class="col-form-label col-2 text-right">파일첨부</label>
                <div class="custom-file col-9">
                    <input type="file" id="file1b" name="file" class="custom-file-input">
                    <label class="custom-file-label" id="file1bLable">첨부할 파일을 선택하세요(업로드 후 수정/삭제 불가합니다)</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file2b" name="file" class="custom-file-input">
                    <label class="custom-file-label" id="file2bLable">첨부할 파일을 선택하세요(업로드 후 수정/삭제 불가합니다)</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file3b" name="file" class="custom-file-input">
                    <label class="custom-file-label" id="file3bLable">첨부할 파일을 선택하세요(업로드 후 수정/삭제 불가합니다)</label>
                </div>
            </div><!--파일첨부 끝-->
            <div class="form-group row">
                <label class="col-2 text-right text-danger" >자동 입력방지</label>
                <div class="g-recaptcha"
                     data-sitekey = "6LfA1joaAAAAAOU9f2VaZdKu9Z4C_tWErqdpFnqf"></div>
                <input type="hidden" name="g-recaptcha" id="g-recaptcha">
            </div>
        </div><!--새글쓰기 폼-->

        <div class="row margin1050">
            <div class="col-12 text-center">
                <button type="button" id="newbdbtn" class="btn btn-primary"><i class="bi bi-check"></i>입력완료</button>
                <button type="button" id="Boardcancelbtn" class="btn btn-danger"><i class="bi bi-x"></i> 취소하기</button>
            </div>
        </div>
    </form>

</div>