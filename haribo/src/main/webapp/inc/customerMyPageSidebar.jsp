<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-lg-3 sidebar-widgets"><br><br>
	<div class="widget-wrap">
		<div class="single-sidebar-widget user-info-widget">
			<img src="${pageContext.request.contextPath }/upload/customer/${loginCustomer.customerId}.png"
			 class="rounded-circle" width="150" height="150" onerror="this.src='${pageContext.request.contextPath }/upload/customer/default.jpg'">
			
			<h4>${loginCustomer.customerId }</h4>
			<p>${loginCustomer.customerName } 회원님</p>
			
		</div>
		<div class="single-sidebar-widget post-category-widget">
			<h4 class="category-title">사진 변경</h4><br>
			<ul class="cat-list">
				<li>
					<p>png 파일만 업로드 가능합니다.</p>
				</li>
				<li>
					<form action="${pageContext.request.contextPath }/updateCustomerImg" method="post" enctype="multipart/form-data" id="imgForm">
						<input id="cImg" type="file" name="cImg" accept=".png">
						<input type="hidden" name="customerNo" value="${loginCustomer.customerNo }">
						<input type="hidden" name="customerId" value="${loginCustomer.customerId }">
					</form>
				</li>
				<li>
					<a class="d-flex justify-content-between">
						<span class="lnr lnr-arrow-right"></span>
						<p><button id="imgFormBtn" class="btn btn-outline-dark">변경</button></p>
					</a>
				</li>
			</ul>	
		</div>
		<div class="single-sidebar-widget post-category-widget">
			<h4 class="category-title">My Page Navi</h4>
			<ul class="cat-list">
				<li></li>
				<li>
					<a href="${pageContext.request.contextPath }/customerSchedule?customerNo=${loginCustomer.customerNo}" class="d-flex justify-content-between">
						<span class="lnr lnr-arrow-right"></span>
						<p>일정</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/customerInfo?customerNo=${loginCustomer.customerNo}" class="d-flex justify-content-between">
						<span class="lnr lnr-arrow-right"></span>
						<p>개인 정보</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/insertProgramReservation?customerNo=${loginCustomer.customerNo}" class="d-flex justify-content-between">
						<span class="lnr lnr-arrow-right"></span>
						<p>프로그램 예약</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/updateCustomerPw?customerNo=${loginCustomer.customerNo}" class="d-flex justify-content-between">
						<span class="lnr lnr-arrow-right"></span>
						<p>비밀번호 변경</p>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/deleteCustomer?customerNo=${loginCustomer.customerNo}" class="d-flex justify-content-between">
						<span class="lnr lnr-arrow-right"></span>
						<p style="color: red">회원 탈퇴</p>
					</a>
				</li>
			</ul>
		</div>
		<div class="d-grid">
			<a href="${pageContext.request.contextPath }/membership">
				<button type="button" class="btn btn-outline-secondary btn-block">
					<br>
					<p>멤버십 종료 날짜</p>
					<P><span id="membershipEnd"></span></P>
				</button>
			</a>
		</div>
	</div>
</div>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$('#imgFormBtn').click(function(){
		if($('#cImg').val().length < 1){
			alert('이미지 파일을 추가해주세요')
		}else{
			$('#imgForm').submit();
		}
	})
	
	$(document).ready(function(){
		$.ajax({
			url:'/haribo/membershipEnd',
			method:'get',
			data:{'customerNo':${loginCustomer.customerNo}},
			success:function(json){
				$('#membershipEnd').text(json);
			},
			error:function(err){
				console.log(err);
			}
		})
	})
</script>