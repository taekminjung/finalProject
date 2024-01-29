<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>홈페이지</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <!-- 파비콘 코드 -->
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  <!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
  
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/skin-yellow.min.css">
  

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-yellow sidebar-mini">

<div class="wrapper">
  <!-- 헤더 -->
  <jsp:include page="/inc/adminHeader.jsp"></jsp:include>
  
  <div class="content-wrapper">
    <section class="content-header">
          <h1>안녕하세요, ${loginEmployee.employeeName}님😀<small>오늘도 힘찬 하루 되세요💪🏻</small></h1>
   <br>     <!-- Main content -->

      <div class="row">
        <div class="col-md-6">
          <!-- Bar Chart -->
          <div class="box box-success">
            <div class="box-header with-border text-center">
              <h3 class="box-title"><strong>${year} 월별 매출</strong></h3>
              <div class="box-tools pull-left">
                 <a href="${pageContext.request.contextPath}/adminHome?targetYear=${year -1}" id="prevBtn" class="btn btn-box-tool" style="font-size: 15px;">이전</a>
                 <a href="${pageContext.request.contextPath}/adminHome?targetYear=${year +1}" id="nextBtn" class="btn btn-box-tool" style="font-size: 15px;">다음</a>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body">
              <canvas id="barChart"></canvas>
            </div>
          </div>
        </div>

	    <div class="col-md-2" style="width:30%">
	      <!-- Pie Chart for Employees and Members -->
	      <div class="box box-success">
	        <div class="box-header with-border">
	          <h3 class="box-title">직원 및 회원 수</h3>
	          <div class="box-tools pull-right">
	            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	          </div>
	        </div>
	        <div class="box-body">
	          <canvas id="barChartMember"></canvas>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	   <section class="content">
	      <div class="row">
	        <div class="col-md-6">
	          <!-- About Me Box -->
	          <div class="box box-primary">
	            <div class="box-header with-border">
	              <h3 class="box-title">발주 알림</h3>
	            </div>
	            <div class="box-body">
	              <strong><i class="fa fa-cube margin-r-5"></i>재고관리</strong>
	              <p class="text-muted">
						<input type="hidden" name="notAccept" value="${notAccept}" readonly style="border:none">
						<tr>
							<td>현재 확인되지 않은 발주는 총 <a href="${pageContext.request.contextPath}/sportsEquipmentOrderCk"><span class="badge" style="background-color: #FF1493;"> ${notAccept}</span></a> 건 입니다.</td>
						</tr>
	              </p>
	              <hr>
	            </div>
	          </div>
	        </div>
	        </div>
	    </section>
	  </div>
  <footer class="main-footer">
    <!-- 맨 오른쪽 표시되는 것 -->
    <div class="pull-right hidden-xs">
      팀 하리보
    </div>
    <!-- 저작권 명시 -->
    <strong>Copyright &copy; 2023-2024 <a href="trainerHome">TEAM HARIBO</a>.</strong> All rights reserved.
  </footer>
</div>

<!-- jQuery 3 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="emp/bower_components/fastclick/lib/fastclick.js"></script>
<script src="emp/dist/js/adminlte.min.js"></script>
<script src="emp/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<script src="emp/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="emp/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="emp/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="emp/dist/js/pages/dashboard2.js"></script>
<script src="emp/dist/js/demo.js"></script>

<script>
$(document).ready(function() {
    var ctx = document.getElementById("barChart");
    
    if (ctx) {
        var months = [];
        
        for (var i = 1; i <= 12; i++) {
            months.push(i + "월");
        }

        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: months,
                datasets: [{
                    label: '월별 매출',
                    data: [${jan}, ${feb}, ${mar}, ${apr}, ${may}, ${jun}, ${jul}, ${aug}
                    , ${sep}, ${oct}, ${nov}, ${dec}],
                    backgroundColor: [
                        'rgba(255,99,132,0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54,165,235,0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255,99,132,0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)',
                        'rgba(75,192,192,0.2)',
                        'rgba(54,165,235,0.2)',
                        'rgba(153, 102, 255, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 205, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(54,165,235,1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 205, 86, 1)',
                        'rgba(75,192,192,1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(54,165,235,1)',
                        'rgba(153, 102, 255,1)'
                    ]
                }]
            }
        });
    }
})
    
    var cnt = document.getElementById("barChartMember")
    
    var chart1 = new Chart(cnt, {
        type: 'bar',
        data: {
            labels: ['직원', '회원'],
            datasets: [{
                label: '총 인원',
                data: [${emp}, ${cus}],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)' 
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)' 
                ],
                borderWidth: 1
            }]
        },
        options: {
        	scales: {
        		y: {
        			suggestedMin: 1, // Set the default y-axis value to 1
        			stepSize: 1
        		}
        	}
        }
    });
    

</script>

</body>
</html>
