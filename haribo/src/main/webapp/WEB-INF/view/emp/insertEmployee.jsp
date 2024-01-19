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
<body class="hold-transition skin-blue sidebar-mini">
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
                <div class="form-group">
                  <label for="ID">ID</label>
                  <input type="text" class="form-control" id="idCk" placeholder="Enter ID">
                </div>
                <div class="col-xs-8" style="float:left">
                	<span id="idCkMsg"></span>
                </div>
                <div class="col-xs-4" style="float:right">
                	<button id="idCkBtn" class="btn btn-primary">ID Check</button>
                </div>
                <br><br>
                
                <form id="form" name="form" method="post" action="${pageContext.request.contextPath}/insertEmployee">
                <div class="form-group">
                	<input type="hidden" id="employeeId" class="form-control" placeholder="ID" name="employeeId">
                </div>
                <div class="form-group">
                  <label for="Password">Password</label>
                  <input type="password" class="form-control" id="employeePw" name="employeePw" placeholder="Enter Password">
                </div>

               <div class="form-group">
			    <label for="Gender">지점</label>
		        <select class="form-control" id="branchNo" name="branchNo">
		        	<option value="1">A 지점</option>
		        	<option value="2">B 지점</option>
		        	<option value="3">C 지점</option>
		        </select>
		      </div>
              

              <div class="form-group">
                <label for="Name">이름</label>
                <input type="text" class="form-control" id="employeeName" name="employeeName" placeholder="Enter Name">
              </div>
              <div class="form-group">
                  <label for="Email">이메일</label>
                  <input type="email" class="form-control" id="employeeEmail" name="employeeEmail" placeholder="Enter Email">

		      <div class="form-group">
			    <label for="Gender">Gender</label>
		        <select class="form-control" id="employeeGender" name="employeeGender">
		        	<option value="남">male</option>
		        	<option value="여">female</option>
		        </select>
		      </div>
            <div class="form-group">
                  <label for="Phone">전화번호</label>
                  <input type="text" class="form-control" id="employeePhone" name="employeePhone" placeholder="Enter Phone">
            </div>
            </div>

              <div class="box-footer">
              </div>
            </form>
          </div>
      </div>
           <div class="col-xs-4" style="float:right">
          		<button type="submit" id="formBtn" class="btn btn-primary">Submit</button>
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
	$('#idCkBtn').click(function(){
		$.ajax({
			url:'/haribo/employeeIdCk',
			method:'post',
			data:{'idCk':$('#idCk').val()},
			success:function(json){
				if(json == 0){
					$('#employeeId').val($('#idCk').val())
					$('#idCkMsg').text('사용 가능한 아이디 입니다')
					$('#idCkMsg').css("color","blue")
				} else{
					$('#employeeId').val('')
					$('#idCkMsg').text('사용 불가능한 아이디 입니다')
					$('#idCkMsg').css("color","red")
				}
			},
			error:function(err){
				console.log(err)
			}
		})
	})
	
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
