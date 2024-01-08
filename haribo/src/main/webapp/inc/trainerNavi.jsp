<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!-- 로그인 했을 시 emp 정보 출력할 것 -->
	<c:set var="logoutBtn" value="로그아웃"></c:set>
	<c:set var="logoutUrl" value="${pageContext.request.contextPath}/logout"></c:set>
  	<c:set var="mypageBtn" value="마이페이지"></c:set>
  	<c:set var="mypageUrl" value="${pageContext.request.contextPath}/trainerOne?employeeNo=${loginEmployee.employeeNo}"></c:set>

<!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="trainerHome" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>H</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">TEAM <b>HARIBO</b></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="" class="sidebar-toggle" data-toggle="push-menu" role="button"></a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
  
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="emp/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">${loginEmployee.employeeName}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="emp/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
          		  ${loginEmployee.employeeName}
                  <small>일한 기간</small>
                </p>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="${mypageUrl}" class="btn btn-default btn-flat">${myPageBtn}마이페이지</a>
                </div>
                <div class="pull-right">
                  <a href="${logoutUrl}" class="btn btn-default btn-flat">로그아웃</a>
                </div>
              </li>
            </ul>
          </li>
          
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="emp/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><a href="">${loginEmployee.employeeName}</a></p>
          <!-- Status -->
          <a href="#" id="statusLink"><i class="fa fa-circle text-success"></i> 출근중💼</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="검색하기...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">메뉴</li>
        <!-- Optionally, you can add icons to the links -->
        <li><a href="${pageContext.request.contextPath}/trainerNotice"><i class="fa fa-bullhorn"></i> <span>공지사항</span></a></li>
        <li><a href="${pageContext.request.contextPath}/trainerQuestion"><i class="fa fa-question"></i> <span>문의사항</span></a></li>
        <li><a href="${pageContext.request.contextPath}/trainerReview"><i class="fa fa-pencil"></i> <span>리뷰게시판</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-cube"></i> <span>재고관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
          	<li><a href="${pageContext.request.contextPath}/trainerStock">재고 현황</a></li>
            <li><a href="${pageContext.request.contextPath}/trainerStockForm">발주 신청</a></li>
            <li><a href="${pageContext.request.contextPath}/trainerExpireForm">폐기 신청</a></li>
          </ul>
        </li>

		<li class="treeview">
          <a href="${pageContext.request.contextPath}/trainerProgram"><i class="fa fa-book"></i> <span>프로그램 목록</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          
          <ul class="treeview-menu">
        	<c:forEach var="p" items="${list}">
            <li>
                <a href="${pageContext.request.contextPath}/trainerProgramOne?programNo=${p.programNo}">
                    ${p.programName}
                </a>
            </li>
        	</c:forEach>
    	  </ul>
        </li>
        
      </ul>
      
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>
  
  <script>
  document.getElementById("statusLink").addEventListener("click", function() {
    var statusIcon = document.querySelector("#statusLink i.fa");
    var statusText = document.getElementById("#statusLink");

    if (statusIcon.classList.contains("text-success")) {
      statusIcon.classList.remove("text-success");
      statusIcon.classList.add("text-danger");
      statusText.textContent = "퇴근💼";
    } else if (statusIcon.classList.contains("text-danger")) {
      statusIcon.classList.remove("text-danger");
      statusIcon.classList.add("text-info");
      statusText.textContent = "휴가중💼";
    } else {
      statusIcon.classList.remove("text-info");
      statusIcon.classList.add("text-success");
      statusText.textContent = " 출근중💼";
    }
  });
</script>