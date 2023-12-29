<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:set var="logoutBtn" value="로그아웃"></c:set>
	<c:set var="logoutUrl" value="${pageContext.request.contextPath}/logout"></c:set>
  	<c:set var="mypageBtn" value="마이페이지"></c:set>
  	<c:set var="mypageUrl" value="${pageContext.request.contextPath}/employeeInfo?employeeNo=${loginEmployee.employeeNo}"></c:set>
  	
  	
    <header class="main-header">

    <!-- Logo -->
    <a href="adminHome" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>H</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>TEAM</b>HARIBO</span>
    </a>

    <nav class="navbar navbar-static-top" role="navigation">

      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
        
          <li class="dropdown user user-menu">
            <a href="" class="dropdown-toggle" data-toggle="dropdown">
              <img src="emp/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${loginEmployee.employeeId}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="emp/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
                  ${loginEmployee.employeeId}
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
    
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="emp/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>관리자명</p>
	<a href="#" id="statusLink"><i class="fa fa-circle text-success"></i> Online</a>






        </div>
      </div>
      
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                  <i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">메뉴</li>
        <li>
          <a href="${pageContext.request.contextPath}/noticeList">
            <i class="fa fa-bullhorn"></i> <span>공지사항</span>
          </a>
       </li>
       
        <li>
          <a href="${pageContext.request.contextPath}/questionList">
            <i class="fa fa-question"></i> <span>문의사항</span>
          </a>
       </li>
     
       <li>
          <a href="${pageContext.request.contextPath}/reviewList">
            <i class="fa fa-pencil"></i> <span>리뷰게시판</span>
          </a>
       </li>  
       

    
        <li class="treeview">
          <a href="#"><i class="fa fa-cube"></i> <span>지점별 재고현황</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/sportsEquipmentA"><i class="fa fa-circle-o"></i>A 지점</a></li>
            <li><a href="${pageContext.request.contextPath}/sportsEquipmentB"><i class="fa fa-circle-o"></i>B 지점</a></li>
            <li><a href="${pageContext.request.contextPath}/sportsEquipmentC"><i class="fa fa-circle-o"></i>C 지점</a></li>
          </ul>
        </li>

		<li class="treeview">
          <a href="${pageContext.request.contextPath}/trainerProgram"><i class="fa fa-book"></i> <span>프로그램 목록</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/insertProgram"><i class="fa fa-circle-o"></i>프로그램 추가</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>A 클래스</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>B 클래스</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>C 클래스</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/trainerManagement"><i class="fa fa-user"></i> <span>직원 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/employeeList"><i class="fa fa-users"></i>직원 리스트</a></li>
            <li><a href="${pageContext.request.contextPath}/insertEmployee"><i class="fa fa-user-plus"></i>직원 추가</a></li>
          </ul>
        </li>
        
        
      </ul>

    </section>
    <!-- /.sidebar -->
  </aside>
  
 <script>
  document.getElementById("statusLink").addEventListener("click", function() {
    var statusIcon = document.querySelector("#statusLink i.fa");
    var statusText = document.querySelector("#statusLink");

    if (statusIcon.classList.contains("text-success")) {
      statusIcon.classList.remove("text-success");
      statusIcon.classList.add("text-danger");
  
    } else if (statusIcon.classList.contains("text-danger")) {
      statusIcon.classList.remove("text-danger");
      statusIcon.classList.add("text-secondary"); 

    } else {
      statusIcon.classList.remove("text-secondary");
      statusIcon.classList.add("text-success");
 
    }
  });
</script>