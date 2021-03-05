<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="main">
    <div class="row">
        <div class="col-10 offset-1">
            <div class="row">
                <div class="col-6 text-center">상품정보</div>
                <div class="col-1 text-center">브랜드</div>
                <div class="col-1 text-center">배송비</div>
                <div class="col-1 text-center">주문수량</div>
                <div class="col-1 text-center">할인액</div>
                <div class="col-2 text-center">상품금액(할인포함)</div>
            </div> <%--최상단 글정보--%>
            <div class="row">
                <div class="col-6 text-center">
                    <div class="row">
                        <div class="col-3"></div> <%--사진--%>
                        <div class="col-9"></div> <%--상품정보--%>
                    </div>
                </div>
                <div class="col-1 text-center">네스프레소</div>
                <div class="col-1 text-center">5000원</div>
                <div class="col-1 text-center">1개</div>
                <div class="col-1 text-center">(-) 5,500원</div>
                <div class="col-2">
                    <div class="row">
                        <div class="col-12 text-center">17000원</div> <%--할인전가격--%>
                        <div class="col-12 text-center">13700원</div> <%--할인후가격--%>
                    </div>
                </div>
            </div> <%--실제 상품정보 for each문 쓸것임--%>

        </div>
    </div>
</div>