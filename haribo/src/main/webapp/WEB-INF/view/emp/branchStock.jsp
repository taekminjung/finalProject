<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/_all-skins.min.css">

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  
  <jsp:include page="/inc/adminHeader.jsp"></jsp:include>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>운동 기구 리스트</h1>
    </section>

    <section class="testomial-area section-gap">
    		<div class="container">
    			<div class="row d-flex justify-content-center">
    				<div class="col-lg-12">
    					<div class="section-title-wrap text-center">
    						<h1>지점별 재고 현황</h1>
    				</div>
    			</div>
    		</div>
			<div class="row text-center">
			    <c:forEach var="b" items="${list}">
			        <div class="col-md-3 mb-4">
			            <div class="card">
			                <a href="${pageContext.request.contextPath}/branchStockList?branchNo=${b.branchNo}&branchName=${b.branchName}">
			                    <img class="img-fluid" src="upload/emp/${b.branchName}.png" alt="" width="300px" height="200px">
			                    <div class="card-body">
			                        <h4 class="card-title">${b.branchName}</h4>
			                        <p class="card-text">지점 보기</p>
			                    </div>
			                </a>
			            </div>
			        </div>
			    </c:forEach>
			</div>
		</div>
	</div>

    </section>
	

  <div class="control-sidebar-bg"></div>

</div>

<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="emp/bower_components/fastclick/lib/fastclick.js"></script>
<script src="emp/dist/js/adminlte.min.js"></script>
<script src="emp/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<script src="emp/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="emp/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="emp/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="emp/dist/js/demo.js"></script>

</body>
</html>
