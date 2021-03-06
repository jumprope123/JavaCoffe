<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/eshop/_thumb/small_글번호_파일명 --%>
<c:set var="baseImgURL" value="http://localhost/eshop"/>
<%--<c:set var="baseImgURL" value="http://13.125.205.40:8447/eshop" />--%>
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

<div id="main">
    <div class="row">
        <form id="buyPageForm" class="col-8 offset-2">
            <div class="row mt-3">
                <div class="col-6 text-left h4 font-weight-bold">주문/결제</div>
                <div class="col-6 text-right">장바구니<i class="bi bi-chevron-right"></i><span class="font-weight-bold">주문/결제</span><i class="bi bi-chevron-right"></i>결제완료</div>
            </div>
            <div class="row"><div class="col-12" style="border-bottom: 1px solid grey;"></div></div>
            <div class="row mt-3" style="padding: 10px 0;background-color: RGB(246,246,246)">
                <div class="col-5 text-center">상품정보</div>
                <div class="col-2 text-center">브랜드</div>
                <div class="col-1 text-center">배송비</div>
                <div class="col-1 text-center">주문수량</div>
                <div class="col-1 text-center">할인액</div>
                <div class="col-2 text-center">상품금액(할인포함)</div>
            </div> <%--최상단 글정보--%>
            <div class="row align-items-center mt-3">
                <div class="col-5 text-center">
                    <div class="row align-items-center">
                        <div class="col-3">
                            <img src="${thumbURL}${evo.eno}_${fn:split(evo.fnames,"[/]")[0]}" style="border-radius: 50%">
                        </div> <%--사진--%>
                        <div class="col-9 font-weight-bold text-left">${evo.title}</div> <%--상품정보--%>
                    </div>
                </div>
                <div class="col-2 text-center">${evo.brand}</div>
                <div class="col-1 text-center">${evo.shipPay}원</div>
                <div class="col-1 text-center">${salesCnt}개</div>
                <div class="col-1 text-center">(-) ${(evo.ogprice * salesCnt) - (evo.dcprice * salesCnt)}원</div>
                <div class="col-2">
                    <div class="row">
                        <div class="col-12 text-center" style="color: RGB(193,163,151);text-decoration-line: line-through; font-size: 0.8em;">${evo.ogprice * salesCnt}원</div> <%--할인전가격--%>
                        <div class="col-12 text-center">${evo.dcprice * salesCnt}원</div> <%--할인후가격--%>
                    </div>
                </div>
            </div>
            <div class="row mt-3"><div class="col-12" style="border-bottom: 1px dotted green;"></div></div>
            <div class="row mt-5">
                <div class="col-9">
                    <div class="row">
                        <div class="col-12 text-left font-weight-bold h5">배송지정보</div>
                    </div>
                    <div class="form-group row mt-3">
                        <div class="col-12">
                            <div class="row">
                                <label class="col-2 col-form-label text-left">우편번호</label>
                                <input type="text" id="sample6_postcode" class="form-control col-2" name="zipcode" placeholder="우편번호" value="${mvo.zipcode}" readonly >
                                <input type="button" class="btn btn-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                            </div>
                            <div class="row">
                                <label class="col-2 col-form-label text-right"></label>
                                <input type="text" class="input_text zipsize col-4 form-control" name="userAddr1" style="height: 2.5rem;" id="sample6_address" placeholder="주소" value="${mvo.userAddr1}" readonly><br>
                                <input type="text" class="input_text zipsize col-3 form-control" name="userAddr2" id="sample6_detailAddress"  value="${mvo.userAddr2}" placeholder="상세주소">
                                <input type="text" class="input_text zipsize col-3 form-control" name="userAddr3" id="sample6_extraAddress"  value="${mvo.userAddr3}" placeholder="추가주소">
                            </div>
                        </div>
                    </div>
                </div> <%--배송지정보--%>
                <div class="col-3"></div> <%--결재완료버튼--%>
            </div>

        </form>
    </div>
</div>