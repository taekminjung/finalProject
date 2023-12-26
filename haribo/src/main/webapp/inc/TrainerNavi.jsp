<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
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
              <span class="hidden-xs">트레이너 이름</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="emp/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
                  트레이너 이름
                  <small>일한 기간</small>
                </p>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">마이페이지</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">로그아웃</a>
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
          <p>트레이너 이름</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> 출근중💼</a>
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
            <li><a href="#">A 클래스</a></li>
            <li><a href="#">B 클래스</a></li>
            <li><a href="#">C 클래스</a></li>
          </ul>
        </li>
      </ul>
      
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>