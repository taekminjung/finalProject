<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>하리보팀 파이널프로젝트</title>
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

  <%@include file="/inc/adminHeader.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        직원 추가 페이지
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
              <h3 class="box-title">Quick Example</h3>
            </div>
              <div class="box-body">

              <form id="form" name="form" method="post" action="${pageContext.request.contextPath}/insertSportsEquipment" enctype="multipart/form-data">
                <div class="form-group">
                	<label for="itemName">운동 기구 제품명</label>
                	<input type="text" class="form-control" id="itemName" name="itemName" placeholder="운동 기구 제품명을 입력하세요">
                </div>
                <div class="form-group">
                	<label for="itemPrice">가격</label>
                	<input type="text" class="form-control" id="itemPrice" name="itemPrice" placeholder="가격을 입력하세요">
                </div>
                <div class="form-group">
                	<label for="seImg">운동기구 이미지</label>
                	<input type="file" id="seImg" name="seImg" accept=".jpg, .jpeg, .png">
        	    </div>

			</form>
                <div class="col-xs-4" style="float:right">
          			<button type="submit" id="formBtn" class="btn btn-primary">추가</button>
          		</div>		
              <div class="box-footer">
              </div>
          </div>
      </div>

  <div class="control-sidebar-bg"></div>
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
</script>
</body>
</html>
