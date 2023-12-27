<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Registration Page</title>
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
<!-- 공공 데이터 활용 주소 검색 api -->
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/haribo/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
}

</script>
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <b>Register</b>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Register a new member</p>
    <div class="form-group has-feedback">
      <input id="idCk" type="text" class="form-control" placeholder="ID">
      <span class="glyphicon glyphicon-star form-control-feedback"></span>
    </div>
    <div class="col-xs-8" style="float:left">
      <span id="idCkMsg"></span>
    </div>
    <div class="col-xs-4" style="float:right">
      <button id="idCkBtn" class="btn btn-primary btn-block btn-flat">ID Check</button>
    </div><br><br>
    <form name="form" id="form" action="${pageContext.request.contextPath}/addCustomer" method="post">
      <div class="form-group has-feedback">
	    <input id="customerId" type="hidden" class="form-control" placeholder="ID" name="customerId">
	    <span class="glyphicon glyphicon-star form-control-feedback"></span>
   	  </div>
      <div class="form-group has-feedback">
        <input id="customerPw" type="password" class="form-control" placeholder="Password" name="customerPw">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="customerPwCk" type="password" class="form-control" placeholder="Password Check">
        <span class="glyphicon glyphicon-ok form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="customerName" type="text" class="form-control" placeholder="Name" name="customerName">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group">
        <select class="form-control" name="customerGender">
        	<option value="남">male</option>
        	<option value="여">female</option>
        </select>
      </div>
      <div class="form-group has-feedback">
        <input id="customerPhone" type="text" class="form-control" placeholder="Phone" name="customerPhone">
        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
      	<input id="emailId" type="text" class="form-control" placeholder="Email ID" name="emailId">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        <select class="form-control" name="emailDomain">
        	<option value="@naver.com">@naver.com</option>
        	<option value="@google.com">@gmail.com</option>
        </select>
	  </div>
      <div id="callBackDiv">
      <div class="form-group has-feedback">
        <input id="roadFullAddr" type="text" class="form-control" placeholder="Address" name="customerAddress" readonly>
        <span class="glyphicon glyphicon-home form-control-feedback"></span>
      </div>
      <input type="button" onClick="goPopup();" value="Find Addr"/>
      </div>
     </form>
     <div class="row">
        <!-- /.col -->
        <div class="col-xs-4" style="float:right">
          <button id="formBtn" class="btn btn-primary btn-block btn-flat">Register</button>
        </div>
        <!-- /.col -->
      </div>
    <a href="${pageContext.request.contextPath}/login" class="text-center">I already have a membership</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

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
  
  $('#idCkBtn').click(function(){
	  $.ajax({
		  url:'/haribo/customerIdCk',
		  method:'post',
		  data:{'idCk':$('#idCk').val()},
		  success:function(json){
			  if(json == 0){
				  $('#customerId').val($('#idCk').val())
				  $('#idCkMsg').text('사용 가능한 아이디 입니다')
				  $('#idCkMsg').css("color","blue")
			  }else{
				  $('#customerId').val('')
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
	  if($('#customerId').val().length < 1){
		  alert('아이디 중복을 다시 확인 해주세요')
		  $('#customerId').focus()
	  }else if($('#customerPw').val().length < 1){
		  alert('비밀번호를 입력 해주세요')
		  $('#customerPw').focus()
	  }else if($('#customerPw').val() != $('#customerPwCk').val()){
		  alert('비밀번호가 일치하지 않습니다')
		  $('#customerPw').focus()
	  }else if($('#customerName').val().length < 1){
		  alert('이름을 입력 해주세요')
		  $('#customerName').focus()
	  }else if($('#customerPhone').val().length < 1){
		  alert('전화번호를 입력 해주세요')
		  $('#customerPhone').focus()
	  }else if($('#emailId').val().length < 1){
		  alert('이메일을 입력 해주세요')
		  $('#emailId').focus()
	  }else if($('#roadFullAddr').val().length < 1){
		  alert('주소를 입력 해주세요')
	  }else{
		  $('#form').submit()
	  }
  })
  
</script>
</body>
</html>
