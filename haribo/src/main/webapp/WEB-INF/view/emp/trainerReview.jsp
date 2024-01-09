<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>리뷰 게시판(트레이너)</title>
  <!-- 파비콘 코드 -->
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- header 시작 부분 -->
  <!-- inc 폴더의 TrainerNavi.jsp를 include -->
  <jsp:include page="/inc/trainerNavi.jsp"></jsp:include>
  <!-- header 끝나는 부분 -->

  <!-- aside 작성 뒤 항상 이 부분이 메인 컨텐츠 부분이 됨 -->
  <!-- 헤더 + 내용 wrapper 부분 시작 -->
  <div class="content-wrapper">
    <!-- 페이지 메인 헤더 -->
    <section class="content-header">
    <h3>리뷰 게시판</h3>
    <div class="box-tools">
		<div class="input-group input-group-sm hidden-xs" style="width: 300px;">
		  <input type="text" name="table_search" class="form-control pull-right" placeholder="검색어를 입력하세요">
			
		  <div class="input-group-btn">
		    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
		  </div>
		</div>
     </div>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-body table-responsive no-padding text-center">
              <table class="table table-hover text-center">
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>참여 프로그램 명</th>
                  <th>작성자</th>
                  <th>작성일</th>
                </tr>
                
                <c:forEach var="r" items="${trainerlist}">
                <tr>
                  <td>${r.reviewNo}</td>
                  <td><a href="${pageContext.request.contextPath}/trainerReviewOne?reviewNo=${r.reviewNo}">${r.reviewTitle}</a></td>
                  <td>${r.programName}</td>
                  <td>${r.customerId}</td>
                  <td>${r.createdate}</td>
                </tr>
                </c:forEach>
              </table>
            </div>
            <!-- 페이지네이션 -->
            <div class="text-center"> 
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/trainerReview?currentPage=${currentPage-1}" class="btn btn-primary">이전</a>
				</c:if>
				
				<c:if test="${currentPage < lastPage}">
					<a href="${pageContext.request.contextPath}/trainerReview?currentPage=${currentPage+1}" class="btn btn-primary">다음</a>
				</c:if>
			</div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </section>
  </div>
  <!-- 헤더 + 내용 wrapper 부분 끝 -->

  <!-- 메인 footer 항상 적을 것 -->
  <footer class="main-footer">
    <!-- 맨 오른쪽 표시되는 것 -->
    <div class="pull-right hidden-xs">
      팀 하리보
    </div>
    <!-- 저작권 명시 -->
    <strong>Copyright &copy; 2023-2024 <a href="trainerHome">TEAM HARIBO</a>.</strong> All rights reserved.
  </footer>
  
  
  <div class="control-sidebar-bg"></div>
</div>
<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="emp/dist/js/adminlte.min.js"></script>

</body>
</html>