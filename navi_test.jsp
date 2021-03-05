
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>부트스트랩 활용 페이지</title>
</head>
<body>
<div role="tabpanel">
    <!-- List group -->
    <div class="list-group" id="myList" role="tablist">
        <a class="list-group-item list-group-item-action active" data-toggle="list"
           href="#home" role="tab">홈</a>
        <a class="list-group-item list-group-item-action" data-toggle="list"
           href="http://localhost:8080/researchForm.jsp" role="tab">커피추천기</a>
        <a class="list-group-item list-group-item-action" data-toggle="list"
           href="http://localhost:8080/researchForm2.jsp" role="tab">머신추천기</a>
        <a class="list-group-item list-group-item-action" data-toggle="list"
           href="http://localhost:8080/description1.jsp" role="tab">원두지식</a>
        <a class="list-group-item list-group-item-action" data-toggle="list"
           href="http://localhost:8080/description2.jsp" role="tab">머신지식</a>

    </div>

    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane active" id="home" role="tabpanel">...</div>
        <div class="tab-pane" id="profile" role="tabpanel">...</div>
        <div class="tab-pane" id="messages" role="tabpanel">...</div>
        <div class="tab-pane" id="settings" role="tabpanel">...</div>
    </div>
</div>

</body>
</html>
