<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <link rel="stylesheet" href="emp/dist/css/skins/_all-skins.min.css">

  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

  <%@include file="/inc/adminHeader.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        프로그램 등록 페이지
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
               <form id="form" name="form" method="post" action="${pageContext.request.contextPath}/insertProgram">
                <div class="form-group">
                  <label for="programName">프로그램명</label>
                  <input type="text" class="form-control" id="programName" name="programName" placeholder="프로그램명">
                </div>
                <div class="form-group">
                  <label for="programMaxCustomer">수용 인원</label>
                  <input type="text" class="form-control" id="programMaxCustomer" name="programMaxCustomer" placeholder="최대 수용인원">
                </div>
		      
		      <div class="form-group">
                  <label for="programDate">프로그램 내용</label>
                  <textarea style="height: 150px; width: 600px;" class="form-control" id="programDate" name="programDate" placeholder="프로그램 상세내용"></textarea>

	
		      </div>
		      
	          <div class="form-group">
                  <label for="programDate">프로그램 일자 <br> 예시) 토 / 월, 수, 금 / 화, 목</label>
                  <input type="text" class="form-control" id="programDate" name="programDate" placeholder="프로그램 개설 요일">
		      </div>
			  <form method="post" enctype="multipart/form-data" id="imgForm" action="${pageContext.request.contextPath}insertProgramImg">
			  		<input id="pImg" type="file" name="pImg" accept=".png">			  		
			  </form>
	      
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" id="formBtn" class="btn btn-primary">Submit</button>
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
		if($('#employeeId').val().length<1){
			alert('아이디 중복을 다시 확인 해주세요')
			$('#employeeId').focus()
		}  else if($('#employeePw').val().length<1){
			alert('비밀번호를 입력해주세요')
			$('#employeePw').focus()
		}  else if ($('#branchNo').val() == null){
			alert('지점을 선택해주세요')
			$('#branchNo').focus()
		}  else if ($('#employeeName').val().length<1){
			alert('이름을 입력해주세요')
			$('#employeeName').focus()
		}  else if($('#employeeEmail').val().length<1){
			alert('이메일을 입력해주세요')
			$('#employeeEmail').focus()
		}  else if($('#employeePhone').val().length<1){
			alert('이메일을 입력해주세요')
			$('#employeePhone').focus()
		}  else if ($('#employeeGender').val() == null){
			alert('지점을 선택해주세요')
			$('#employeeGender').focus()
		}  else{
			$('#form').submit()
		}
	})
</script>
</body>
</html>
