<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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


<div id="main" class="container singleDay">
    <form id="Adminfrm" class="margin30">
        <div class="margin1050">
            <div class="row">
                <div class="offset-2 col-6 text-center">
                    <span class="text-danger h2 font-weight-bold">상품등록(관리자전용)</span>
                </div>
                <div class="col-4"></div> <%--칸맞춤용div--%>
            </div>
            <div class="row">
                <div class="offset-2 col-6 text-center">
                    <span class="text-success">등록하신 상품은 대/소분류에 맞게 자동으로 분류되어 등록됩니다.</span>
                </div>
                <div class="col-4"></div> <%--칸맞춤용div--%>
            </div>
            <div class="form-group row mt-5">
                <label for="title" class="col-form-label col-2 text-right font-weight-bold h5">제품명</label>
                <input type="text" id="title" name="title" class="form-control col-6">
                <label for="title" class="col-form-label col-4 text-center text-danger">등록하실 제품명을 입력하세요.</label>
            </div>
            <div class="form-group row">
                <label for="title" class="col-form-label col-2 text-right font-weight-bold h5">브랜드</label>
                <input type="text" id="brand" name="brand" class="form-control col-6">
                <label for="brand" class="col-form-label col-4 text-center text-danger"><strong style="text-decoration-line: underline">'대괄호[]'</strong>를 제외한 브랜드명을 입력하세요.</label>
            </div>
            <div class="form-group row">
                <label for="ogprice" class="col-form-label col-2 text-right font-weight-bold h5">할인전 가격<span class="text-warning">(fake)</span></label>
                <input type="number" id="ogprice" name="ogprice" class="form-control col-6">
                <label for="ogprice" class="col-form-label col-4 text-center text-danger">상품의 할인 전 가격을 입력하세요. ex) <span style="text-decoration-line: line-through; color: gray">4,000원</span></label>
            </div>
            <div class="form-group row">
                <label for="dcprice" class="col-form-label col-2 text-right font-weight-bold h5">할인후 가격<span class="text-warning">(real)</span></label>
                <input type="number" id="dcprice" name="dcprice" class="form-control col-6">
                <label for="dcprice" class="col-form-label col-4 text-center text-danger">실제 판매하실 가격을 입력하세요.</label>
            </div>
            <div class="form-group row">
                <label for="bigGenre" class="col-form-label col-2 text-right font-weight-bold h5">대분류</label>
                <select class="form-control col-6 singleDay" id="bigGenre" name="bigGenre">
                    <option selected value="coffe">원두|커피믹스|스틱</option><option value="tea">차류[티백/아이스티]</option><option value="syrup">시럽|소스|파우더</option>
                    <option value="vending">자판기|제빙기</option><option value="takeoutcup">테이크아웃컵|페트컵</option><option value="drink">음료수[캔/페트/병]</option>
                    <option value="disposable">종이컵|일회용품</option><option value="food1">볶음밥|만두|핫바</option><option value="food2">돈까스|감튀|어묵</option>
                </select>
                <label for="bigGenre" class="col-form-label col-4 text-center text-danger">대분류를 선택하세요.</label>
            </div>
            <div class="form-group row">
                <label for="smallGenre" class="col-form-label col-2 text-right font-weight-bold h5">소분류</label>
                <select class="form-control col-6 singleDay" id="smallGenre" name="smallGenre">
                    <option selected value="bean">원두</option><option value="coffemix">커피믹스</option><option value="coffestick">스틱</option>
                </select>
                <label for="bigGenre" class="col-form-label col-4 text-center text-danger">소분류를 선택하세요.</label>
            </div>
            <div class="form-group row">
                <label for="code" class="col-form-label col-2 text-right font-weight-bold h5">상품코드<span class="text-warning"></span></label>
                <input type="text" id="code" name="code" class="form-control col-6">
                <label for="code" class="col-form-label col-4 text-center text-danger">상품코드를 입력하세요.</label>
            </div>
            <div class="form-group row">
                <label for="simpleExplain" class="col-form-label col-2 text-right font-weight-bold h5">간단설명<span class="text-warning"></span></label>
                <textarea class="form-control text-area col-6" id="simpleExplain" name="simpleExplain" rows="4" style="resize: none" ></textarea>
                <label for="simpleExplain" class="col-form-label col-4 text-center text-danger">상품에 대한 간략한 설명을 입력하세요.</label>
            </div>
            <div class="form-group row">
                <label for="shippay" class="col-form-label col-2 text-right font-weight-bold h5">배송비용<span class="text-warning"></span></label>
                <select class="form-control col-6 singleDay" id="shipPay" name="shipPay">
                    <option selected value="0">무료배송</option><option value="1500">1,500원</option><option value="2500">2,500원</option>
                    <option value="3000">3,000원</option><option value="4000">4,000원</option><option value="5000">5,000원</option>
                </select>
                <label for="shippay" class="col-form-label col-4 text-center text-danger">상품의 배송비용을 입력하세요.</label>
            </div>
            <div class="form-group row">
                <label for="stuck" class="col-form-label col-2 text-right font-weight-bold h5">재고<span class="text-warning"></span></label>
                <input type="number" id="stuck" name="stuck" class="form-control col-6">
                <label for="stuck" class="col-form-label col-4 text-center text-danger">재고수량을 입력하세요.</label>
            </div>
            <div class="form-group row">
                <label for="img" class="col-form-label col-2 text-right font-weight-bold h5">이미지 업로드<span class="text-warning"></span></label>
                <div class="custom-file col-6">
                    <input type="file" id="img" name="img" class="custom-file-input">
                    <label id="imgLable" class="custom-file-label">업로드할 이미지파일을 선택하세요</label>
                </div>
                <label for="img" class="col-form-label col-4 text-center text-danger">대표이미지 1개만 업로드가능합니다.</label>
            </div>
        </div>
        <div class="row">
            <div class="col-6 offset-2 text-center">
                <button id="AdmininputOKBtn" class="btn btn-success mr-1 singleDay">입력완료</button>
                <button id="AdminInputCancelBtn" class="btn btn-danger ml-1 singleDay">취소하기</button>
            </div>
            <div class="col-4"></div> <%--칸맞춤용div--%>
        </div>
    </form>
</div>
