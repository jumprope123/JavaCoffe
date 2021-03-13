<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/eshop/_thumb/small_글번호_파일명 --%>
<%--<c:set var="baseImgURL" value="http://localhost/eshop"/>--%>
<c:set var="baseImgURL" value="http://13.125.205.40:8447/eshop" />
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

<c:if test="${empty UID}">
    <script>
        alert('로그인 페이지로 이동합니다.');
        location.href="/login/login";
    </script>
</c:if>

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
                            <input type="hidden" name="fnames" value="${evo.fnames}">
                            <input type="hidden" name="eno" value="${evo.eno}">
                        </div> <%--사진--%>
                        <div class="col-9 font-weight-bold text-center">${evo.title}</div>
                        <input type="hidden" name="title" value="${evo.title}"><%--상품정보--%>
                    </div>
                </div>
                <div class="col-2 text-center">${evo.brand}</div>
                <input type="hidden" name="brand" value="${evo.brand}">
                <div class="col-1 text-center">${evo.shipPay}원</div>
                <input type="hidden" name="shipPay" value="${evo.shipPay}">
                <div class="col-1 text-center">${salesCnt}개</div>
                <input type="hidden" name="purchase" value="${salesCnt}">
                <div class="col-1 text-center">(-) ${(evo.ogprice * salesCnt) - (evo.dcprice * salesCnt)}원</div>
                <input type="hidden" name="discount" value="${(evo.ogprice * salesCnt) - (evo.dcprice * salesCnt)}">
                <div class="col-2">
                    <div class="row">
                        <div class="col-12 text-center" style="color: RGB(193,163,151);text-decoration-line: line-through; font-size: 0.8em;">${evo.ogprice * salesCnt}원</div> <%--할인전가격--%>
                        <input type="hidden" name="TotalOgprice" value="${evo.ogprice * salesCnt}">
                        <div class="col-12 text-center">${evo.dcprice * salesCnt}원</div> <%--할인후가격--%>
                        <input type="hidden" name="totalDcprice" value="${evo.dcprice * salesCnt}">
                    </div>
                </div>
            </div>
            <div class="row mt-3"><div class="col-12" style="border-bottom: 1px dotted green;"></div></div>
            <div class="row mt-5">
                <div class="col-9">
                    <div class="row">
                        <div class="col-2 text-left font-weight-bold h5">배송지정보</div>
                        <div class="col-8 text-left">- 기본배송지는 회원가입시 입력하신 주소입니다. 변경을 원할시 우편번호찾기 버튼을 눌러주세요.</div>
                    </div>
                    <div class="form-group row mt-3">
                        <div class="col-11 offset-1">
                            <div class="row">
                                <label class="col-2 col-form-label text-left">우편번호</label>
                                <input type="text" id="sample6_postcode" class="form-control col-2" name="deliveryZipcode" placeholder="우편번호" value="${mvo.zipcode}" readonly >
                                <input type="button" class="btn btn-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                            </div>
                            <div class="row">
                                <label class="col-2 col-form-label text-right"></label>
                                <input type="text" class="input_text zipsize col-4 form-control" name="deliveryUserAddr1" style="height: 2.5rem;" id="sample6_address" placeholder="주소" value="${mvo.userAddr1}" readonly><br>
                                <input type="text" class="input_text zipsize col-3 form-control" name="deliveryUserAddr2" id="sample6_detailAddress"  value="${mvo.userAddr2}" placeholder="상세주소">
                                <input type="text" class="input_text zipsize col-3 form-control" name="deliveryUserAddr3" id="sample6_extraAddress"  value="${mvo.userAddr3}" placeholder="추가주소">
                            </div>
                        </div>
                    </div>
                </div> <%--배송지정보--%>
                <div class="col-3"></div> <%--결재완료버튼--%>
            </div>
            <div class="row mt-3"><div class="col-12" style="border-bottom: 1px solid RGB(246,246,246);"></div></div>
            <div class="row mt-3">
                <div class="col-9">
                    <div class="row">
                        <div class="col-2 text-left font-weight-bold h5">주문인정보</div>
                        <div class="col-10 text-left">- 주문인 정보는 수정할 수 없습니다.</div>
                    </div>
                    <input type="hidden" name="userid" value="${UID}">
                    <div class="row mt-3">
                        <div class="col-2 offset-1">이름</div>
                        <input class="form-control col-5" name="orderUsername" value="${mvo.name}" readonly>
                    </div>
                    <div class="row">
                        <div class="col-2 offset-1">전화번호</div>
                        <input class="form-control col-5" name="orderUserphone" value="${mvo.phone}" readonly>
                    </div>
                    <div class="row">
                        <div class="col-2 offset-1">메일주소</div>
                        <input class="form-control col-5" name="orderUseremail" value="${mvo.email}" readonly>
                    </div>
                    <div class="row">
                        <div class="col-2 offset-1">요청사항</div>
                        <input type="text" class="form-control col-8" name="orderRequest" placeholder="20자이내로 간단하게 작성하세요.">
                    </div>
                </div>
            </div>
            <div class="row mt-3"><div class="col-12" style="border-bottom: 1px solid RGB(246,246,246);"></div></div>
            <div class="row mt-3">
                <div class="col-9">
                    <div class="row">
                        <div class="col-2 text-left font-weight-bold h5">받으시는 분</div>
                        <div class="col-10 text-left">- 기본 정보는 주문인과 동일합니다. 주문인과 수취인이 다를경우만 수정하세요.</div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-2 offset-1">이름</div>
                        <input class="form-control col-5" name="receiveName" value="${mvo.name}">
                    </div>
                    <div class="row">
                        <div class="col-2 offset-1">전화번호</div>
                        <input class="form-control col-5" name="receivePhone" value="${mvo.phone}">
                    </div>
                    <div class="row">
                        <div class="col-2 offset-1">메일주소</div>
                        <input class="form-control col-5" name="receiveEmail" value="${mvo.email}">
                    </div>
                </div>
            </div>
            <div class="row mt-3"><div class="col-12" style="border-bottom: 1px solid RGB(246,246,246);"></div></div>
            <div class="row mt-3">
                <div class="col-9">
                    <div class="row font-weight-bold h5">할인 및 포인트</div>
                    <div class="row text-success">자바커피 포인트 결제</div>
                    <div class="row mt-4 align-items-center">
                        <div class="col-2 offset-1">보유</div>
                        <div class="col-3 text-right" style="border-bottom: 1px solid RGB(229,229,229)">${mvo.points}원</div>
                        <input type="hidden" id="buyPagePoints" name="beforePoint" value="${mvo.points}">
                    </div>
                    <div class="row mt-2 align-items-center">
                        <div class="col-2 offset-1">사용</div>
                        <input type="number" class="col-3 form-control" id="buyPageUsePoints" name="buyPageUsePoints" value="0">
                    </div>
                    <div class="row mt-2 align-items-center">
                        <div class="col-2 offset-1">적립</div>
                        <div class="col-3 text-right" style="border-bottom: 1px solid RGB(229,229,229)"><span id="forPlusPoint"><fmt:parseNumber value="${(evo.dcprice * salesCnt)/10}" integerOnly="true" /></span>원</div>
                        <div class="col-6 text-danger">총 상품금액의 10%가 포인트로 적립됩니다.</div>
                        <input type="hidden" name="plusPoint" id="plusPoint" >
                    </div>
                </div>
            </div>


            <div class="row mt-5"><div class="col-12" style="border-bottom: 1px solid grey;"></div></div>
            <div class="row mt-3">
                <div class="col-4 offset-4 text-center">총 상품금액 : ${evo.dcprice * salesCnt}원</div>
                <div class="col-4 offset-4 text-center">배송비 : (+)${evo.shipPay}원</div>
                <div class="col-4 offset-4 text-center">포인트 : (-)<span id="finalUsingPoint">0</span>원</div>
                <input type="hidden" id="beforeFinalPrice" value="${(evo.dcprice * salesCnt) + evo.shipPay}">
                <div class="col-12 h4 text-center">총 결제금액 : <span class="text-danger h1"><span id="finalPrice">${(evo.dcprice * salesCnt) + evo.shipPay}</span>원</span></div>
                <input type="hidden" id="afterFinalPrice" name="afterFinalPrice" value="${(evo.dcprice * salesCnt) + evo.shipPay}">
            </div>
            <div class="row mt-3 mb-3">
                <div class="col-12 text-center">
                    <button type="button" id="buylistOkBtn" class="btn-lg btn-success">결제하기</button>
                    <button type="button" id="buylistcancelBtn" class="btn-lg btn-danger">취소하기</button>
                </div>
            </div>
        </form>
    </div>
</div>