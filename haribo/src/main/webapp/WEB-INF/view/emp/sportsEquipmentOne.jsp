<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>운동기구 상세내용</title>
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
      <h1>
        운동 기구 상세페이지
        <small>Preview</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"></h3>
            </div>
              <div class="box-body">

                <div class="form-group">
                	<label for="itemName">운동 기구 제품명</label>
                	<input type="text" class="form-control" id="itemName" name="itemName" value="${list.itemName}" readonly>
                </div>
                <div class="form-group">
                	<label for="itemPrice">가격</label>
                	<input type="text" class="form-control" id="itemPrice" name="itemPrice" value="${list.itemPrice}" readonly>
                </div>
                <div class="form-group" style="text-align: center">
                	<img id="img" src="${pageContext.request.contextPath}/upload/emp/" 
			  		class="rounded-circle" onerror="this.src='${pageContext.request.contextPath}/upload/emp/equipmentdefault.png'" width="250" height="150">
        	    </div>
           		
                <div class="box-footer">
                	<a class="btn btn-primary" href="${pageContext.request.contextPath}/updateSportsEquipment?sportsEquipmentNo=${list.sportsEquipmentNo}">수정</a>
                </div>		

              
              <div class="box-footer">
              </div>
          </div>
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
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
    <script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
    <script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="emp/bower_components/fastclick/lib/fastclick.js"></script>
    <script src="emp/dist/js/adminlte.min.js"></script>
    <script src="emp/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <script src="emp/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="emp/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="emp/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="emp/dist/js/pages/dashboard2.js"></script>
    <script src="emp/dist/js/demo.js"></script>

<script>
	
	$('#formBtn').click(function(){
		if($('#itemName').val().length<1){
			alert('운동 기구 제품명 입력해주세요')
			$('#itemName').focus()
		}  else if($('#itemPrice').val().length<1){
			alert('가격을 입력해주세요')
			$('#itemPrice').focus()  
		}  else{
			$('#form').submit()
		}
	})
	
	$(document).ready(function(){
		$.ajax({
			url:'/haribo/selectSportsEquipmentImgName',
			method:'get',
			data:{'sportsEquipmentNo': ${list.sportsEquipmentNo}},
			success:function(json){
				console.log(json);
				$('#img').attr('src', 'upload/emp/'+json);
			},
			error:function(err){
				console.log(err);
			}
		})
	})
	
</script>
</body>
</html>
