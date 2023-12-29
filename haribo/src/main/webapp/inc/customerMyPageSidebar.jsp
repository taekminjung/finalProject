<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-lg-3 sidebar-widgets"><br><br>
	<div class="widget-wrap">
		<div class="single-sidebar-widget user-info-widget">
			<img src="customer/img/blog/user-info.png" alt="">
			<h4>${custInfoMap.customerId }</h4>
			<p>${custInfoMap.customerName } 회원님</p>
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
					<a href="" class="d-flex justify-content-between">
						<span class="lnr lnr-arrow-right"></span>
						<p>내 멤버십 정보</p>
					</a>
				</li>
			</ul>
		</div>
		<div class="d-grid">
			<button type="button" class="btn btn-outline-secondary btn-block" disabled>
				<br>
				<p>멤버십 종료 날짜</p>
				<P>0000년 00월 00일</P>
			</button>
		</div>
	</div>
</div>