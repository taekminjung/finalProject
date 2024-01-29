<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>트레이너 프로그램 날짜 추가</title>
  <!-- 파비콘 코드 -->
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  <!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
  <!-- programdate css -->
  <link rel="stylesheet" href="emp/css/programDate.css">
  <link rel="stylesheet" href="emp/css/programHome.css">
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
      <div class="callout callout-info">
        <h4>📢팀 하리보 공지사항📢</h4>
		<p>한달치 스케줄 결재는 매달 19일에 이루어지니 미리 결재 올려주세요. 📅본인 프로그램 스케줄 확인 필수!!📅</p>
      </div>
    </section>

	<!-- 왼쪽에는 프로그램 일정 추가 달력, 오른쪽에는 프로그램 상세 정보 출력 -->
	<div class="row">
	    <div class="col-md-8">
	    <!-- 첫번째 섹션 달력 -->
	    <section class="content container-fluid">
		<div class="box box-info">
			<div style="text-align: center;">
				<h2>${calMap.targetYear}년 ${calMap.targetMonth +1}월</h2>
				
				<a style="float:left" class="btn" 
				href="${pageContext.request.contextPath}/trainerProgramDate?employeeNo=${loginEmployee.employeeNo}&programNo=${programDate.programNo}&targetYear=${calMap.targetYear}&targetMonth=${calMap.targetMonth -1}">
					이전 달
				</a>
				<a style="float:right" class="btn" 
				href="${pageContext.request.contextPath}/trainerProgramDate?employeeNo=${loginEmployee.employeeNo}&programNo=${programDate.programNo}&targetYear=${calMap.targetYear}&targetMonth=${calMap.targetMonth +1}">
					다음 달
				</a>
			</div>
			
			<!-- 달력 부분 -->
			<form action="${pageContext.request.contextPath}/trainerProgramDate" method="post">
			<input type="hidden" name="targetYear" value="${calMap.targetYear}">
			<input type="hidden" name="targetMonth" value="${calMap.targetMonth+1}">
			<input type="hidden" name="programNo" value="${programDate.programNo}">
			<table class="table table-bordered" style="font-size:15px; table-layout: fixed;">
				<tr>
					<th class="col-lg-1" style="color:red; text-align:center;">일</th>
					<th class="col-lg-1" style="text-align:center;">월</th>
					<th class="col-lg-1" style="text-align:center;">화</th>
					<th class="col-lg-1" style="text-align:center;">수</th>
					<th class="col-lg-1" style="text-align:center;">목</th>
					<th class="col-lg-1" style="text-align:center;">금</th>
					<th class="col-lg-1" style="text-align:center;">토</th>
				</tr>
				<tr style="height:130px;">
				<c:forEach var="i" begin="1" end="${calMap.totalTd}" step="1">
					<c:set var="d" value="${i - calMap.beginBlank }" />
					
					<!-- 첫번째 칸(일요일) -->
					<c:if test="${i % 7 == 1 }">
						<td class="date" date="${d}" style="color:red">
					</c:if>
					
					<!-- 그 외 칸(월화수목금토) -->
					<c:if test="${!(i % 7 == 1)}">
						<td class="date" date="${d}">
					</c:if>
					
					<!-- 날짜 추가하기 -->
					<c:if test="${d < 1 || d > calMap.lastDate}">
						&nbsp;
					</c:if>
					
					<c:if test="${!(d < 1 || d > calMap.lastDate)}">
						${d}
						<br />
						<c:forEach var="pd" items="${pdList}" varStatus="status">
							<c:if test="${d == pd.programDateDay && pd.programNo == resultProgram.programNo}">
								<c:set var="isAlreadyBooked" value="1" />
							    <span class="badge program-badge" style="color: black; 
							        background-color: 
							        <c:choose>
							            <c:when test="${pd.programNo % 5 == 0 }">#5CEEE6;</c:when>
							            <c:when test="${pd.programNo % 5 == 1 }">#AAB9FF;</c:when>
							            <c:when test="${pd.programNo % 5 == 2 }">#FFC0CB;</c:when>
							            <c:when test="${pd.programNo % 5 == 3 }">#FAF58C;</c:when>
							            <c:when test="${pd.programNo % 5 == 4 }">#DD78F6;</c:when>
							            <c:otherwise>#3CC8C8;</c:otherwise>
							        </c:choose>
							    ">
							        ${pd.programName}
							    </span>
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${isAlreadyBooked == 1}">
								<c:set var="isAlreadyBooked" value="0"/>
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="date-checkbox" name="d" date="${d}" value="${d}" style="width: 25px; height: 30px;" />
							</c:otherwise>
						</c:choose>
					</c:if>
					</td>
					<c:if test="${i < calMap.totalTd && i % 7 == 0}">
						</tr><tr style="height:130px;">	
					</c:if>
				</c:forEach>
			</table>
			
			<button type="submit" id="addbtn" class="btn btn-info pull-right btn-lg">스케줄 추가하기</button>
			</form>
		</div>
	    </section>
	    </div>
	    
	    <!-- 두 번째 섹션 (프로그램 정보) -->
	    <div class="col-md-4">
	    <!-- 프로그램 정보에 대한 내용 추가 -->
		<section class="content container-fluid">
		<div>
		<div class="box box-info">
          <div class="box-header">
            <h3 class="text-center">${resultProgram.programName}</h3>

            <p class="text-center">${resultProgram.employeeName}</p>
        
            <div style ="text-align:center;">
            <img class="img-square" src="${pageContext.request.contextPath}/upload/emp/${resultProgram.programImgFileName}" width="50%">
		    </div>
          </div>
           
          <div class="box-body">
             <ul class="list-group list-group-unbordered">
               <li class="list-group-item">
               <strong><i class="fa fa-book margin-r-5"></i> 프로그램 설명</strong>
               <p class="text-muted">${resultProgram.programMemo}</p>
               </li>
               <li class="list-group-item">
               <strong><i class="fa fa-pencil margin-r-5"></i> 프로그램 진행 요일</strong>
               <p class="text-muted"> ${resultProgram.programDay}요일</p>
               </li>
               <li class="list-group-item">
               <strong><i class="fa fa-book margin-r-5"></i> 프로그램 정원</strong>
               <p class="text-muted"> ${resultProgram.programMaxCustomer}명</p>
               </li>              
             </ul>
             <strong><i class="fa fa-thumbs-o-up margin-r-5"></i> 많은 이용 바랍니다 헤헤 항상 친절하게 모시겟습미다</strong>
          </div>
            <!-- /.box-body -->
        </div>
		</div>

		</section>
	    </div>
	    <!-- 페이지 메인 내용 끝 -->
  </div>
  <!-- 헤더 + 내용 wrapper 부분 끝 -->
</div>
  <!-- 메인 footer 항상 적을 것 -->
  <footer class="main-footer">
    <!-- 맨 오른쪽 표시되는 것 -->
    <div class="pull-right hidden-xs">
      팀 하리보
    </div>
    <!-- 저작권 명시 -->
    <strong>Copyright &copy; 2023-2024 <a href="${pageContext.request.contextPath}/trainerHome">TEAM HARIBO</a>.</strong> All rights reserved.
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

<script>
$(() => {
	$('.date').each((index, element) => {
		const $elem = $(element);
		const date = $elem.attr('date');
		
		const inputElement = $elem.find('input[date=' + date + ']')[0];
		if (!inputElement) return;
		
		$elem.on('click', () => {
			const $inputElem = $(inputElement);
			const checked = $inputElem.is(':checked');
			console.log(inputElement);
			console.log($(inputElement));
			console.log(checked);
			
			if (checked){
				$elem.removeClass('checked');
				$inputElem.prop('checked', false);
			} else {
				$elem.addClass('checked');
				$inputElem.prop('checked', true);
			}
		});
	});
});


	$(document).ready(function () {
	    $('#addbtn').click(function (event) {
	        var isChecked = false;
	
	        // 각 체크박스를 확인하여 하나라도 선택되었는지 확인
	        $('.date-checkbox').each(function () {
	            if ($(this).is(':checked')) {
	                isChecked = true;
	                return false;  // 하나라도 선택되었으면 반복문 종료
	            }
	        });
	
	        // 아무것도 선택되지 않았을 때 경고창 띄우고 폼 제출 막기
	        if (!isChecked) {
	            event.preventDefault(); // 폼 전송 막음
	            alert("날짜를 추가해주세요");
	        }
	    });
	});
</script>
</body>
</html>