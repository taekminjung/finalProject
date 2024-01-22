<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>운동기구 목록</title>
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
      <h1>
        운동	기구 목록
      </h1>
    </section>

     <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <br>
			<div class="box-body table-responsive no-padding">
			    <table class="table table-hover">
			        <tr>
			            <th class="text-center">지점 번호</th>
			            <th class="text-center">운동기구 번호</th>
			            <th class="text-center">운동기구명</th>
			            <th class="text-center">가격</th>
        		        <th class="text-center">수량</th>
       		            <th class="text-center">총 가격</th>
        		        <th class="text-center">주문일자</th>
        		        <th class="text-center">주문 상태</th>
        		        <th class="text-center">결재</th>
			        </tr>
			        
			        <c:forEach var="seo" items="${list}">
			        
					<tr>
					<form id="form" name="form" action="${pageContext.request.contextPath}/updateOrderStatus" method="post">
						<input type="hidden" name="branchNo" id="branchNo" value="${seo.branchNo}">
						<input type="hidden" name="sportsEquipmentNo" id="sportsEquipmentNo" value="${seo.sportsEquipmentNo}">
						<input type="hidden" name="itemName" id="itemName" value="${seo.itemName}">
						<input type="hidden" name="itemPrice" id="itemPrice" value="${seo.itemPrice}">
						<input type="hidden" name="quantity" id="quantity" value="${seo.quantity}">
						<input type="hidden" name="totalPrice" id="totalPrice" value="${seo.totalPrice}">
						<input type="hidden" name="orderNo" id="orderNo" value="${seo.orderNo}">
						<td class="text-center">${seo.branchNo} </td>		
						<td class="text-center">${seo.sportsEquipmentNo}</td>
						<td class="text-center">${seo.itemName} </td>
						<td class="text-center">${seo.itemPrice} </td>
						<td class="text-center">${seo.quantity} </td>
						<td class="text-center">${seo.totalPrice} </td>
						<td class="text-center">${seo.createdate} </td>		
						<td class="text-center">
                                <c:choose>
                                    <c:when test="${seo.orderStatus == '대기'}">
                                        <select id="orderStatus" name="orderStatus">
                                        	<option value="대기">대기</option>
                                            <option value="승인">승인</option>
                                            <option value="거절">거절</option>
                                        </select>
                                    </c:when>
                                    <c:otherwise>
                                        ${seo.orderStatus}
                                    </c:otherwise>
                                </c:choose>
                            </td>							
                            <td class="text-center">
                                <c:if test="${seo.orderStatus != '승인' and seo.orderStatus != '거절'}">
                                        <button class="btn bg-navy" id="updateBtn">결재</button>
                                </c:if>
                            </td>
						</form>	
						</tr>
					</c:forEach>
			    </table>
			    <br>
			<div class="text-center"> 
			  <c:if test="${currentPage > 1}">
			  	<a href="${pageContext.request.contextPath}/sportsEquipmentOrderCk?currentPage=${currentPage-1}" class="btn btn-primary">이전</a>
			  </c:if>
			  <h4>[${currentPage}]</h4>
			  <c:if test="${currentPage < lastPage}">
			  	<a href="${pageContext.request.contextPath}/sportsEquipmentOrderCk?currentPage=${currentPage+1}" class="btn btn-primary">다음</a>
			  </c:if>
			</div>
		</div>
	  </div>
	</div>
  </div>
</div>
	<div class="control-sidebar-bg"></div>

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
		var result = confirm($('#orderStatus').val()+'하시겠습니까');
		if(result){
			$('#form').submit()
			} else{
				event.preventDefault();
		}
	})
</script>


</body>
</html>
