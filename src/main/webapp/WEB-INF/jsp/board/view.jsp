<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<c:set var="newChar" value="
" scope="application"/>

<c:set var="atticon1" value="${bd.ftype1}" />
<c:if test="${bd.ftype1 ne 'zip' and bd.ftype1 ne 'jpg' and bd.ftype1 ne 'txt' }">
    <c:set var="atticon1" value="file" />
</c:if>

<c:set var="atticon2" value="${bd.ftype2}" />
<c:if test="${bd.ftype2 ne 'zip' and bd.ftype2 ne 'jpg' and bd.ftype2 ne 'txt' }">
    <c:set var="atticon2" value="file" />
</c:if>

<c:set var="atticon3" value="${bd.ftype3}" />
<c:if test="${bd.ftype3 ne 'zip' and bd.ftype3 ne 'jpg' and bd.ftype3 ne 'txt' }">
    <c:set var="atticon3" value="file" />
</c:if>

<div id = "main" class="container">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i>게시판</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-6 ">
            <button type="button" id="Boardprevbtn" class="btn btn-light">
                <i class="bi bi-chevron-left bidragup"></i>이전게시물</button>

            <button type="button" id="Boardnextbtn" class="btn btn-light">
                <i class="bi bi-chevron-right bidragup"></i>다음게시물</button>
        </div>
        <div class="col-6 text-right">
                <button type="button" id="newbd" class="btn btn-light">
                    <i class="bi bi-plus-circle-fill bidragup"></i>&nbsp;새글쓰기</button>
        </div>
    </div><!--버튼들-->

    <div class="row margin1050">
        <table class="table">
            <tr><th colspan="2" class="tblines2 tbbg4" >
                <h2><strong>Title&nbsp;:&nbsp;${bd.title}</strong></h2></th></tr><!--제목-->
            <tr class=" font-weight-bold tbbg4">
                <td><i class="bi bi-person"></i> : ${bd.userid}</td>
                <td class="text-right"><i class="bi bi-calendar"></i> :${bd.regdate}
                    | <i class="bi bi-hand-thumbs-up-fill"></i> : <span id="thumbs">${bd.thumbs}</span>
                    | <i class="bi bi-eye"></i> : ${bd.views}</td>
            </tr>
            <tr><td colspan="2" class=" tblines2">
                ${fn:replace(bd.contents, newChar, "<br>")}
            </td></tr><!--본문-->
            <tr><td class="text-left">첨부1</td><!--첨부파일-->
                <td><img src="/img/board/${atticon1}.png">
                    <a href="/board/down?bno=${bd.bno}&order=1">
                        ${bd.fname1}</a>(${bd.fsize1}KB, ${bd.fdown1}회 다운로드함)</td></tr>

            <c:if test="${not empty bd.fname2 ne '-'}">
                <tr><td class="text-left">첨부2</td>
                    <td><img src="/img/board/${atticon2}.png">
                        <a href="/board/down?bno=${bd.bno}&order=2">
                                ${bd.fname2}</a>(${bd.fsize2}KB, ${bd.fdown2}회 다운로드함)</td></tr>
            </c:if>
            <c:if test="${not empty bd.fname3 ne '-'}">
                <tr><td class="text-left">첨부3</td>
                    <td><img src="/img/board/${atticon3}.png">
                        <a href="/board/down?bno=${bd.bno}&order=3">
                                ${bd.fname3}</a>(${bd.fsize3}KB, ${bd.fdown3}회 다운로드함)</td></tr>
            </c:if><!--첨부파일-->
        </table>
    </div><!--본문글-->

    <div class="row margin1050">
        <div class="col-6 ">
            <!--로그인 했고, 이 글이 내가 작성한 글이라면 버튼들이 보임-->
<%--            <c:if test="${not empty UID and UID eq bd.userid}"><!--empty가 비어있지 않고 UID가 bd.userid와 같을 때-->--%>
                <button type="button" id="upbdbtn" class="btn btn-warning">
                    <i class="bi bi-pencil-square bidragup"></i>수정하기</button>

                <button type="button" id="rmbdbtn" class="btn btn-danger">
                    <i class="bi bi-trash-fill bidragup"></i>삭제하기</button>
<%--            </c:if>--%>
        </div>
        <div class="col-6 text-right">
<%--            <c:if test="${not empty UID }">--%>
            <input type="hidden" id="thumbBoard" name="thumbBoard" value="no">
            <button type="button" id="thumbbtn" class="btn btn-success">
                <i class="bi bi-hand-thumbs-up bidragup"></i>추천하기
            </button>
<%--            </c:if>--%>

            <button type="button" id="listbdbtn" class="btn btn-dark">
                <i class="bi bi-card-list bidragup"></i>&nbsp;목록으로</button>
        </div>
    </div><!--버튼들-->

    <input type="hidden" id="bno" value="${param.bno}">
    <input type="hidden" id="cp" value="${param.cp}">
    <input type="hidden" id="userid" value="${bd.userid}">

    <div class="row margin1050" style="margin-top: 100px;">
        <h3><i class="bi bi-chat-square-dots-fill bidragup"></i>나도 한마디</h3>
        <table class="table tblines tbwide">
            <c:forEach var="r" items="${rp}">
            <c:if test="${r.cno eq r.rno}">
                <tr><td><h4>${r.userid}</h4></td>
                    <td>
                        <div class="cmtbg1">${r.regdate}</div>
                        <span style="float:right">
<%--                            <c:if test="${not empty UID}">--%>
                                <a href="javascript:addReply('${r.rno}')">[추가]</a>
<%--                            </c:if>--%>
<%--                            <c:if test="${UID eq r.userid}">--%>
                                <a href="javascript:modiReplyForBoard('${r.rno}','${r.reply}')">[수정]</a>
                                <a href="javascript:delReplyForBoard('${r.rno}')">[삭제]</a>
<%--                            </c:if>--%>
                        </span>
                        <p>${r.reply}</p>
                    </td>
                </tr><!--원댓글-->
            </c:if>
            <c:if test="${r.cno ne r.rno}">
                <tr>
                    <td class="text-right"><i class="bi bi-arrow-return-right"></i></td>
                    <td>
                        <ul class="list-unstyled">
                            <li>
                                <div class="cmtbg2">
                                    <h4 style="display: inline-block">${r.userid}</h4>
                                    <span class="pushright">${r.regdate}</span>
                                </div>
                                <p>${r.reply}</p>
                            </li>
                        </ul>
                    </td>
                </tr><!--대댓글-->
            </c:if>
           </c:forEach>
        </table>
    </div><!--댓글들-->

<%--    <c:if test="${not empty UID}">--%>
    <div class="row margin1050">
        <form id="replyfrm" class="card card-body bg-light ">
            <div class="form-group row justify-content-center">
                <label class="pushtop50 text-primary font-weight-bold" >${UID}</label>&nbsp;
                <textarea id="reply" name="reply" row="5" class="form-control col-7" style="resize: none"></textarea>&nbsp;
                <span><button type="button" id="bdcmtbtn" class="btn btn-dark pushtop50">
                        <i class="bi bi-chat-text-fill bidragup"></i> 댓글쓰기</button></span>
            </div>
            <input type="hidden" name="bno" value="${param.bno}">
            <input type="hidden" name="userid" id="uid" value="${UID}">
        </form>
    </div><!--댓글폼-->
<%--    </c:if>--%>
</div>

<!--대댓글 작성을 위한 모달 대화 상자-->
<div class="modal hide" id="replyModal" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header"><h3 class="modal-title ">대댓글 쓰기</h3></div>
            <div class="modal-body">
                <form name="rpfrm" id="rpfrm" class="well form-inline">
                    <textarea name="reply" id="rereply" rows="8" cols="75" class="span4"></textarea>
                    <input type="hidden" name="userid" value="testRRid"<%--${UID}--%>>
                    <input type="hidden" name="bno" value="${param.bno}">
                    <input type="hidden" name="cno" id="cno">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="rpbtn" class="btn btn-warning">대댓글 작성</button>
            </div>
        </div>
    </div>
</div>

<!--댓글 수정을 위한 모달 대화 상자-->
<div class="modal hide" id="replyModify" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header"><h3 class="modal-title">댓글수정</h3></div>
            <div class="modal-body">
                <form name="mmrpfrm" id="mmrpfrm" class="well form-inline">
                    <textarea name="reply" id="modiReplyForBoard" rows="8" cols="75" class="span4"></textarea>
                    <input type="hidden" name="userid" value="testRRid"<%--${UID}--%>>
                    <input type="hidden" name="bno" value="${param.bno}">
                    <input type="hidden" name="cno" id="modifyreplycno">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="modifyokbtn" class="btn btn-warning">댓글 수정</button>
                <button type="button" id="modifycencelbtn" class="btn btn-secondary">취소</button>
            </div>
        </div>
    </div>
</div>

<!--댓글 삭제을 위한 모달 대화 상자-->
<div class="modal hide" id="replyDelete" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header"><h3 class="modal-title">삭제한 댓글은 복구할 수 없습니다 <br />댓글을 정말 삭제하시겠습니까?</h3></div>
                <form name="dmrpfrm" id="dmrpfrm" class="well form-inline">
                    <input type="hidden" name="userid" value="testRRid"<%--${UID}--%>>
                    <input type="hidden" name="bno" value="${param.bno}">
                    <input type="hidden" name="cno" id="deletereplycno">
                </form>
            <div class="modal-footer">
                <button type="button" id="deleteokbtn" class="btn btn-warning">댓글 삭제</button>
                <button type="button" id="deletecencelbtn" class="btn btn-secondary">취소</button>
            </div>
        </div>
    </div>
</div>