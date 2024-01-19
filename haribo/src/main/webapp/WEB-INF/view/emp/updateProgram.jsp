<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>프로그램 수정 페이지</title>
  <!-- Tell the browser to be responsive to screen width -->
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
        프로그램 수정 페이지
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
			<form id="form" name="form" method="post" action="${pageContext.request.contextPath}/updateProgram" enctype="multipart/form-data">
			  <div class="form-group">
			  <input type="hidden" name="employeeId" id="employeeId" value="${list.employeeId}">
			  	<input type="hidden" name="programNo" id="programNo" value="${list.programNo}">
			    <label for="programName">프로그램명</label>
			    <input type="text" class="form-control" id="programName" name="programName" value="${list.programName}">
			  </div>
			  <div class="form-group">
			    <label for="programMaxCustomer">수용 인원</label>
			    <input type="text" class="form-control" id="programMaxCustomer" name="programMaxCustomer" value="${list.programMaxCustomer}">
			  </div>
			  <div class="form-group">
			    <label for="programMemo">프로그램 내용</label>
				<textarea style="height: 150px; width: 600px;" class="form-control" id="programMemo" name="programMemo">${list.programMemo}</textarea>
			  </div>
			  <div class="form-group">
			    <label for="programDay">프로그램 일자 <br> 예시) 토 / 월, 수, 금 / 화, 목</label>
			    <input type="text" class="form-control" id="programDay" name="programDay" value="${list.programDay}">
			  </div>
			  <div class="form-group">
			    <label for="pImg">프로그램 이미지</label>
			    <input type="file" id="pImg" name="pImg" accept="image/*">
			  </div>
		       <button type="submit" id="formBtn" class="btn btn-primary">수정 완료</button>
			</form>
	

              <div class="box-footer">
  
              </div>
            </form>
          </div>
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
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="emp/dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="emp/dist/js/demo.js"></script>

<script>
	
	$('#formBtn').click(function(){
		if($('#programName').val().length<1){
			alert('프로그램명을 입력해주세요.')
			$('#programName').focus()
		}  else if($('#programMaxCustomer').val().length<1){
			alert('최대 수용인원 입력해주세요')
			$('#programMaxCustomer').focus()
		}  else if ($('#programInfo').val().length<1){
			alert('상세정보를 입력해주세요')
			$('#programInfo').focus()
		}  else if ($('#programDay').val().length<1){
			alert('프로그램 개설요일을 입력해주세요')
			$('#programDay').focus()
		} 
		// else if($('#imgForm').val().length<1){
		//	alert('프로그램 이미지를 추가해주세요')
		//	$('#imgForm').focus()
	//	}  
		else{
			$('#form').submit()
		}
	})
</script>
</body>
</html>
