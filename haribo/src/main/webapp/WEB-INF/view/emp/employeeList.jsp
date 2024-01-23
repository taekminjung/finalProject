<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>직원명단</title>
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
  
  <div class="content-wrapper">
    <section class="content-header">
      <h1>직원 명단</h1>

     <div class="row">
        <div class="col-xs-12">
          <div class="box box-warning">            
			<div class="box-body table-responsive no-padding">
			    <table class="table table-hover">
			        <tr>
			            <th class="text-center">지점 번호</th>
			            <th class="text-center">직원 ID</th>
			            <th class="text-center">직원명</th>
			            <th class="text-center">전화번호</th>
			            <th class="text-center">이메일</th>
			            <th class="text-center">성별</th>
			            <th class="text-center">입사일자</th>
			      		<th class="text-center">활동여부</th>
			      		<th class="text-center"><i class="fa fa-pencil"></i></th>
			        </tr>
			
			        <c:forEach var="e" items="${list}">
			            <tr>
			            <form id="form" name="form" action="${pageContext.request.contextPath}/deleteEmployee" method="post">
			            <input type="hidden" name="employeeNo" id="employeeNo" value="${e.employeeNo}">
			             <input type="hidden" name="employeeId" id="employeeId" value="${e.employeeId}">
			             <input type="hidden" name="branchNo" id="branchNo" value="${e.branchNo}">
			             <input type="hidden" name="employeeName" id="employeeName" value="${e.employeeName}">
			             <input type="hidden" name="employeePhone" id="employeePhone" value="${e.employeePhone}">
			             <input type="hidden" name="employeeEmail" id="employeeEmail" value="${e.employeeEmail}">
			             <input type="hidden" name="employeeGender" id="employeeGender" value="${e.employeeGender}">
			                <td class="text-center">${e.branchNo}</td>
			                <td class="text-center">${e.employeeId}</td>
			                <td class="text-center">${e.employeeName}</td>
			                <td class="text-center">${e.employeePhone}</td>
			                <td class="text-center">${e.employeeEmail}</td>
			                <td class="text-center">${e.employeeGender}</td>
			                <td class="text-center"><fmt:formatDate value="${e.createdate}" pattern="yyyy-MM-dd"/></td>
			                <td class="text-center">
			                <c:choose>
			                	<c:when test="${e.employeeActive == 'Y'}">
				                	<select id="employeeActive" name="employeeActive">
				                		<option value="Y">활성</option>
				                		<option value="N">비활성</option>
				                	</select>
			                	</c:when>
			                	<c:otherwise>
                                     ${e.employeeActive}
                                </c:otherwise>
			                </c:choose>
			                </td>
							<td class="text-center">
				                <c:if test="${e.employeeActive == 'Y'}">
				                    <button class="btn bg-navy" id="updateBtn">수정</button>
				                </c:if>
				            </td>
							</form>
						    </tr>
						</c:forEach>
			    </table>
			  </div>
			    <br>
			<div class="text-center"> 
			  <c:if test="${currentPage > 1}">
			  	<a href="${pageContext.request.contextPath}/employeeList?currentPage=${currentPage-1}" class="btn btn-primary">이전</a>
			  </c:if>
			  	[${currentPage}]
			  <c:if test="${currentPage < lastPage}">
			  	<a href="${pageContext.request.contextPath}/employeeList?currentPage=${currentPage+1}" class="btn btn-primary">다음</a>
			  </c:if>
			</div>
		</div>
		</div>
	</div>
	</section>
</div>
</div>

<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="emp/bower_components/fastclick/lib/fastclick.js"></script>
<script src="emp/dist/js/adminlte.min.js"></script>
<script src="emp/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<script src="emp/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="emp/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="emp/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="emp/dist/js/demo.js"></script>
<script>
	$('#updateBtn').click(function(){
		var result = confirm('수정하시겠습니까?');
		if(result){
			$('#form').submit()
		} else {
			
		}
		
	})
</script>
</body>
</html>
