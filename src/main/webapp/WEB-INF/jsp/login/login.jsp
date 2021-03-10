<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
   .center_login1 {
        margin: 0 auto;
    }
    .center_login2 {
        margin-top: 9%;
        margin-left: 43%;
    }
    .total_size_login {
        width: 20rem;
        height: 22rem;
    }

    .login_icon {
        position: relative;
        right: 5px;
        bottom: 2px;
    }

    .login_button {
        position:relative;
        left: 2.85rem;
        bottom: 3px;
    }

    .p_login_font {
        margin-bottom: 5px;
        font-size: 16px;
        font-weight: bold;
    }

    .input_login_bar {
        width: 13rem;
        height: 2rem;
        border: 2px solid #5a6268;
        border-radius: 3px;
    }
    .kakao_login_btn_position{
        position: relative;
        right: 16px;

    }
</style>
<div id="main margin30 container">
    <div class="margin30 container center_login1 center_login2 total_size_login ">
        <form onsubmit="submitLoginForm(this); return false;"
                action="/login/login" method="post">
            <p class="p_login_font"><i class="bi bi-person-square login_icon"></i>로그인 페이지</p>
            <div class="form-group row">
                <label for="userid"></label>
                <input type="text" name="userid" id="userID" class="input_login_bar" placeholder="아이디" style="margin-top: 5px;">
            </div>
            <div class="form-group row">
                <%--@declare id="passwd"--%><label for="passwd"></label>
                <input type="password" name="passwd" id="userPW" class="input_login_bar" placeholder="비밀번호">
            </div>
            <div class="form-group">
                <div class="form-group row">
                    <label>
                    <input type="checkbox" style="position: relative; top: 1px;">&nbsp;로그인유지
                        <input type="submit" class="btn btn-primary login_button" value="로그인"/>
                    </label>
                </div>
            </div>
            <div class="form-group row">
                <a href="#" style="border-right: 1px solid #000000; padding-right: 5px;">비밀번호 찾기</a>
                <a href="/join/agree" class="text-center" style="margin-left: 5px">회원가입</a>
            </div>
        </form>

        <%--===========================여기서 부터--%>
        <div>
            <p id="joinorbindP">${joinorbind}</p>
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=9c38cdfacc89f99ac0fe0615bba90cd9&redirect_uri=http://localhost:8080/auth/kakao/callback&response_type=code" class="kakao_login_btn_position"><img
                    src="/img/login/kakao_login_btn_img.png" onclick="linkUser()" width="208px;"></a>
        </div>
        <div>
            <a href="/auth/kakao/unlink">카카오 앱 연결 해제</a>
        </div>
        <%-- 카카오 구현 중==============================--%>
    </div>
</div>
<script>
   function submitLoginForm(form) {
       form.userID.value = form.userID.value.trim();
       if (form.userID.value.length == 0) {
           alert('아이디를 입력해주세요.');
           form.userID.focus();
           return false;
       }

       form.userPW.value = form.userPW.value.trim();
       if (form.userPW.value.length == 0) {
           alert('비밀번호를 입력해주세요.');
           form.userPW.focus();
           return false;
       }
       form.submit();
   }

   //=============================================================
   function linkUser(session, provider, authData) {
       let result = false;
       if (session.authData) {
           if (session.authData[provider]) {
               // 이미 계정에 provider 가 연결되어 있는 경우
               return result;
           }

           session.authData[provider] = authData;
       } else {
           session.authData = {
               [provider]: authData
           };
       }

       result = true;

       return result;
   }

   /**
    *
    * @summary '사용자 서비스 동의' 완료 후, 이동되는 주소.
    *
    * @description
    * - 사용자로부터 동의를 구한 후, 서비스 내에서 처리할 로직을 구현합니다.
    */

   // http://localhost:8888/auth/kakao/callback
   router.get("/callback", async (req, res) => {
       const { session, query } = req;
       const { code } = query;

       console.info("==== session ====");
       console.log(session);

       let tokenResponse;
       try {
           // Authorization Server 부터 Access token 발급받기
           tokenResponse = await axios({
               method: "POST",
               url: 'https://kauth.kakao.com/oauth/token',
               headers: {
                   "content-type": "application/x-www-form-urlencoded"
               },
               data: qs.stringify({
                   grant_type: "authorization_code",
                   client_id: "9c38cdfacc89f99ac0fe0615bba90cd9",
                   redirect_uri:  "http://localhost:8080/auth/kakao/callback",
               })
           });
       } catch (error) {
           return res.json(error.data);
       }

       console.info("==== tokenResponse.data ====");
       console.log(tokenResponse.data);

       const { access_token } = tokenResponse.data;

       let userResponse;
       try {
           // access_token 으로 사용자 정보 요청하기
           userResponse = await axios({
               method: "GET",
               url: "https://kapi.kakao.com/v2/user/me",
               headers: {
                   Authorization: `Bearer ${access_token}`
               }
           });
       } catch (error) {
           return res.json(error.data);
       }

       console.info("==== userResponse.data ====");
       console.log(userResponse.data);

       const authData = {
           ...tokenResponse.data,
           ...userResponse.data
       };

       const result = linkUser(session, "kakao", authData);

       if (result) {
           console.info("계정에 연결되었습니다.");
       } else {
           console.warn("이미 연결된 계정입니다.");
       }

       res.redirect("/");
   });

   //=======================================================
   function unlinkUser(session, provider, userId) {
       let result = false;

       if (
           session.authData &&
           session.authData[provider] &&
           session.authData[provider].id === userId
       ) {
           delete session.authData[provider];
           result = true;
       }
       return result;
   }

   /**
    * @summary 사용자 앱 연결 해제 링크
    */

   // http://localhost:8888/auth/kakao/unlink
   router.get("/unlink", async (req, res) => {
       const { session } = req;

       const { access_token } = session.authData.kakao;

       let unlinkResponse;
       try {
           unlinkResponse = await axios({
               method: "POST",
               url: "https://kapi.kakao.com/v1/user/unlink",
               headers: {
                   Authorization: `Bearer ${access_token}`
               }
           });
       } catch (error) {
           return res.json(error.data);
       }

       console.log("==== unlinkResponse.data ====");
       console.log(unlinkResponse.data);

       const { id } = unlinkResponse.data;

       const result = unlinkUser(session, "kakao", id);

       if (result) {
           console.log("연결 해제되었습니다.");
       } else {
           console.log("카카오와 연동된 계정이 아닙니다.");
       }

       res.redirect("/");
   });
</script>
<!-- main -->
