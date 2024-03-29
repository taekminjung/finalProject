<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>트레이너 문의사항 상세보기</title>
  <!-- 파비콘 코드 -->
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  <!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
  <!-- 리뷰 댓글 css -->
  <link rel="stylesheet" href="emp/css/reviewReply.css">

  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- header 시작 부분 -->
  <!-- inc 폴더의 TrainerNavi.jsp를 include -->
  <jsp:include page="/inc/trainerNavi.jsp"></jsp:include>
  <!-- header 끝나는 부분 -->

  <!-- aside 작성 뒤 항상 이 부분이 메인 컨텐츠 부분이 됨 -->
  <!-- 헤더 + 내용 wrapper 부분 시작 -->
  <div class="content-wrapper">
    <!-- 페이지 메인 컨텐트 헤더 -->
    <section class="content">
	<h3>문의사항</h3>
      <!-- Default box -->
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">${resultQuestion.questionTitle}</h3>
        </div>
        <div class="box-body">
          ${resultQuestion.questionContent}
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
	        <h4>답변</h4>
	        <div class="comment-container">
		        <img class="direct-chat-img" src="emp/img/man.png">
		        <div class="comment-message-container">
			        <c:forEach var="qr" items="${list}">
					<div class="comment">	
						<div class="direct-chat-text" style="width: 500px;"> ${qr.questionReplyContent} </div>
						<!-- 각 댓글에 대한 삭제 버튼이 있는 폼 추가 -->
						<div>
			            	<form action="${pageContext.request.contextPath}/deleteQuestionReply" method="post">
			                <input type="hidden" name="questionReplyNo" value="${qr.questionReplyNo}">
			                <input type="hidden" name="questionNo" value="${qr.questionNo}">
			                <button type="submit" class="btn btn-danger btn-flat btn-xs">X</button>
			            	</form>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<br>
			<!-- 문의 댓글 다는 곳 -->
			<div>
	          <form action="${pageContext.request.contextPath}/trainerQuestionOne" method="post">
	            <div class="input-group" style="width: 700px;">
	              <input type="text" name="questionReplyContent" id="questionReplyContent" placeholder="댓글을 입력하세요 ..." class="form-control">
	              <input type="hidden" name="employeeId" id="employeeId" value="${loginEmployee.employeeId}"class="form-control">
	              <input type="hidden" name="questionNo" id="questionNo" value="${question.questionNo}"class="form-control">
	                  <span class="input-group-btn" >
	                    <button type="submit" id="btn" class="btn btn-info btn-flat">입력하기</button>
	                  </span>
	            </div>
	          </form>
	        </div>
	       <br><a href="${pageContext.request.contextPath}/trainerQuestion" class="btn btn-default">목록으로</a>
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
    </section>
    <!-- /.content -->
  </div>
  <!-- 헤더 + 내용 wrapper 부분 끝 -->
  
  <!-- 메인 footer 항상 적을 것 -->
  <footer class="main-footer">
    <!-- 맨 오른쪽 표시되는 것 -->
    <div class="pull-right hidden-xs">
      팀 하리보 | 택민 유정 유섭 회윤
    </div>
    <!-- 저작권 명시 -->
    <strong>Copyright &copy; 2023-2024 <a href="trainerHome">TEAM HARIBO</a>.</strong> All rights reserved.
  </footer>
  
  
  <div class="control-sidebar-bg"></div>
</div>
<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="emp/dist/js/adminlte.min.js"></script>
<script>
	$(document).ready(function () {
	  var questionReplyContent = $('#questionReplyContent');

	  $('#btn').click(function (event) {
	    // 댓글 내용이 비어 있으면 폼 전송을 막고 알림창을 띄움
	    if (questionReplyContent.val().trim().length < 1) {
	      event.preventDefault(); // 폼 전송 막음
	      alert("댓글 내용을 입력하세요");
	      questionReplyContent.focus();
	    } 
	    // 댓글 내용이 비어 있지 않으면 폼이 자동으로 전송됨
	  });
	});
</script>
</body>
</html>