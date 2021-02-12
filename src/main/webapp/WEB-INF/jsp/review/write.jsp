<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--구글 리캡챠 사용을 위한 api--%>
<script src="https://www.google.com/recaptcha/api.js"></script>

<div id="main">
    <div class="margin30">
        <h3><i class="bi bi-cup-fill bidragup"></i>&nbsp;상품 후기</h3>
        <hr>
    </div>
    <form id="reviewfrm" class="margin30">
        <div class="row margin1050">
            <div class="col-6">
                <h4>새글쓰기</h4>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listReviewBtn" class="btn btn-dark">목록으로</button>
            </div>
        </div>

        <div class="card card-body bg-light margin1050">
            <div class="form-group row">
                <label for="title" class="col-form-label col-2 text-right">제목</label>
                <input type="text" id="title" name="title" class="form-control col-9">
            </div>
            <div class="form-group row">
                <label for="userid" class="col-form-label col-2 text-right">작성자</label>
                <input type="text" id="userid" name="userid" class="form-control col-9" readonly value="${UID}">
            </div>
            <div class="form-group row">
                <label for="contents" class="col-form-label col-2 text-right">본문내용</label>
                <textarea type="text" id="contents" name="contents" class="form-control col-9" rows="20" style="resize: none"></textarea>
            </div>

            <!--파일 첨부 시작-->
            <div class="form-group row">
                <label for="file1" class="col-form-label col-2 text-right">파일 첨부</label>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file1" name="img" class="custom-file-input">
                    <label class="custom-file-label">업로드할 이미지파일을 선택하세요1</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file2" name="img" class="custom-file-input">
                    <label class="custom-file-label">업로드할 이미지파일을 선택하세요2</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file3" name="img" class="custom-file-input">
                    <label class="custom-file-label">업로드할 이미지파일을 선택하세요3</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file4" name="img" class="custom-file-input">
                    <label class="custom-file-label">업로드할 이미지파일을 선택하세요4</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file5" name="img" class="custom-file-input">
                    <label class="custom-file-label">업로드할 이미지파일을 선택하세요5</label>
                </div>
            </div>
            <!--파일 첨부 끝-->

            <div class="form-group row">
                <label class="col-form-label col-2 text-right text-danger">자동 가입방지</label>
                <div class="g-recaptcha" data-sitekey="6LfA1joaAAAAAOU9f2VaZdKu9Z4C_tWErqdpFnqf"></div>
                <input type="hidden" name="g-recaptcha" id="g-recaptcha">
                <span style="color: red">${checkCaptcha}</span>
            </div><!--자동가입방지-->

        </div>


        <div class="row">
            <div class="col-12 text-center">
                <button type="button" id="reviewWriteOkBtn" class="btn btn-primary"><i class="bi bi-check"></i>입력완료</button>
                <button type="button" id="reviewWritecancelbtn" class="btn btn-danger"><i class="bi bi-x"></i>취소하기</button>
            </div><!--버튼들-->
        </div>
    </form>

</div>