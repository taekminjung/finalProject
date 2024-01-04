<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- 로그인 세션 유무에 따라 버튼 분기 -->
	<c:set var="loginBtn" value="로그인"></c:set>
	<c:set var="loginUrl" value="${pageContext.request.contextPath}/login"></c:set>
	<c:set var="registBtn" value="회원가입"></c:set>
	<c:set var="registUrl" value="${pageContext.request.contextPath}/insertCustomer"></c:set>
	<c:if test="${loginCustomer != null}">
		<c:set var="loginBtn" value="로그아웃"></c:set>
		<c:set var="loginUrl" value="${pageContext.request.contextPath}/logout"></c:set>
		<c:set var="registBtn" value="마이페이지"></c:set>
		<c:set var="registUrl" value="${pageContext.request.contextPath}/customerSchedule?customerNo=${loginCustomer.customerNo }"></c:set>
	</c:if>
	<!-- start header Area -->
	<header id="header">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-8 header-top-left no-padding">
					</div>
					<div class="col-lg-6 col-sm-6 col-4 header-top-right no-padding">
						<a class="book-now" href="${registUrl}">${registBtn}</a>
						<a class="book-now" href="${loginUrl}">${loginBtn}</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="${pageContext.request.contextPath}/home"><img src="customer/img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a class="active" href="${pageContext.request.contextPath}/home">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/aboutUs">About</a></li>
						<li><a href="${pageContext.request.contextPath}/branch">Branch/Trainers</a></li>
						<li><a href="${pageContext.request.contextPath}/membership">Membership</a></li>
						<li><a href="${pageContext.request.contextPath}/program">Program</a></li>
						<li class="menu-has-children"><a href="">Pages</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/customerNoticeList">Notice</a></li>
								<li><a href="${pageContext.request.contextPath}/reviewList">Review</a></li>
								<li><a href="${pageContext.request.contextPath}/questionList">Question</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
					</ul>
				</nav><!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- end header Area -->