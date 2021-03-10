<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty UID}">
    <script>
        alert('로그인 페이지로 이동합니다.');
        location.href="/login/login";
    </script>
</c:if>

<div id="main"  class="container">
    <div class="row">
        <div class="col-10 offset-1 text-center">
            <div class="row mt-5">
                <div class="col-12 font-weight-bold text-success h2">
                    회원정보 수정
                </div>
            </div>
            <div class="row mt-5  align-items-center">
                <label for="memberInfoMno" class="col-2 offset-1">회원번호</label>
                <input type="text" class="form-control col-5" id="memberInfoMno" name="mno" value="${memberInfo.mno}" readonly>
            </div>
            <div class="row mt-4  align-items-center">
                <label for="memberInfoName" class="col-2 offset-1">이름</label>
                <input type="text" class="form-control col-5" id="memberInfoName" name="name" value="${memberInfo.name}" readonly>
            </div>
            <div class="row mt-4  align-items-center">
                <label for="memberInfoZipcode" class="col-2 offset-1">우편번호</label>
                <input type="text" class="form-control col-5" id="memberInfoZipcode" name="Zipcode" value="${memberInfo.zipcode}" readonly>
            </div>
            <div class="row mt-4  align-items-center">
                <label for="memberInfoAddr" class="col-2 offset-1">주소</label>
                <input type="text" class="form-control col-5" id="memberInfoAddr" name="userAddr" value="${memberInfo.userAddr1}" readonly>
            </div>
            <div class="row mt-4  align-items-center">
                <label for="memberInfoEmail" class="col-2 offset-1">이메일</label>
                <input type="text" class="form-control col-5" id="memberInfoEmail" name="email" value="${memberInfo.email}" readonly>
            </div>
            <div class="row mt-4  align-items-center">
                <label for="memberInfoPhone" class="col-2 offset-1">전화번호</label>
                <input type="text" class="form-control col-5" id="memberInfoPhone" name="phone" value="${memberInfo.phone}" readonly>
            </div>
            <div class="row mt-4  align-items-center">
                <label for="memberInfoRegdate" class="col-2 offset-1">가입일</label>
                <input type="text" class="form-control col-5" id="memberInfoRegdate" name="regdate" value="${memberInfo.regdate}" readonly>
            </div>
            <div class="row mt-4  align-items-center">
                <label for="memberInfoPoints" class="col-2 offset-1">포인트</label>
                <input type="text" class="form-control col-5" id="memberInfoPoints" name="points" value="${memberInfo.points}" readonly>
            </div>
            <div class="row mt-4 mb-4 align-items-center">
                <label for="memberInfoKakaoID" class="col-2 offset-1">카카오 연동 여부</label>
                <input type="text" class="form-control col-5" id="memberInfoKakaoID" name="kakaoID"
                       <c:if test="${empty memberInfo.kakaoID}">value="미연동" </c:if>
                       <c:if test="${not empty memberInfo.kakaoID}">value="연동" </c:if> readonly>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 text-center">
            <button type="button" id="memberInfoReturnBtn" class="btn btn-lg btn-success mb-4">돌아가기</button>
        </div>
    </div>
</div>
