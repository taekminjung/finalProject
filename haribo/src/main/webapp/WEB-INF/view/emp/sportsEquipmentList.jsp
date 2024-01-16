<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="emp/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="emp/dist/css/skins/_all-skins.min.css">

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  
  <%@include file="/inc/adminHeader.jsp" %>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        운동 기구 리스트
        <small>관리자</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

     <div class="row">
        <div class="col-xs-12">
          <div class="box">
   
            <br>
			<div class="box-body table-responsive no-padding">
			    <table class="table table-hover">
			        <tr>
			            <th class="text-center">번호</th>
			            <th class="text-center">운동기구명</th>
			            <th class="text-center">이미지</th>
			            <th class="text-center">등록일자</th>
			        </tr>
			        <c:forEach var="se" items="${list}">
			        
					<tr>
						<td class="text-center">${se.sportsEquipmentNo} </td>
						<td class="text-center">
							<a href="${pageContext.request.contextPath}/sportsEquipmentOne?sportsEquipmentNo=${se.sportsEquipmentNo}">${se.itemName}</a> 
						</td>
						<td class="text-center" style="text-align: center">
							<img id="img" src="${pageContext.request.contextPath}/upload/emp/${se.sportsEquipmentImgFileName}" class="rounded-circle" 
							onerror="this.src='${pageContext.request.contextPath}/upload/emp/equipmentdefault.png'" width="150" height="100">
						</td>
						<td class="text-center"><fmt:formatDate value="${se.createdate}" pattern="yyyy-MM-dd"/></td>
					</c:forEach>
			    </table>
			    <br>
			<div class="text-center"> 
			  <c:if test="${currentPage > 1}">
			  	<a href="${pageContext.request.contextPath}/sportsEquipmentList?currentPage=${currentPage-1}" class="btn btn-primary">이전</a>
			  </c:if>
			  <h4>[${currentPage}]</h4>
			  <c:if test="${currentPage < lastPage}">
			  	<a href="${pageContext.request.contextPath}/sportsEquipmentList?currentPage=${currentPage+1}" class="btn btn-primary">다음</a>
			  </c:if>
			</div>

  <div class="control-sidebar-bg"></div>

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
