<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>하리보팀 파이널프로젝트</title>
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
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>운동 기구 수정 페이지 <small>Preview</small></h1>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-6">
                        <!-- general form elements -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Update Sports Equipment</h3>
                            </div>
                            <div class="box-body">
                                <form id="form" name="form" method="post" action="${pageContext.request.contextPath}/updateSportsEquipment">
                                    <input type="hidden" name="sportsEquipmentNo" value="${param.sportsEquipmentNo}">
                                    <div class="form-group">
                                        <label for="itemName">운동 기구 제품명</label>
                                        <input type="text" class="form-control" id="itemName" name="itemName" value="${param.itemName}">
                                    </div>
                                    <div class="form-group">
                                        <label for="itemPrice">가격</label>
                                        <input type="text" class="form-control" id="itemPrice" name="itemPrice" value="${param.itemPrice}">
                                    </div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- ./wrapper -->
        <!-- jQuery 3 -->
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
    </body>
</html>
