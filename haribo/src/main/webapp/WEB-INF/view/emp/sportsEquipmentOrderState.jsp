<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>트레이너 발주 현황</title>
  <!-- 파비콘 코드 -->
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  <!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
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
	<jsp:include page="/inc/trainerNavi.jsp"></jsp:include>
	
	<div class="content-wrapper">
	<section class="content-header">
	<h3>발주 현황</h3>
	<p>📢 발주 승인 처리가 지연될 수 있습니다. 급한 건은 본사에 직접 연락 바랍니다.</p>
	<div class="box box-info">
	  <!-- /.box-header -->
	  <div class="box-body">
	      <table id="example2" class="table table-bordered table-hover">
	        <thead>
	        <tr>
	          <th>주문번호</th>
	          <th>물품 번호</th>
	          <th>수 량</th>
	          <th>발주 상태</th>
	          <th>발주 신청일</th>
	        </tr>
	        </thead>
	        
	        <tbody>
	        <c:forEach var="seq" items="${seqsList}">
	        <tr>
	          <td>${seq.orderNo}</td>
	          <td>${seq.sportsEquipmentNo}</td>
	          <td>${seq.quantity}</td>
	          <td>${seq.orderStatus}</td>
	          <td>${seq.createdate}</td>
	        </tr>
	        </c:forEach>
	        </tbody>
	      </table>
	      <!-- 페이지네이션 -->
	      <div class="btn-group">
          	<button type="button" class="btn btn-info">Left</button>
            <button type="button" class="btn btn-info">Middle</button>
            <button type="button" class="btn btn-info">Right</button>
          </div>
	    </div>
	  <!-- /.box-body -->
	</div>
	<!-- /.box -->
	</section>
	<!-- 헤더 + 내용 wrapper 부분 끝 -->
	</div>

<!-- 메인 footer 항상 적을 것 -->
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