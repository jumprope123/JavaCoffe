<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
    .singleDay{
        font-family: 'Single Day', cursive;
        font-size: 16px;
    }
</style>

<c:if test="${UID ne 'javapresso'}">
    <script>
        location.href="/index";
    </script>
</c:if>

<%-- 페이지당 게시물 수 30로 설정--%>
<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="pp" value="30"/>
<fmt:parseNumber var="dataCnt" value="${dataCnt}"/>

<fmt:parseNumber var="sp" value="${((cp-1) / 10)}" integerOnly="true"/>
<fmt:parseNumber var="sp" value="${sp * 10 + 1}"/>
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<fmt:parseNumber var="tp" value="${dataCnt/pp}" integerOnly="true"/>
<c:if test="${(dataCnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>

<fmt:parseNumber var="snum" value="${dataCnt - (cp - 1) * pp}" integerOnly="true"/>

<%--네비게이션 링크--%>
<c:set var="navlnk" value="/admin/handle?cp="/>
<c:if test="${not empty param.adminSearchTxt}">
    <c:set var="navlnk" value="/admin/find?adminSearchTxt=${param.adminSearchTxt}&cp="/>
</c:if>

<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/eshop/_thumb/small_글번호_파일명 --%>
<%--<c:set var="baseImgURL" value="http://localhost/eshop"/>--%>
<c:set var="baseImgURL" value="http://13.125.205.40:8447/cdn" />
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

<div id="main" class="singleDay">
    <div class="row text-center">
        <div class="col-10 offset-1 text-center">
            <div class="row">
                <div class="col-10 offset-1 text-center">
                    <div class="row mt-4">
                        <div class="col-12 h1">주문상황 확인 시스템<span class="text-danger">(단품배송)</span></div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-4 offset-4 text-center">
                    <button class="btn btn-danger" onclick="javascript:goToHandelBtn()">단품배송보기</button>
                    <button class="btn btn-success" onclick="javascript:goToHandelBindBtn()">묶음배송보기</button>
                </div>
                <div class="col-4  text-right">
                    <select id="adminSearchTxt" class="p-2">
                        <option value="1" <c:if test="${param.adminSearchTxt == '1'}">selected</c:if>>배송준비중</option>
                        <option value="2" <c:if test="${param.adminSearchTxt == '2'}">selected</c:if>>배송중</option>
                        <option value="3" <c:if test="${param.adminSearchTxt == '3'}">selected</c:if>>배송완료</option>
                        <option value="4" <c:if test="${param.adminSearchTxt == '4'}">selected</c:if>>반품요청</option>
                        <option value="5" <c:if test="${param.adminSearchTxt == '5'}">selected</c:if>>반품</option>
                    </select>
                    <button type="button" id="adminFindBtn" class="btn btn-dark"><i class="bi bi-search bidragup"></i>검색하기</button>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <table class="table table-hover ">
                        <thead>
                            <tr>
                                <td>번호</td>
                                <td>사진</td>
                                <td>제목</td>
                                <td>브랜드</td>
                                <td>배송비</td>
                                <td>구매수량</td>
                                <td>주문금액</td>
                                <td>아이디</td>
                                <td>받는분 주소</td>
                                <td>받는분 핸드폰</td>
                                <td>배송상황</td>
                                <td>배송상황수정</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="d" items="${data}">
                                <tr>
                                    <td>${d.buyno}</td>
                                    <td><img src="${thumbURL}${d.eno}_${fn:split(d.fnames,"[/]")[0]}" style="border-radius: 50%; width: 50px; height: 50px"></td>
                                    <td>${d.title}</td>
                                    <td>${d.brand}</td>
                                    <td>${d.shipPay}</td>
                                    <td>${d.purchase}</td>
                                    <td>${d.afterFinalPrice}</td>
                                    <td>${d.userid}</td>
                                    <td>${d.deliveryUserAddr1}&nbsp;${d.deliveryUserAddr2}&nbsp;${d.deliveryUserAddr3}</td>
                                    <td>${d.receivePhone}</td>
                                    <td><span id="processVal${d.buyno}">${d.process}</span></td>
                                    <td><select id="processModify${d.buyno}" onchange="processMod('${d.buyno}')">
                                        <option <c:if test="${d.process eq '배송준비중'}">selected</c:if> value="배송준비중">배송준비중</option>
                                        <option <c:if test="${d.process eq '배송중'}">selected</c:if> value="배송중">배송중</option>
                                        <option <c:if test="${d.process eq '배송완료'}">selected</c:if> value="배송완료">배송완료</option>
                                        <option <c:if test="${d.process eq '반품요청'}">selected</c:if> value="반품요청">반품요청</option>
                                        <option <c:if test="${d.process eq '반품'}">selected</c:if> value="반품">반품</option>
                                    </select></td>
                                    <input type="hidden" id="d" value="${d.buyno}">
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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
            </div>
        </div>
    </div>
</div>
