<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>홈페이지</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/_all-skins.min.css">
  

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  
  <%@include file="/inc/adminHeader.jsp" %>
  
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        홈페이지
        <small>관리자 전용</small>
      </h1>
    </section>

    <!-- Main content -->
  <section class="content">

  <div class="row">
    <div class="col-md-6">
      <!-- Bar Chart -->
      <div class="box box-success">
        <div class="box-header with-border">
          <h3 class="box-title">Monthly Revenue</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body">
          <canvas id="barChart"></canvas>
        </div>
      </div>
    </div>

    <div class="col-md-6">
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
        <div class="col-md-5">
          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">발주 알림</h3>
            </div>
            <div class="box-body">
              <strong><i class="fa fa-user margin-r-5"></i>재고관리</strong>
              <p class="text-muted">
					<input type="hidden" name="notAccept" value="${notAccept}" readonly style="border:none">
					<tr>
						<td>현재 확인되지 않은 발주는 총 ${notAccept} 건 입니다.</td>
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
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.13
    </div>
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
        var datasum = [];
        
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
                        'rgba(54,165,235,0.2)',
                        'rgba(75,192,192,0.2)',
                        'rgba(255,99,132,0.2)',
                        'rgba(54,165,235,0.2)',
                        'rgba(75,192,192,0.2)',
                        'rgba(255,99,132,0.2)',
                        'rgba(54,165,235,0.2)',
                        'rgba(75,192,192,0.2)',
                        'rgba(255,99,132,0.2)',
                        'rgba(54,165,235,0.2)',
                        'rgba(75,192,192,0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54,165,235,1)',
                        'rgba(75,192,192,1)',
                        'rgba(255,99,132,1)',
                        'rgba(54,165,235,1)',
                        'rgba(75,192,192,1)',
                        'rgba(255,99,132,1)',
                        'rgba(54,165,235,1)',
                        'rgba(75,192,192,1)',
                        'rgba(255,99,132,1)',
                        'rgba(54,165,235,1)',
                        'rgba(75,192,192,1)'
                    ]
                }]
            }
        });
    }
});
</script>

</body>
</html>
