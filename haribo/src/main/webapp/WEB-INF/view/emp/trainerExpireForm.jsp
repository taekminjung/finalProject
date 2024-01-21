<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>폐기 신청(트레이너)</title>
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

  <!-- header 시작 부분 -->
  <!-- inc 폴더의 TrainerNavi.jsp를 include -->
  <jsp:include page="/inc/trainerNavi.jsp"></jsp:include>
  <!-- header 끝나는 부분 -->

  <!-- aside 작성 뒤 항상 이 부분이 메인 컨텐츠 부분이 됨 -->
  <!-- 헤더 + 내용 wrapper 부분 시작 -->
  <div class="content-wrapper">
    <!-- 페이지 메인 헤더 -->
    <section class="content-header">
	<!-- 발주 신청 폼 -->
    <div class="box box-info">
      <div class="box-header with-border">
        <h3 class="box-title">폐기 신청</h3>
      </div>
      <!-- /.box-header -->
      <!-- form start -->
      <form class="form-horizontal" action="${pageContext.request.contextPath}/trainerExpireForm" method="post">
        <div class="box-body">
          <div class="form-group">
            <label for="branchNo" class="col-sm-1 control-label">지점</label>

            <div class="col-sm-10">
              <input type="text" class="form-control" name="branchNo" value="${loginEmployee.branchNo}" readonly>
            </div>
          </div>
          
          <div class="form-group">
            <label for="sportsEquipmentNo" class="col-sm-2 control-label">폐기 물품명</label>
            <div class="col-sm-10">
            <select class="form-control" id="sportsEquipmentNo" name="sportsEquipmentNo">
                <option>폐기할 물품을 선택해주세요</option>
                <c:forEach var="e" items="${expireList}">
                    <option value="${e.sportsEquipmentNo}">${e.itemName}(${e.quantity}개)</option>
                </c:forEach>
            </select>
            </div>
          </div>
          
          <div class="form-group">
            <label for="quantity" class="col-sm-2 control-label">수량</label>
            <div class="col-sm-10">
            	<input type="hidden" id="currentQ">
              <input type="number" class="form-control" id="quant" name="quantity" placeholder="수량을 입력하세요">
            </div>
          </div>
          
          <div class="form-group">
            <label for="quantity" class="col-sm-2 control-label">폐기 사유</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="expireMemo" name="expireMemo" placeholder="폐기 사유를 입력하세요">
            </div>
          </div>
        
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <a href="trainerHome" class="btn btn-default">신청 취소</a>
          <button type="submit" class="btn btn-info pull-right">제출하기</button>
        </div>
        <!-- /.box-footer -->
      </form>
    </div>
    <!-- /.box -->
    </section>
  </div>
  <!-- 헤더 + 내용 wrapper 부분 끝 -->

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
<script>
	
	$('#sportsEquipmentNo').on("change",function(){
		var str = $('#sportsEquipmentNo option:selected').text();
		var strNum1 = str.indexOf('(');
		var strNum2 = str.indexOf(')');
		var str2 = str.substring(strNum1+1,strNum2);
		$('#currentQ').val(str2);
	});
	
	$('#quant').blur(function(){
		if($('#quant').val() > $('#currentQ').val()){
			alert('tlqkf');
		}
	})
</script>
</body>
</html>