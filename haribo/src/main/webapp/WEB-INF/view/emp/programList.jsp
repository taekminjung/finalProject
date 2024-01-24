<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>프로그램 목록</title>
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
      <h1>프로그램 목록</h1>

     <div class="row">
        <div class="col-xs-12">
          <div class="box box-warning">
            <br>
			<div class="box-body table-responsive no-padding">
			    <table class="table table-hover">
			        <tr>
			        <th class="text-center">지점명</th>
			            <th class="text-center">프로그램명</th>
			            <th class="text-center">프로그램 요일</th>
			            <th class="text-center">생성일자</th>
			            <th class="text-center">활동여부</th>
			            <th class="text-center"><i class="fa fa-pencil"></i></th>			            
			        </tr>
			
			        <c:forEach var="p" items="${list}">
			            <tr>
			            <form id="form" name="form" action="${pageContext.request.contextPath}/updateProgramActive" method="post">
			            	<input type="hidden" name="programNo" id="programNo" value="${p.programNo}">
			      			<input type="hidden" name="branchName"" id="branchName" value="${p.branchName}">
			      			<input type="hidden" name="programName" id="programName" value="${p.programName}">
			      			<input type="hidden" name="programDay" id="programDay" value="${p.programDay}">
			                <td class="text-center">${p.branchName}</td>
			                <td class="text-center">
			                	<a href="${pageContext.request.contextPath}/programOne?programNo=${p.programNo}">${p.programName}</a>
			                </td>
			                <td class="text-center">${p.programDay}</td>
			                <td class="text-center"><fmt:formatDate value="${p.createdate}" pattern="yyyy-MM-dd"/></td>
			                <td class="text-center">
			                	<c:choose>
			                		<c:when test="${p.programActive == 'Y'}">
			                			<select id="programActive" name="programActive">
			                				<option value="Y">활성</option>
			                				<option value="N">비활성</option>
			                			</select>
			                		</c:when>
			                		<c:otherwise>
                                     ${p.programActive}
                                	</c:otherwise>
			                	</c:choose>
			                </td>
			                <td class="text-center">
			                	<c:if test="${p.programActive == 'Y'}">
				                	<button class="btn bg-navy updateBtn">수정</button>
								</c:if>
			                </td>
			            </form>
			            </tr>
			        </c:forEach>
			    </table>
			    </div>
			    <br>
				<!-- 페이지네이션 -->
	      <div class="btn-group" style="display: flex; justify-content: center;">
          	<c:if test="${currentPage > 1}">
				  	<a href="${pageContext.request.contextPath}/programList?currentPage=${currentPage-1}" class="btn btn-info">이전</a>
				  </c:if>
				  	<a class="btn btn-info active">${currentPage}</a>
				  <c:if test="${currentPage < lastPage}">
				  	<a href="${pageContext.request.contextPath}/programList?currentPage=${currentPage+1}" class="btn btn-info">다음</a>
				  </c:if>
				</div>
			</div>
		</div>
	</div>
	</section>
</div>
</div>

  <div class="control-sidebar-bg"></div>

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
	$('.updateBtn').click(function(){
		var result = confirm('수정하시겠습니까?');
		if(result){
			$('#form').submit()
		} else {
			
		}
		
	})
</script>
</body>
</html>
