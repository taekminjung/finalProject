<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
               <img id="img1" src="${pageContext.request.contextPath }/upload/emp/"
			 class="rounded-circle" width="20" height="20" onerror="this.src='${pageContext.request.contextPath }/upload/emp/default.jpg'" alt="user Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">${loginEmployee.employeeName}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img id="img2" src="${pageContext.request.contextPath }/upload/emp/"
			 class="rounded-circle" width="20" height="20" onerror="this.src='${pageContext.request.contextPath }/upload/emp/default.jpg'" alt="user Image">
                <p>
          		  ${loginEmployee.employeeName}
                  <small>${loginEmployee.branchName}지점 트레이너</small>
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
          <img id="img3" src="${pageContext.request.contextPath }/upload/emp/"
			 class="img-circle" width="20" height="20" onerror="this.src='${pageContext.request.contextPath }/upload/emp/default.jpg'" alt="user Image">
        </div>
        <div class="pull-left info">
          <p><a href="${mypageUrl}">${loginEmployee.employeeName}</a></p>
          <!-- Status -->
          <a id="statusLink"><i class="fa fa-circle text-success"></i> 출근중💼</a>
        </div>
      </div>

      <!-- 검색 하기 -->
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
        <li><a href="${pageContext.request.contextPath}/trainerNotice"><i class="fa fa-bullhorn"></i><span>공지사항</span></a></li>
        <li><a href="${pageContext.request.contextPath}/trainerQuestion"><i class="fa fa-question"></i><span>문의사항</span></a></li>
        <li><a href="${pageContext.request.contextPath}/"><i class="fa fa-question"></i><span>상담신청</span></a></li>
        <li><a href="${pageContext.request.contextPath}/trainerReview?employeeId=${loginEmployee.employeeId}&programNo="><i class="fa fa-pencil"></i><span>프로그램 후기</span></a></li>
        <li class="treeview">
          <a href=""><i class="fa fa-cube"></i> <span>재고관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
          	<li><a href="${pageContext.request.contextPath}/trainerStock?branchNo=${loginEmployee.branchNo}">재고 현황</a></li>
            <li><a href="${pageContext.request.contextPath}/sportsEquipmentOrderForm?branchNo=${loginEmployee.branchNo}">발주 신청</a></li>
            <li><a href="${pageContext.request.contextPath}/trainerExpireForm?branchNo=${loginEmployee.branchNo}">폐기 신청</a></li>
          </ul>
        </li>

		<li class="treeview">
          <a href="">
          	<i class="fa fa-book"></i> <span>프로그램 목록</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" id="tree"></ul>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>
  
<script>
  $(document).ready(function(){
  $.ajax({
		url:'/haribo/employeeImg',
		method:'get',
		data:{'employeeNo':${loginEmployee.employeeNo}},
		success:function(json){
			console.log(json);
			$('#img1').attr('src','upload/emp/'+json);
			$('#img2').attr('src','upload/emp/'+json);
			$('#img3').attr('src','upload/emp/'+json);
		},
		error:function(err){
			console.log(err);
		}
			});
  
  $.ajax({
		url:'/haribo/selectProgramListByTrainer',
		method:'get',
		data:{'employeeId':"${loginEmployee.employeeId}"},
		success:function(json){
			console.log(json);
			$(json).each(function(index,item){
				$('#tree').append('<li><a href="${pageContext.request.contextPath}/trainerProgramDate?programNo='+item.programNo+'">'+item.programName+'</a></li>');
			})
		},
		error:function(err){
			console.log(err);
		}
			});
	});
  
  
	
  
</script>