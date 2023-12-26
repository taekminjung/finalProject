<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>하리보팀 파이널프로젝트</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="emp/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
	<div class="container">
		<div class="login-box">
		  <div class="login-logo">
		    <b>Customer</b>
		  </div>
		  <!-- /.login-logo -->
		  <div class="login-box-body">
		    <form action="${pageContext.request.contextPath}/login" method="post">
		      <div class="form-group has-feedback">
		        <input id="customerId" type="text" class="form-control" placeholder="ID" name="customerId">
		        <span class="glyphicon glyphicon-star form-control-feedback"></span>
		      </div>
		      <div class="form-group has-feedback">
		        <input type="password" class="form-control" placeholder="Password" name="customerPw">
		        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		      </div>
		      <div class="row">
		        <div class="col-xs-8">
		          <div class="checkbox icheck">
		            <label>
		              <input id="idSaveCheck" type="checkbox"> Remember Me
		            </label>
		          </div>
		        </div>
		        <!-- /.col -->
		        <div class="col-xs-4">
		          <button type="submit" class="btn btn-primary btn-block btn-flat">Log In</button>
		        </div>
		        <!-- /.col -->
		      </div>
		    </form>
			<a href="${pageContext.request.contextPath}/addCustomer" class="text-center">Register New Member</a>
		  </div>
		  <!-- /.login-box-body -->
		</div>
		<!-- /.login-box -->
		<div align="center">ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</div>
		<div class="login-box">
		  <div class="login-logo">
		    <b>Employee</b>
		  </div>
		  <!-- /.login-logo -->
		  <div class="login-box-body">
		    <form action="" method="post">
		      <div class="form-group has-feedback">
		        <input type="text" class="form-control" placeholder="ID">
		        <span class="glyphicon glyphicon-user form-control-feedback"></span>
		      </div>
		      <div class="form-group has-feedback">
		        <input type="password" class="form-control" placeholder="Password">
		        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		      </div>
		      <div class="row">
		        <div class="col-xs-8">
		          <div class="checkbox icheck">
		            <label>
		              <input type="checkbox"> Remember Me
		            </label>
		          </div>
		        </div>
		        <!-- /.col -->
		        <div class="col-xs-4">
		          <button type="submit" class="btn btn-primary btn-block btn-flat">Log In</button>
		        </div>
		        <!-- /.col -->
		      </div>
		    </form>
		  </div>
		  <!-- /.login-box-body -->
		</div>
	<!-- /.login-box -->
	</div>
<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="emp/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
  
  $(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $('#customerId').val(userInputId); 
	     
	    if($('#customerId').val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $('#customerId').val();
	            setCookie("userInputId", userInputId, 30); // 30일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $('#customerId').keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $('#customerId').val();
	            setCookie("userInputId", userInputId, 30); // 30일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
</script>
</body>
</html>