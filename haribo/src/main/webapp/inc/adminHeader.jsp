<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

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
              <img id="img1" src="${pageContext.request.contextPath }/upload/emp/"
			 class="rounded-circle" width="20" height="20" onerror="this.src='${pageContext.request.contextPath }/upload/emp/default.jpg'" alt="user Image">
              <span class="hidden-xs">${loginEmployee.employeeId}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img id="img2" src="${pageContext.request.contextPath }/upload/emp/"
			 class="rounded-circle" width="20" height="20" onerror="this.src='${pageContext.request.contextPath }/upload/emp/default.jpg'" alt="user Image">
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
          <img id="img3" src="${pageContext.request.contextPath }/upload/emp/"
			 class="img-circle" width="20" height="20" onerror="this.src='${pageContext.request.contextPath }/upload/emp/default.jpg'" alt="user Image">
        </div>
        <div class="pull-left info">
          <a href="${pageContext.request.contextPath}/employeeInfo"><p><strong>${loginEmployee.employeeName}님</strong></p></a>
	<a href="#" id="statusLink"><i class="fa fa-circle text-success"></i> Online</a>

        </div>
      </div>
      
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">메뉴</li>
        <li>
          <a href="${pageContext.request.contextPath}/noticeList">
            <i class="fa fa-bullhorn"></i> <span>공지사항</span>
          </a>
       </li>
       
        <li>
          <a href="${pageContext.request.contextPath}/employeeQuestion">
            <i class="fa fa-question"></i> <span>문의사항</span>
          </a>
       </li>
     
       <li>
          <a href="${pageContext.request.contextPath}/employeeReview">
            <i class="fa fa-pencil"></i> <span>리뷰게시판</span>
          </a>
       </li>  
       
        <li class="treeview">
          <a href="#"><i class="fa fa-cube"></i> <span>재고관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/sportsEquipmentOrderCk"><i class="fa fa-circle-o"></i>발주 확인</a></li>
            <li><a href="${pageContext.request.contextPath}/branchStock"><i class="fa fa-circle-o"></i>지점별 재고현황</a></li>
          </ul>
        </li>

		<li class="treeview">
          <a href="${pageContext.request.contextPath}/trainerProgram"><i class="fa fa-book"></i> <span>프로그램 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/programList"><i class="fa fa-circle-o"></i>프로그램 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/insertProgram"><i class="fa fa-circle-o"></i>프로그램 추가</a></li>
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

        <li class="treeview">
          <a href="${pageContext.request.contextPath}/trainerManagement"><i class="fa fa-user"></i> <span>운동기구 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/sportsEquipmentList"><i class="fa fa-users"></i>운동기구 리스트</a></li>
            <li><a href="${pageContext.request.contextPath}/insertSportsEquipment"><i class="fa fa-user-plus"></i>운동기구 추가</a></li>
          </ul>
        </li>
        
        <li>
          <a href="${pageContext.request.contextPath}/sportsEquipmentExpiredList">
            <i class="fa fa-trash"></i> <span>폐기물 대장</span>
          </a>
       </li>
        
       <li>
          <a href="${pageContext.request.contextPath}/customerList">
            <i class="fa fa-pencil"></i> <span>회원 조회</span>
          </a>
       </li>  
        
      </ul>

    </section>
    <!-- /.sidebar -->
  </aside>
  
 <script>
<!--
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
-->  
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
	});
</script>