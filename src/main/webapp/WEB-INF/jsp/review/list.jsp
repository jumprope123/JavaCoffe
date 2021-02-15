<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%-- 페이지당 게시물 수 24로 설정--%>
<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="pp" value="24"/>
<fmt:parseNumber var="reviewCnt" value="${reviewCnt}"/>

<fmt:parseNumber var="sp" value="${((cp-1) / 10)}" integerOnly="true"/>
<fmt:parseNumber var="sp" value="${sp * 10 + 1}"/>
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<fmt:parseNumber var="tp" value="${reviewCnt/pp}" integerOnly="true"/>
<c:if test="${(reviewCnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>

<fmt:parseNumber var="snum" value="${reviewCnt - (cp - 1) * pp}" integerOnly="true"/>

<%-- 검색 여부에 따라 네비게이션 링크 출력을 다르게 함 --%>
<%--일반 목록 출력 : /review/list?cp=--%>
<%--검색 후 목록 출력 : /review/find?findtype=?&findkey=?&cp=?--%>
<c:set var="navlnk" value="/review/list?cp="/>
<c:if test="${not empty param.findkey}">
    <c:set var="navlnk" value="/review/find?findtype=${param.findtype}&findkey=${param.findkey}&cp="/>
</c:if>

<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/cdn/_thumb/small_글번호_파일명 --%>
<c:set var="baseImgURL" value="http://localhost/cdn"/>
<%--<c:set var="baseImgURL" value="http://13.125.205.40:8447/cdn" />--%>
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

<div id="main">
    <div class="margin30">
        <h3><i class="bi bi-cup-fill bidragup"></i>&nbsp;상품 후기</h3>
        <hr style="border-bottom: 1px solid white">
    </div>

    <%--검색창--%>
    <div class="row margin1050">
        <div class="col-6">
            <div class="form-group row">
                <select name="findtype" id="findtype" class="form-control col-4">
                    <option value="title">제목</option>
                    <option value="ticon">제목 + 내용</option>
                    <option value="contents">내용</option>
                    <option value="userid">작성자</option>
                </select>
                <input type="text" name="findkey" id="findkey" class="form-control col-5">
                <button type="button" id="reviewFindBtn" class="btn btn-dark"><i class="bi bi-search bidragup"></i>검색하기</button>
            </div>
        </div>
        <%--새글쓰기 버튼--%>
        <div class="col-6 text-right">
            <button type="button" id="newReview" class="btn btn-info"><i class="bi bi-plus-circle bidragup"></i>&nbsp;새글쓰기</button>
        </div>
    </div>
    <%--리스트 내용물--%>
    <div class="row margin1050 mt-3">
        <ul class="list-inline">
            <c:forEach var="r" items="${reviews}">
                <li class="list-inline-item" style="margin-bottom: 10px;">
                    <div class="card" style="width: 242px;">
                        <img src="${thumbURL}${r.rno}_${fn:split(r.fnames,"[/]")[0]}" class="card-img-top" width="220" height="220" onclick="javascript:showimg('${r.rno}')" style="cursor: pointer">
                        <div class="card-body">
                            <h5 class="card-title">${r.title}</h5>
                            <p class="card-text">${r.userid} <span style="float: right">${fn:substring(r.regdate, 0, 10)}</span></p>
                            <p class="card=text"><i class="bi bi-eye"></i> ${r.views} <span style="float: right"><i class="bi bi-hand-thumbs-up"></i> ${r.thumbs}</span></p>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <%--하단 페이지 바--%>
    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">
                <%--'이전'이 표시되어야 할 때는 cp > 10 --%>
                <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                    <a href="${navlnk}${sp - 10}" class="page-link">이전</a></li>

                    <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                        <c:if test="${i le tp}">
                            <c:if test="${i ne cp}">
                                <li class="page-item"><a href="${navlnk}${i}" class="page-link font-weight-bold">${i}</a></li>
                            </c:if>

                            <c:if test="${i eq cp}">
                                <li class="page-item active"><a href="${navlnk}${i}" class="page-link font-weight-bold">${i}</a></li>
                            </c:if>
                        </c:if>
                    </c:forEach>

                    <%--'다음'이 표시되어야 할 때는 ?--%>
                    <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                        <a href="${navlnk}${sp+10}" class="page-link">다음</a></li>
            </ul>
        </div>
    </div>


</div>