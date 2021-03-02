<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="newChar" value="
" scope="application"/> <%-- value값에 엔터를 넣음 --%>


<c:set var="baseImgURL" value="http://localhost/cdn/"/>
<%--<c:set var="baseImgURL" value="http://13.125.205.40:8447/cdn/" />--%>


<div id="main"  class="container">
    <div class="margin30">
        <h3><i class="bi bi-cup-fill bidragup"></i>&nbsp;상품 후기</h3>
        <hr style="border-bottom: 1px solid white">
    </div>
    <div class="row margin1050">
        <div class="col-6">
            <button type="button" class="btn btn-light" id="prevbtn">
                <i class="bi bi-chevron-left bidragup"></i> 이전게시물</button>
            <button type="button" class="btn btn-light" id="nextbtn">
                다음게시물 <i class="bi bi-chevron-right bidragup"></i></button>
        </div>
        <div class="col-6 text-right">
                <button type="button" class="btn btn-light" id="newReview">
                    <i class="bi bi-plus-circle-fill bidragup"></i>새글쓰기</button>
        </div>
    </div><!-- 버튼틀 -->

    <div class="row margin1050">
        <table class="table">
            <tr><th colspan="2" class="tblines2 text-center bg-light"><h2>${review.title}</h2></th></tr>
            <tr class="tbbg1 font-weight-bold"><td><i class="bi bi-person"></i> : ${review.userid}</td><td class="text-right"><i class="bi bi-calendar-plus"></i> : ${fn:substring(review.regdate,0,19)} / <i class="bi bi-hand-thumbs-up"></i> : <span id="thumbs">${review.thumbs}</span> / <i class="bi bi-eye"></i> : ${review.views}</td></tr>
            <tr>
                <th colspan="2" class="tbbg1 tblines2">
                    <c:forEach begin="0" end="4" var="i" step="1">
                        <c:if test="${fn:split(review.fnames, '[/]')[i] ne '-'}">
                            <img src="${baseImgURL}${fn:split(review.fnames, "[/]")[i]}" width="100%">
                        </c:if>
                    </c:forEach>

                    <p>${fn:replace(review.contents, newChar, '<br>')}</p>
                </th>
            </tr> <!--본문-->

            <c:forEach begin="0" end="4" var="i" step="1">
                <c:if test="${fn:split(review.fnames,'[/]')[i] ne '-'}">
                    <tr class="bg-light"><td class="text-left">첨부${i+1}</td><td> ${fn:split(review.fnames,"[/]")[i]}</a>  (${fn:split(review.fsizes,"[/]")[i]}KB)</td></tr>
                </c:if>
            </c:forEach>

        </table>
    </div> <!--본문글-->
    <div class="row margin1050">
        <div class="col-6">
            <%--로그인 했고 이 글이 내가 작성한 글이라면?--%>
<%--            <c:if test="${not empty UID and UID eq review.userid}">--%>
                <button type="button" class="btn btn-primary" id="upReviewBtn">
                    <i class="bi bi-check-circle bidragup"></i> 수정하기</button>
                <button type="button" class="btn btn-danger" id="rmReviewBtn">
                    <i class="bi bi-x-circle bidragup"></i> 삭제하기</button>
<%--            </c:if>--%>
        </div>
        <div class="col-6 text-right">
<%--            <c:if test="${not empty UID}">--%>
                <input type="hidden" id="thumb" name="thumb" value="no">
                <button type="button" id="thumbBtn" class="btn btn-success">
                    <i class="bi bi-hand-thumbs-up bidragup"></i>추천하기
                </button>
<%--            </c:if>--%>
            <button type="button" class="btn btn-dark" id="listReviewBtn">
                <i class="bi bi-list bidragup"></i> 목록으로</button>
        </div>
    </div><!--버튼들-->

    <form id="hiddenform">
        <input type="hidden" name="rno" id="rno" value="${param.rno}">
    <%--    <input type="hidden" id="cp" value="${param.cp}">--%>
        <input type="hidden" id="userid" value="${review.userid}">
    </form>
    <div class="row margin1050 mt-5">
        <h3><i class="bi bi-chat-square-dots-fill"></i>&nbsp;댓글 남기기</h3>
    </div>
    <input type="hidden" id="reviewCnt" value="${reviewCnt}">
    <div class="row margin1050">
        <table class="table tblines">
            <c:forEach var="r" items="${rp}">
                <c:if test="${r.replyNo eq r.commentNo}">
                    <tbody>
                        <tr>
                            <td style="vertical-align: middle"><h4 style="min-width: 8em">${r.userid}</h4></td>
                            <td>
                                <div>
                                    <div style="display: inline-block" class="text-left">${fn:substring(r.regdate,0,19)}</div>
                                    <div style="float: right">
                                    <a href="javascript:addReply('${r.replyNo}')">[추가]</a>
                                    <a href="javascript:modiReply('${r.replyNo}','${r.reply}')">[수정]</a>
                                    <a href="javascript:delReply('${r.replyNo}')">[삭제]</a></div> <%--대댓글이 있는 리플은 삭제못하게 하고싶은데 어떻게?--%>
                                </div>
                                <p class="mt-1">${fn:replace(r.reply,newChar,'<br>')}</p>
                            </td>
                        </tr>
                    </tbody>
                </c:if> <%--여기까지 댓글 기능 구현--%>
                <c:if test="${r.replyNo ne r.commentNo}">
                    <tr>
                        <td class="text-right"><i class="bi bi-arrow-return-right"></i></td>
                        <td>
                            <ul class="list-unstyled">
                                <li>
                                    <h3 style="display: inline-block">${r.userid}</h3>
                                    <div style="float: right">${fn:substring(r.regdate,0,19)}</div>
                                </li>
                                <li><p>${fn:replace(r.reply,newChar,'<br>')}</p></li>
                            </ul>
                        </td>
                    </tr>
                </c:if> <%--여기까지 대댓글 기능 구현--%>
            </c:forEach>
        </table>
    </div>
        <div class="row margin1050">
            <form id="replyfrm" class="card card-body bg-light">
                <div class="form-group row justify-content-center">
                    <label class="pushtop50 text-primary font-weight-bold">${UID}</label>&nbsp;
                    <textarea id="reply" name="reply" rows="5" class="form-control col-7" style="resize: none"></textarea>&nbsp;&nbsp;
                    <span><button type="button" id="reviewcmtbtn" class="btn-dark pushtop50"><i class="bi bi-chat-text-fill bidragup"></i>댓글쓰기</button></span>
                </div>
                <input type="hidden" name="reviewNo" value="${param.rno}">
                <input type="hidden" name="userid" id="uid" value="${UID}">
            </form>
        </div><!--댓글폼-->

</div>


<!-- 대댓글 작성을 위한 모달대화상자 -->
<div class="modal hide" id="replyModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">대댓글 쓰기</h3>
            </div>
            <div class="modal-body">
                <form name="rpfrm" id="rpfrm" class="well form-inline">
                    <textarea name="reply" id="rereply" rows="8" cols="75" class="span4"></textarea>
                    <input type="hidden" name="userid" value="testReReplyId<%--${UID}--%>">
                    <input type="hidden" name="reviewNo" value="${param.rno}">
                    <input type="hidden" name="commentNo" id="commentNo">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="rpbtn" class="btn btn-warning">대댓글 작성</button>
                <button type="button" id="rpcencelbtn" class="btn btn-secondary">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- 댓글 수정을 위한 모달대화상자 -->
<div class="modal hide" id="replyModifyModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">댓글 수정</h3>
            </div>
            <div class="modal-body">
                <form name="rpmdfrm" id="rpmdfrm" class="well form-inline">
                    <textarea name="reply" id="modireply" rows="8" cols="75" class="span4"></textarea>
                    <input type="hidden" name="userid" value="testReReplyId<%--${UID}--%>">
                    <input type="hidden" name="reviewNo" value="${param.rno}">
                    <input type="hidden" name="replyNo" id="modireplyNo">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="modirpbtn" class="btn btn-warning">댓글 수정</button>
                <button type="button" id="modcencelirpbtn" class="btn btn-secondary">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- 댓글 삭제 post통신을 위한 모달대화상자 -->
<div class="modal hide" id="replydeleteModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h5 class="modal-title text-center">댓글을 삭제하시겠습니까?</h5>
                <form name="rpdelfrm" id="rpdelfrm" class="well form-inline">
                    <input type="hidden" name="userid" value="testReReplyId<%--${UID}--%>">
                    <input type="hidden" name="replyNo" id="delreplyNo">
                    <input type="hidden" name="reviewNo" value="${param.rno}">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="delrpbtn" class="btn btn-danger">삭제</button>
                <button type="button" id="delcencelrpbtn" class="btn btn-secondary">취소</button>
            </div>
        </div>
    </div>
</div>