<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>하리보팀 파이널프로젝트</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">
    <%@include file="/inc/adminHeader.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          비밀번호 변경
          <small>관리자</small>
        </h1>
      </section>
      <!-- Main content -->
      <section class="content">
        <div class="col-md-6">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Change Password</h3>
            </div>
            <form name="form" id="form" method="post" action="${pageContext.request.contextPath}/updateEmployeePw">
              <div class="box-body">
                <div class="form-group" class="col-sm-10">
                  <label for="pw" >Current Password</label>
                    <input type="password" class="form-control" id="pw" name="employeePw" placeholder="Current Password">
                </div>
            
                <div class="form-group" class="col-sm-10">
                  <label for="newPw" >New Password</label>
                    <input type="password" class="form-control" id="newPw" name="newEmployeePw" placeholder="New Password">
                </div>
                <div class="form-group" class="col-sm-10">
                  <label for="newPwCk" >Confirm Password</label>
                <input type="password" class="form-control" id="newPwCk" placeholder="Confirm Password">
                </div>
              </div>
              <div>
               	<input type="hidden" id="employeeId" name="employeeId" value="${loginEmployee.employeeId}">
              	<input type="hidden" id="employeeNo" name="employeeNo" value="${loginEmployee.employeeNo}">
              </div>
              <div class="box-footer">
                <button type="submit" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-info pull-right">Save Changes</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
        </div>
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- jQuery 3 -->
    
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
  </div>
  	<script>
  		$('formBtn').click(function()){
  			if($('#pw').val().length < 1){
  				alert('현재 비밀번호를 입력하세요')
  				$('#pw').focus()
  			} else if ($('#newPw').val().length < 1){
  				alert('새로운 비밀번호를 입력하세요')
  				$('#newPw').focus()
  			} else if ($('#newPwCk').val().length < 1){
  				alert('새로운 비밀번호 확인을 입력하세요')
  				$('#newPwCk').focus()
  			} else if ($('#newPw').val() != ($('#newPwCk').val(){
  				alert('비밀번호 확인이 일치하지 않습니다')
  				$('#newPwCk').focus()
  			} else{
  				$.ajax({
  					url:'/haribo/employeePwCk',
  					method:'post',
  					data:{'employeePw':$('#pw').val(),'employeeId':$('#employeeId').val()},
  					success:function(json){
  						if(json != 1){
  							$('#pw').val('')
  							alert('현재 비밀번호가 일치하지 않습니다')
  						} else{
  							if($('#pw').val() == $('#newPw').val()){
  								alert('기본 비밀번호와 같습니다. 다른 걸로 변경하세요')
  								$('#newPw').focus()
  							} else{
  								$('#form').submit();
  							}
  						}
  					},
  					error:function(err){
  						console.log(err)
  					}
  			})
  		}
  	})
  			
  	</script>
</body>
</html>
