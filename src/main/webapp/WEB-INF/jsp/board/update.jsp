<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--로그인하지않았다면 list페이지로 강제 전환-->
<%--<c:if test="test${empty UID}">--%>
<%--    <c:redirect url="/board/list?cp=1"/>--%>
<%--</c:if>--%>

<div id = "main" class="container">
    <div class="margin30">
        <h3><i class="bi bi-pencil-square bidragup"></i>수정하기</h3>
        <hr>
    </div>

    <form id="upbdfrm">
        <div class="row margin1050">
            <div class="col-6">
                <h4><i class="bi bi-plus-circle-fill bidragup"></i> 새글쓰기</h4>
            </div>
        </div><!--상단버튼-->

        <div class="card card-body bg-light margin1050">
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">제목</label>
                <input type="text" id="title" name="title" class="form-control col-9" value="${bd.title}">
            </div>
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">작성자</label>
                <input type="text" id="uid" name="userid" class="form-control col-9" readonly  value="${bd.userid}">
            </div>
            <div class="form-group row">
                <label for="contents" class="col-form-label col-2 text-right">본문내용</label>
                <textarea type="text" id="contents" name="contents" class="form-control col-9"
                          rows="15">${bd.contents}</textarea>
            </div>
            <div class="form-group row">
                <label class="col-2 text-right text-danger" >자동 입력방지</label>
                <div class="g-recaptcha"
                     data-sitekey = "6LfA1joaAAAAAOU9f2VaZdKu9Z4C_tWErqdpFnqf"></div>
                <input type="hidden" name="g-recaptcha" id="g-recaptcha">
            </div>
        </div><!--수정하기 폼-->

        <input type="hidden" name="bno" value="${param.bno}">
        <input type="hidden" name="cp" value="${param.cp}">

        <div class="row margin1050">
            <div class="col-12 text-center">
                <button type="button" id="Boardupbdokbtn" class="btn btn-primary"><i class="bi bi-check"></i>수정완료</button>
                <button type="button" id="Boardccupbdbtn" class="btn btn-danger"><i class="bi bi-x"></i> 취소하기</button>
            </div>
        </div>
    </form>

</div>