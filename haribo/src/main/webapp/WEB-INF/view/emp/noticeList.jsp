<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>공지사항 목록</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- 파비콘 코드 -->
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
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="row">
        	<div class="col-md-6">
        		<h3>공지사항</h3>
        	</div>
        	<div class="col-md-6">
        		<div class="box-tools pull-right">
	        		<a href="${pageContext.request.contextPath}/insertNotice" class="btn btn-primary mb-3">공지 추가</a>
	        	</div>
	        	<div class="input-group input-group-sm hidden-xs" style="width: 300px;">
		             <form class="search-form" id="searchNotice" method="post" action="${pageContext.request.contextPath}/noticeList">
		               <div class="input-group input-group-sm hidden-xs">
		                 <input type="text" name="noticeTitle" class="form-control pull-right" placeholder="제목을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='제목을 입력하세요'">
		                 <span class="input-group-btn">
		                     <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
		                 </span>	
		               </div>
		             </form>
	        	</div>
        	</div>
        </div>
         
        <div class="row">
        <div class="col-xs-12">
          <div class="box box-warning">
			<div class="box-body table-responsive no-padding">
			    <table class="table table-hover">
			        <tr>
			            <th class="text-center">번호</th>
			            <th class="text-center">제목</th>
			            <th class="text-center">작성자</th>
			            <th class="text-center">등록일</th>
			        </tr>
			
			        <c:forEach var="n" items="${list}">
			            <tr>
			                <td class="text-center">${n.noticeNo}</td>
			                <td class="text-center">
			                    <a href="${pageContext.request.contextPath}/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
			                </td>
			                <td class="text-center">${n.employeeId}</td>
			                <td class="text-center">${n.createdate}</td>
			             			                
			            </tr>
			        </c:forEach>
			    </table>
			    <br>
			<div class="text-center"> 
			  <c:if test="${currentPage > 1}">
			  	<a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage-1}" class="btn btn-primary">이전</a>
			  </c:if>
			  	<a class="btn btn-purple active">[${currentPage}]</a>
			  <c:if test="${currentPage < lastPage}">
			  	<a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage+1}" class="btn btn-primary">다음</a>
			  </c:if>
			</div>
			</div>
		</div>
		</div>
	</div>
	</div>
</section>
</div>

<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="emp/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="emp/dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="emp/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="emp/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="emp/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="emp/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="emp/dist/js/demo.js"></script>
</body>
</html>
