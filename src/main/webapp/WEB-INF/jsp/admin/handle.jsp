<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
    .singleDay{
        font-family: 'Single Day', cursive;
        font-size: 16px;
    }
</style>
<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/eshop/_thumb/small_글번호_파일명 --%>
<c:set var="baseImgURL" value="http://localhost/eshop"/>
<%--<c:set var="baseImgURL" value="http://13.125.205.40:8447/eshop" />--%>
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

<div id="main" class="singleDay container">
    <div class="row text-center">
    <div class="col-10 offset-1 text-center">
        <div class="row mt-4">
            <div class="col-12 h1">주문상황 확인 시스템</div>
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
        </div>
    </div>
</div>
</div>