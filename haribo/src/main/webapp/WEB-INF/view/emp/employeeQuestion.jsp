<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>직원 문의사항</title>
  
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  <!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
  
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/skin-yellow.min.css">
  

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-yellow sidebar-mini">

<div class="wrapper">
  <!-- 헤더 -->
  <jsp:include page="/inc/adminHeader.jsp"></jsp:include>

  <div class="content-wrapper">
    <section class="content-header">
    <h3>문의사항</h3>
    
    <div class="box-tools">
    	<div class="input-group input-group-sm hidden-xs" style="width: 300px;">
			<form class="search-form" id="searchQuestion" method="post" action="${pageContext.request.contextPath}/employeeQuestion">
			    <div class="input-group input-group-sm hidden-xs" style="width: 300px;">
			        <input type="text" name="questionTitle" class="form-control pull-right" placeholder="검색어를 입력하세요" onfocus="this.placeholder''" onblur="this.placeholder='검색어를 입력하세요'">
			        <span class="input-group-btn">
			            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
			        </span>
			    </div>
			</form>
         </div>
    </div>
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-warning">
            <div class="box-body table-responsive no-padding text-center">
              <table class="table table-hover text-center">
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                </tr>
                
                <c:forEach var="q" items="${list}">
                <tr>
                  <td>${q.questionNo}</td>
                  <td><a href="${pageContext.request.contextPath}/employeeQuestionOne?questionNo=${q.questionNo}">${q.questionTitle}</a></td>
                  <td>${q.customerId}</td>
                  <td>${q.createdate}</td>
                </tr>
                </c:forEach>
              </table>
            </div>
             <!-- 페이지네이션 -->
	      <div class="btn-group" style="display: flex; justify-content: center;">
          	<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/employeeQuestion?currentPage=${currentPage-1}" class="btn btn-info">이전</a>
				</c:if>
				 	<a class="btn btn-info active">${currentPage}</a>
				<c:if test="${currentPage < lastPage}">
					<a href="${pageContext.request.contextPath}/employeeQuestion?currentPage=${currentPage+1}" class="btn btn-info">다음</a>
				</c:if>
			</div>
            <!-- /.box-body -->
          </div>

        </div>
      </div>
    </section>
  </div>
  <footer class="main-footer">
    <!-- 맨 오른쪽 표시되는 것 -->
    <div class="pull-right hidden-xs">
      팀 하리보
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

</body>
</html>