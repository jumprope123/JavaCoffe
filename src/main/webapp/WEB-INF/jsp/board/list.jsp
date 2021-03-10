<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><!--문자용-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fnt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="pp" value="10"/>
<fmt:parseNumber var="bdcnt" value="${bdcnt}"/>

<fmt:parseNumber var="sp" integerOnly="true" value="${( (cp-1) / pp )}" />
<fmt:parseNumber var="sp" value="${sp * 10 +1}" />
<fmt:parseNumber var="ep" value="${sp + 9}" />

<fmt:parseNumber var="tp" value="${bdcnt / pp}" integerOnly="true" />
<c:if test="${(bdcnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<fmt:parseNumber var="snum" integerOnly="true" value="${bdcnt - (cp - 1) * pp}" />

<%--검색 여부에 따라 네비게이션 링크출력을 다르게 함--%>
<%--일반 목록 출력: /board/list?cp=--%>
<%--검색 후 목록 출력: /board/find?findtype=???&findkey=???&cp=??--%>
<c:set var="navlnk" value="/board/list?cp=" />
<c:if test="${not empty param.findkey}">
    <c:set var="navlnk">
        /board/find?findtype=${param.findtype}&findkey=${param.findkey}$cp=</c:set>
</c:if>


<div id = "main" class="container">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i>고객센터</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-12">
            <table class="table table-striped tblines text-center table-hover">
                <thead style="background: #a5a2a1;">
                <tr class="text-white"><th style="width:7%">번호</th>
                    <th>제목</th>
                    <th style="width:12%">작성자</th>
                    <th style="width:13%">작성일</th>
                    <th style="width:7%">추천</th>
                    <th style="width:7%">조회</th></tr>
                </thead>
                <tbody>
                <tr class="text-info" style="background: #e8e7e7"><th class="text-danger">공지</th>
                    <th><span class="badge-danger bi bi-cup-fill"> Hot </span>&nbsp;고객센터입니다. 건의사항을 적어주시면 신속하게 반영하도록 노력하겠습니다 <br/>타인에 대한 비방과 욕설은 금지입니다</th>
                    <th>운영자</th>
                    <th>2021-02-20</th>
                    <th>10</th>
                    <th>128</th></tr>

                <c:forEach var="b" items="${bds}">
                <tr><td>${snum}</td>
                    <td><a href="/board/view?bno=${b.bno}&cp=${cp}">${b.title}</a></td>
                    <td>${b.userid}</td>
                    <td>${fn:substring(b.regdate,0,10)}</td>
                    <td>${b.thumbs}</td>
                    <td>${b.views}</td></tr>
                    <c:set var="snum" value="${snum-1}" />
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div><!--게시판 테이블-->

    <div class="row margin1050">
<%--        <c:if test="${not empty UID }">--%>
            <div class="col-6">
                <div class="form-group row">
                    <select name="findtype" id="findtype" class="form-control col-3">
                        <option value="title">제목</option>
                        <option value="ticon">제목 + 내용</option>
                        <option value="contents">내용</option>
                        <option value="userid">작성자</option>
                    </select>&nbsp;
                    <input type="text" name="findkey" id="findkey" class="form-control col-5">
                    &nbsp;<button type="button" id="bdfindbtn" class="btn btn-dark">
                    <i class="bi bi-search"></i> 검색</button>
                </div>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="newbd" class="btn btn-light">
                    <i class="bi bi-pencil-square bidragup"></i>&nbsp;새 글 쓰기</button>
            </div>
<%--        </c:if>--%>
    </div><!--새 글 쓰기-->

    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">
                <!--'이전'이 표시될 때는 cp > 10-->
                <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                    <a href="${navlnk}${sp-10}" class="page-link">이전</a></li>

                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <c:if test="${i le tp}">
                        <c:if test="${i ne cp}">
                            <li class="page-item">
                                <a href="${navlnk}${i}"
                                   class="page-link font-weight-bold">${i}</a></li>
                        </c:if>

                        <c:if test="${i eq cp}">
                            <li class="page-item active">
                                <a href="${navlnk}${i}"
                                   class="page-link font-weight-bold">${i}</a></li>
                        </c:if>
                    </c:if>
                </c:forEach>

                <!--'다음'이 표시될 때는 -->
                <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                    <a href="${navlnk}${sp+10}" class="page-link">다음</a></li>

            </ul>
        </div>
    </div>
</div>