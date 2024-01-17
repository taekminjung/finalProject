<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
        
  <style>
  .expired-membership {
      color: grey;
  }
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  
  <%@include file="/inc/adminHeader.jsp" %>
  
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        회원 명단
      </h1>
    </section>
     <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <br>
			<div class="box-body table-responsive no-padding">
			    <table class="table table-hover">
			        <tr>

			            <th class="text-center">회원 ID</th>
			            <th class="text-center">회원명</th>
			            <th class="text-center">성별</th>
			            <th class="text-center">전화번호</th>
			            <th class="text-center">이메일</th>
			            <th class="text-center">주소</th>
			            <th class="text-center">멤버십 기간</th>
			      		<th class="text-center">등록일자</th>
			        </tr>
			
			        <c:forEach var="c" items="${list}">
			            <input type="hidden" id="customerMembershipEnd" name="customerMembershipEnd" value="${c.customerMembershipEnd}">			                
			            	<td class="text-center">${c.customerId}</td>
			                <td class="text-center">${c.customerName}</td>
			                <td class="text-center">${c.customerGender}</td>
			                <td class="text-center">${c.customerPhone}</td>
			                <td class="text-center">${c.customerEmail}</td>
			                <td class="text-center">${c.customerAddress}</td>
			                <td class="text-center ${c.customerMembershipEnd lt now ? 'expired-membership' : ''}">
    							${c.customerMembershipEnd}
							</td>
			                <td class="text-center"><fmt:formatDate value="${c.createdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
			    </table>
			    <br><br>
				<div class="text-center"> 
			  		<c:if test="${currentPage > 1}">
			  			<a href="${pageContext.request.contextPath}/employeeList?currentPage=${currentPage-1}" class="btn btn-primary">이전</a>
			  		</c:if>
			  	<h4>[${currentPage}]</h4>
				  <c:if test="${currentPage < lastPage}">
				  	<a href="${pageContext.request.contextPath}/employee?currentPage=${currentPage+1}" class="btn btn-primary">다음</a>
				  </c:if>
				</div>
	  			<div class="control-sidebar-bg"></div>
			</div>
			</div>
		</div>
		</div>
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

</body>
</html>
