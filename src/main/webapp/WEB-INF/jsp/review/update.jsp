<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="newChar" value="
" scope="application"/> <%-- value값에 엔터를 넣음 --%>

<%--로그인 하지 않았으면 list페이지로 강제 전환--%>
<c:if test="${UID ne rvo.userid}">
    <c:redirect url="/review/list?cp=1"/>
</c:if>

<%--구글 리캡챠 사용을 위한 api--%>
<script src="https://www.google.com/recaptcha/api.js"></script>

<div id="main"  class="container">
    <div class="margin30">
        <h3><i class="bi bi-cup-fill bidragup"></i>&nbsp;상품 후기</h3>
        <hr style="border-bottom: 1px solid white">
    </div>
    <form id="reviewUpdfrm" class="margin30">
        <div class="row margin1050">
            <div class="col-6">
                <h4><i class="bi bi-pen-fill bidragup"></i>&nbsp;후기 수정</h4>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listReviewBtn" class="btn btn-dark" style="border: 1px solid white; width: 10em;">목록으로</button>
            </div>
        </div>

        <div class="card card-body bg-light margin1050" style="border: none;">
            <div class="form-group row">
                <label for="title" class="col-form-label col-2 text-right">제목</label>
                <input type="text" id="title" name="title" class="form-control col-9" value="${rvo.title}">
            </div>
            <div class="form-group row">
                <label for="userid" class="col-form-label col-2 text-right">작성자</label>
                <input type="text" id="userid" name="userid" class="form-control col-9 bg-light" readonly value="testid<%--${UID}--%>">
            </div>
            <div class="form-group row">
                <label for="contents" class="col-form-label col-2 text-right">본문내용</label>
                <textarea type="text" id="contents" name="contents" class="form-control col-9" rows="20" style="resize: none">${rvo.contents}</textarea>
            </div>

            <!--파일 첨부 시작-->
            <div class="form-group row">
                <label for="file1" class="col-form-label col-2 text-right">이미지 첨부</label>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file1" name="img" class="custom-file-input" value = ${files} >
                    <input type="hidden" id="fileck1" name="fileck1">
                    <label id="file1Lable" class="custom-file-label">
                        <c:if test="${fn:split(rvo.fnames,'[/]')[0] ne '-'}">${fn:substring(fn:split(rvo.fnames,'[/]')[0],15,fn:length(fn:split(rvo.fnames,'[/]')[0]))}</c:if>
                        <c:if test="${fn:split(rvo.fnames,'[/]')[0] eq '-'}">업로드할 이미지파일을 선택하세요1</c:if></label>
                </div>
                <div id="xbox1" class="col-1 bidragdown text-danger">
                    <c:if test="${fn:split(rvo.fnames,'[/]')[0] ne '-'}">
                        <i class="bi bi-x-square" style="cursor: pointer"></i>
                    </c:if>
                    <c:if test="${fn:split(rvo.fnames,'[/]')[0] eq '-'}">
                        <i class="bi bi-x-square invisible"></i>
                    </c:if>
                </div>

                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file2" name="img" class="custom-file-input">
                    <input type="hidden" id="fileck2" name="fileck2">
                    <label id="file2Lable" class="custom-file-label">
                        <c:if test="${fn:split(rvo.fnames,'[/]')[1] ne '-'}">${fn:substring(fn:split(rvo.fnames,'[/]')[1],15,fn:length(fn:split(rvo.fnames,'[/]')[1]))}</c:if>
                        <c:if test="${fn:split(rvo.fnames,'[/]')[1] eq '-'}">업로드할 이미지파일을 선택하세요2</c:if></label>
                </div>
                <div id="xbox2" class="col-1 bidragdown text-danger">
                    <c:if test="${fn:split(rvo.fnames,'[/]')[1] ne '-'}">
                        <i class="bi bi-x-square" style="cursor: pointer"></i>
                    </c:if>
                    <c:if test="${fn:split(rvo.fnames,'[/]')[1] eq '-'}">
                        <i class="bi bi-x-square invisible"></i>
                    </c:if>
                </div>


                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file3" name="img" class="custom-file-input">
                    <input type="hidden" id="fileck3" name="fileck3">
                    <label id="file3Lable" class="custom-file-label">
                        <c:if test="${fn:split(rvo.fnames,'[/]')[2] ne '-'}">${fn:substring(fn:split(rvo.fnames,'[/]')[2],15,fn:length(fn:split(rvo.fnames,'[/]')[2]))}</c:if>
                        <c:if test="${fn:split(rvo.fnames,'[/]')[2] eq '-'}">업로드할 이미지파일을 선택하세요3</c:if></label>
                </div>
                <div id="xbox3" class="col-1 bidragdown text-danger">
                    <c:if test="${fn:split(rvo.fnames,'[/]')[2] ne '-'}">
                        <i class="bi bi-x-square" style="cursor: pointer"></i>
                    </c:if>
                    <c:if test="${fn:split(rvo.fnames,'[/]')[2] eq '-'}">
                        <i class="bi bi-x-square invisible"></i>
                    </c:if>
                </div>

                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file4" name="img" class="custom-file-input">
                    <input type="hidden" id="fileck4" name="fileck4">
                    <label id="file4Lable" class="custom-file-label">
                        <c:if test="${fn:split(rvo.fnames,'[/]')[3] ne '-'}">${fn:substring(fn:split(rvo.fnames,'[/]')[3],15,fn:length(fn:split(rvo.fnames,'[/]')[3]))}</c:if>
                        <c:if test="${fn:split(rvo.fnames,'[/]')[3] eq '-'}">업로드할 이미지파일을 선택하세요4</c:if></label>
                </div>
                <div id="xbox4" class="col-1 bidragdown text-danger">
                    <c:if test="${fn:split(rvo.fnames,'[/]')[3] ne '-'}">
                        <i class="bi bi-x-square" style="cursor: pointer"></i>
                    </c:if>
                    <c:if test="${fn:split(rvo.fnames,'[/]')[3] eq '-'}">
                        <i class="bi bi-x-square invisible"></i>
                    </c:if>
                </div>

                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file5" name="img" class="custom-file-input">
                    <input type="hidden" id="fileck5" name="fileck5">
                    <label id="file5Lable" class="custom-file-label">
                        <c:if test="${fn:split(rvo.fnames,'[/]')[4] ne '-'}">${fn:substring(fn:split(rvo.fnames,'[/]')[4],15,fn:length(fn:split(rvo.fnames,'[/]')[4]))}</c:if>
                        <c:if test="${fn:split(rvo.fnames,'[/]')[4] eq '-'}">업로드할 이미지파일을 선택하세요5</c:if></label>
                </div>
                <div id="xbox5" class="col-1 bidragdown text-danger">
                    <c:if test="${fn:split(rvo.fnames,'[/]')[4] ne '-'}">
                        <i class="bi bi-x-square" style="cursor: pointer"></i>
                    </c:if>
                    <c:if test="${fn:split(rvo.fnames,'[/]')[4] eq '-'}">
                        <i class="bi bi-x-square invisible"></i>
                    </c:if>
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
                <button type="button" id="reviewUpdOkBtn" class="btn btn-primary" style="width: 10em;"><i class="bi bi-check"></i>수정완료</button>
                <button type="button" id="reviewUpdcancelbtn" class="btn btn-danger" style="width: 10em;"><i class="bi bi-x"></i>취소하기</button>
            </div><!--버튼들-->
        </div>
        <input type="hidden" name="rno" value="${param.rno}">
    </form>

</div>