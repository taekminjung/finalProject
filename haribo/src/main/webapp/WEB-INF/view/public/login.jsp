<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
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
		    <b>고객 로그인</b>
		  </div>
		  <!-- /.login-logo -->
		  <div class="login-box-body">
		    <form id="customerForm" action="${pageContext.request.contextPath}/login" method="post">
		      <div class="form-group has-feedback">
		        <input id="customerId" type="text" class="form-control" placeholder="아이디" name="customerId">
		        <span class="glyphicon glyphicon-star form-control-feedback"></span>
		      </div>
		      <div class="form-group has-feedback">
		        <input id="customerPw" type="password" class="form-control" placeholder="비밀번호" name="customerPw">
		        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		      </div>
		     </form>
		      <div class="row">
		        <div class="col-xs-8">
		          <a href="${pageContext.request.contextPath}/insertCustomer" class="text-center">회원 가입하기</a>
		        </div>
		        <!-- /.col -->
		        <div class="col-xs-4">
		          <button id="customerBtn" class="btn btn-primary btn-block btn-flat">로그인</button>
		        </div>
		        <!-- /.col -->
		      </div>
		      <div><input id="idSave" type="checkbox">아이디 기억하기</div>
		   </div>
		  <!-- /.login-box-body -->
		</div>
		<!-- /.login-box -->
		<div align="center">ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</div>
		<div class="login-box">
		  <div class="login-logo">
		    <b>직원 로그인</b>
		  </div>
		  <!-- /.login-logo -->
		  <div class="login-box-body">
		    <form action="${pageContext.request.contextPath}/empLogin" method="post">
		      <div class="form-group has-feedback">
		        <input type="text" id="employeeId" name="employeeId" class="form-control" placeholder="아이디">
		        <span class="glyphicon glyphicon-user form-control-feedback"></span>
		      </div>
		      <div class="form-group has-feedback">
		        <input type="password" id="employeePw" name="employeePw" class="form-control" placeholder="비밀번호">
		        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		      </div>
		      <div class="row">
		        <div class="col-xs-8">
		        </div>
		        <!-- /.col -->
		        <div class="col-xs-4">
		          <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
		        </div>
		        <!-- /.col -->
		      </div>
		    </form>
		  </div>
		  <!-- /.login-box-body -->
		</div>
	<!-- /.login-box -->
	</div>
	<!-- 홈 화면 버튼 -->
	<div align="center">
		<a href="${pageContext.request.contextPath }/home"><span class="glyphicon glyphicon-chevron-right"></span>홈 화면으로</a>
	</div>
<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js">
	
</script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script>

$(document).ready(function(){
	
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 쿠키값 없으면 공백.
    var userLoginId = getCookie("userLoginId");
    $('#customerId').val(userLoginId); 
    
    // ID가 있는경우 아이디 저장 체크박스 체크
    if($('#customerId').val() != ""){
    	$('#idSave').attr("checked", true);
    }
    
    // 아이디 저장하기 체크박스 onchange
    $('#idSave').change(function(){
    	if($('#idSave').is(":checked")){  //checked true
    		console.log('체크!');
        	var userLoginId = $('#customerId').val();
            setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
         }else{ //checked false
        	console.log('체크해제!');
         	deleteCookie("userLoginId");
        }
    });
     
     
     // 아이디 저장하기가  눌린상태에서, ID를 입력한 경우
     $('#customerId').keyup(function(){
     	if($('#idSave').is(":checked")){  //checked true
            var userLoginId = $('#customerId').val();
            setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
        }
    });

})
//쿠키값 set
function setCookie(cookieName, value, exdays){
    let exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    let cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

//쿠키값 delete
function deleteCookie(cookieName){
    let expireDate = new Date();
    expireDate.setDate(expireDate.getDate() -1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

//쿠키값 get
function getCookie(cookieName){
    cookieName = cookieName + "=";
    let cookieData = document.cookie;
    let start = cookieData.indexOf(cookieName);
    let cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        let end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue); //unescape로 디코딩 후 값 리턴
}
  
  $('#customerBtn').click(function(){
		if($('#customerId').val().length < 1){
			alert('아이디를 입력하세요')
		}else if($('#customerPw').val().length < 1){
			alert('비밀번호를 입력하세요')
		}else{
			$('#customerForm').submit();
		}
	})
</script>
</body>
</html>