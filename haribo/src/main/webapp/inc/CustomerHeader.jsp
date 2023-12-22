<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- 로그인 세션 유무에 따라 버튼 분기 -->
	<c:set var="loginBtn" value="Log In"></c:set>
	<c:set var="loginUrl" value="${pageContext.request.contextPath}/login"></c:set>
	<c:if test="${loginCustomer != null}">
		<c:set var="loginBtn" value="Log Out"></c:set>
		<c:set var="loginUrl" value="${pageContext.request.contextPath}/logout"></c:set>
	</c:if>
	<!-- start header Area -->
	<header id="header">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-8 header-top-left no-padding">
					</div>
					<div class="col-lg-6 col-sm-6 col-4 header-top-right no-padding">
						<c:if test="${loginCustomer != null}">
							<a class="book-now" href="${pageContext.request.contextPath}/customerMyPage">My Page</a>
						</c:if>
						<a class="book-now" href="${loginUrl}">${loginBtn}</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="customer/img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a class="active" href="index.html">Home</a></li>
						<li><a href="about.html">About</a></li>
						<li><a href="trainers.html">Trainers</a></li>
						<li class="menu-has-children"><a href="">Blog</a>
							<ul>
								<li><a href="blog-home.html">Blog Home</a></li>
								<li><a href="blog-single.html">Blog Single</a></li>
							</ul>
						</li>
						<li class="menu-has-children"><a href="">Pages</a>
							<ul>
								<li><a href="schedule.html">Schedule</a></li>
								<li><a href="courses.html">Courses</a></li>
								<li><a href="elements.html">Elements</a></li>
							</ul>
						</li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</nav><!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- end header Area -->