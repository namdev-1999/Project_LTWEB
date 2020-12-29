<%@ page import="vn.nlu.banana.Util.Util" %>
<%@ page import="vn.nlu.banana.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Banana - Admin</title>
    <link href="assets/node_modules/morrisjs/morris.css" rel="stylesheet">
    <link href="assets/node_modules/toast-master/css/jquery.toast.css" rel="stylesheet">
    <link href="assets/node_modules/c3-master/c3.min.css" rel="stylesheet">
    <link href="dist/css/style.min.css" rel="stylesheet">
    <link href="dist/css/pages/dashboard1.css" rel="stylesheet">
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="stylesheet" href="dist/css/style-ltw.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
    <![endif]-->
</head>

<body class="skin-default-dark fixed-layout lock-nav">
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label"></p>
    </div>
</div>
<div id="main-wrapper">
    <%@include file="top-bar.jsp" %>


    <%@include file="left-sidebar.jsp" %>

    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h4 class="text-themecolor">Trang chủ</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <div class="nav-item search-box">
                            <form class="app-search d-flex justify-content-end">
                                <input type="text" class="form-control" placeholder="Nhập thông tin và enter">
                                <button type="button" class="btn btn-success" s><i
                                        class="fa fa-search"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="card-group">
                <!-- card -->
                <div class="card o-income">
                    <div class="card-body">
                        <form action="<%=Util.fullPath("SetDate")%>">
                            <% Date date;
                                if (request.getSession().getAttribute("date") != null) {
                                    date = (Date) request.getSession().getAttribute("date");
                                } else {
                                    date = new Date(23, 12, 2019);
                                }
                            %>
                            <div class="d-flex m-b-10 no-block">
                                <h4 class="card-title m-b-0 align-self-center">Doanh thu trong ngày.</h4>
                                <input class="ml-2" name="date" type="date" id="date" value="22/12/2019"
                                       placeholder="22/12/2019" onchange="validate()">
                                <button class="ml-1" type="submit">Lọc</button>
                            </div>
                        </form>
                        <div class="d-flex m-b-10 no-block float-right pr-5">
                            <p id="error"></p></div>
                        <%--                        value   --%>
                        <%
                            for (Type t : ListCategory.getListCategory()
                            ) {

                        %>
                        <input type="number" hidden id="<%=t.getId()%>"
                               value="<%=ListOrder.getDoanhThubyIDType(t.getId(),date)%>">
                        <%}%>
                        <div id="income" style="height:260px; width:100%;"></div>
                        <ul class="list-inline m-t-30 text-center font-12">
                            <li><i class="fa fa-circle text-purple"></i> Doanh thu</li>
                            <li><i class="fa fa-circle text-info"></i> Lợi nhuận</li>
                        </ul>
                        <ul class="list-inline m-t-30 text-center font-12">
                            <li>0: Tổng</li>
                            <% int count = 0;
                                for (Type t : ListCategory.getListCategory()
                                ) {
                                    count++;
                            %>
                            <li><%=count + ": " + t.getName()%>
                            </li>
                            <%}%>
                        </ul>
                        <div class="text-center">Doanh thu ngày <%=date.toString()%>
                        </div>
                    </div>
                </div>
                <!-- card -->
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex m-b-30 no-block">
                            <h4 class="card-title m-b-0 align-self-center">Sản phẩm bán được trong tháng</h4>
                            <form action="<%=Util.fullPath("GetMonth")%>" class="d-flex">
                                <div class="ml-1">
                                    <select name="month" class="h-100">
                                        <option type="submit" selected value="1">1</option>
                                        <option type="submit" value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </div>
                                <button class="ml-1 pl-1 pr-1" type="submit">Lọc</button>
                            </form>
                        </div>
                        <%
                            int month = 12;
                            if (request.getSession().getAttribute("month") != null) {
                                month = (int) request.getSession().getAttribute("month");
                            }
                            for (Type t : ListCategory.getListCategory()
                            ) {

                        %>
                        <input type="number" hidden
                               value="<%=ListOrder.getNumberProductInMonthByType(new Date(1,month,2019),t.getId())%>"
                               id="<%=t.getName()+"-inmonth"%>">
                        <%}%>
                        <div id="visitor" style="height:260px; width:100%;"></div>
                        <ul class="list-inline m-t-30 text-center font-12">
                            <li><i class="fa fa-circle text-info"></i>ADIDAS</li>
                            <li><i class="fa fa-circle text-primary"></i> NIKE</li>
                            <li><i class="fa fa-circle text-danger"></i> JORDAN</li>
                            <li><i class="fa fa-circle text-success"></i> OTHER</li>
                        </ul>
                        <div class="text-center">
                            <span>Biểu đồ sản phẩm bán được trong tháng</span> <span><%=  month%></span>
                        </div>
                    </div>

                </div>
                <!-- card -->
                <div class="card">
                    <div class="p-20 p-t-25">
                        <h4 class="card-title">Báo cáo</h4>
                    </div>
                    <div class="d-flex no-block p-15 align-items-center">
                        <div class="round round-info"><i class="icon-wallet font-16"></i></div>
                        <div class="m-l-10 ">
                            <h3 class="m-b-0"><%=s.insert(ListOrder.getDoanhThuByYear(new Date(01, 01, 2019)))%><%=" "%>
                                đ</h3>
                            <h6 class="text-muted font-light m-b-0">Tổng doanh thu năm nay
                            </h6></div>
                    </div>
                    <hr>
                    <div class="d-flex no-block p-15 align-items-center">
                        <div class="round round-primary"><i class="icon-umbrella font-16"></i></div>
                        <div class="m-l-10">
                            <h3 class="m-b-0">18%</h3>
                            <h6 class="text-muted font-light m-b-0">Số người truy cập</h6></div>
                    </div>
                    <hr>
                    <div class="d-flex no-block p-15 m-b-15 align-items-center">
                        <div class="round round-danger"><i class="icon-chart font-16"></i></div>
                        <div class="m-l-10">
                            <h3 class="m-b-0">21090</h3>
                            <h6 class="text-muted font-light m-b-0">Số lượng truy cập năm trước
                            </h6></div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- Yearly Sales -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="card oh">
                        <div class="card-body">
                            <div class="d-flex m-b-30 align-items-center no-block">
                                <h5 class="card-title ">Doanh thu hằng năm</h5>
                                <div class="ml-auto">
                                    <ul class="list-inline font-12">
                                        <li><i class="fa fa-circle text-info"></i> NIKE</li>
                                        <li><i class="fa fa-circle text-primary"></i> YEEZY</li>
                                    </ul>
                                </div>
                            </div>
                            <div id="morris-area-chart" style="height: 350px;"></div>
                        </div>
                        <div class="card-body bg-light">
                            <div class="row text-center m-b-20">
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">6000</h2><span class="text-muted">Total</span>
                                </div>
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">4000</h2><span class="text-muted">NIKE</span>
                                </div>
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">2000</h2><span class="text-muted">YEEZY</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- News -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Right sidebar -->
            <!-- ============================================================== -->
            <!-- .right-sidebar -->
            <div class="right-sidebar">
                <div class="slimscrollright">
                    <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span>
                    </div>
                    <div class="r-panel-body">
                        <ul id="themecolors" class="m-t-20">
                            <li><b>With Light sidebar</b></li>
                            <li><a href="javascript:void(0)" data-skin="skin-default" class="default-theme">1</a></li>
                            <li><a href="javascript:void(0)" data-skin="skin-green" class="green-theme">2</a></li>
                            <li><a href="javascript:void(0)" data-skin="skin-red" class="red-theme">3</a></li>
                            <li><a href="javascript:void(0)" data-skin="skin-blue" class="blue-theme">4</a></li>
                            <li><a href="javascript:void(0)" data-skin="skin-purple" class="purple-theme">5</a></li>
                            <li><a href="javascript:void(0)" data-skin="skin-megna" class="megna-theme">6</a></li>
                            <li class="d-block m-t-30"><b>With Dark sidebar</b></li>
                            <li><a href="javascript:void(0)" data-skin="skin-default-dark"
                                   class="default-dark-theme working">7</a></li>
                            <li><a href="javascript:void(0)" data-skin="skin-green-dark" class="green-dark-theme">8</a>
                            </li>
                            <li><a href="javascript:void(0)" data-skin="skin-red-dark" class="red-dark-theme">9</a></li>
                            <li><a href="javascript:void(0)" data-skin="skin-blue-dark" class="blue-dark-theme">10</a>
                            </li>
                            <li><a href="javascript:void(0)" data-skin="skin-purple-dark"
                                   class="purple-dark-theme">11</a></li>
                            <li><a href="javascript:void(0)" data-skin="skin-megna-dark"
                                   class="megna-dark-theme ">12</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Right sidebar -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
    </div>


    <footer class="footer">
        © 2019 Admin Thiết kế bởi Banana
    </footer>
</div>


<script data-cfasync="false" src="cdn-cgi/scripts/email-decode.min.js"></script>
<script src="assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<script src="assets/node_modules/popper/popper.min.js"></script>
<script src="assets/node_modules/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/js/perfect-scrollbar.jquery.min.js"></script>
<script src="dist/js/waves.js"></script>
<script src="dist/js/sidebarmenu.js"></script>
<script src="dist/js/custom.min.js"></script>
<script src="assets/node_modules/raphael/raphael.min.js"></script>
<script src="assets/node_modules/morrisjs/morris.min.js"></script>
<script src="assets/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="assets/node_modules/d3/d3.min.js"></script>
<script src="assets/node_modules/c3-master/c3.min.js"></script>
<!-- Popup message jquery -->
<script src="assets/node_modules/toast-master/js/jquery.toast.js"></script>
<!-- Chart JS -->
<script src="dist/js/dashboard1.js"></script>

<script>
    function validate() {
        var date = document.getElementById('date').value.split("-")
        console.log(date);
        var isValid = true;
        if (date == "") {
            isValid = false;
        }
        if (isValid == false) {
            document.getElementById('error').innerHTML = 'Sai định dạng';
            document.getElementById('error').style("color", "red");
        } else {
            document.getElementById('error').innerHTML = ''
        }
    }</script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>