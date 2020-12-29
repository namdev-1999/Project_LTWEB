<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.nlu.banana.model.Order" %>
<%@ page import="vn.nlu.banana.model.ListOrder" %>
<%@ page import="vn.nlu.banana.model.OrderItem" %>
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
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin - Quản lý đơn hàng</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/elegant-admin/"/>
    <!-- Editable CSS -->
    <link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid.min.css"/>
    <link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid-theme.min.css"/>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="stylesheet" href="dist/css/style-ltw.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="skin-default-dark fixed-layout lock-nav">

<% ArrayList<Order> list = ListOrder.getListOfOrder();
    String numPage = "";
    if (request.getParameter("page") != null) {
        numPage = request.getParameter("page");
    } else {
        numPage = "1";
    }
%>
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
                    <h4 class="text-themecolor">Quản lý đơn hàng</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Quản lý đơn hàng</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-12">
                    <!-- Column -->
                    <div class="card">
                        <div class="card-body row">
                            <div class="col-md-3 align-self-center">
                                <h4 class="card-title">Bảng đơn hàng</h4></div>
                            <div class="col-md-9 align-self-center text-right">
                                <div class="d-flex justify-content-end align-items-center">
                                    <div class="nav-item search-box">
                                        <form class="app-search d-flex justify-content-end">
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập thông tin &amp; enter">
                                            <button type="button" class="btn btn-success" s><i
                                                    class="fa fa-search"></i>
                                            </button>
                                        </form>
                                    </div>


                                    <div class="small-space" style="height: 80px;width: 1px"></div>
                                </div>
                            </div>
                            <div id="ordertable" class="jsgrid" style="position: relative; height: 500px; width: 100%;">
                                <div class="jsgrid-grid-header overflow-hidden">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tr class="jsgrid-header-row">
                                            <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header"
                                                style="width: 50px;">ID
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 130px;">Người đặt
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 130px;">Địa chỉ
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 68px;">SĐT
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 68px;">Trạng thái
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 68px;">Ngày đặt
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 68px;">Tổng tiền
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 68px;">Thanh toán
                                            </th>
                                            <%--                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"--%>
                                            <%--                                                style="width: 68px;">Code--%>
                                            <%--                                            </th>--%>
                                            <th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 68px;">Tác vụ
                                            </th>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jsgrid-grid-body overflow-hidden" style="height: 394.4px;">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tbody>
                                        <% int i = 0;
                                            int p = 0;
                                            for (Order o : list) {
                                                i++;
                                                p++;
                                        %>
                                        <tr class="jsgrid-row" style="height: 50px">
                                            <td class="jsgrid-cell jsgrid-align-center"
                                                style="width: 50px;"><%=o.getId()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 130px;"><%=o.getName()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 130px;"><%=o.getAddress()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 68px;"><%=o.getPhone()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 68px;"><%if (o.getStatus() == 1) {%>Chờ xác nhận <%}%>
                                                <%if (o.getStatus() == 2) {%>Đang giao hàng <%}%>
                                                <%if (o.getStatus() == 3) {%>Đã giao hàng<%}%>
                                                <%if (o.getStatus() == 4) {%>Đã hủy<%}%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 68px;"><%=o.getDate()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 68px;"><%=o.getTotal()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 68px;"><%if (o.getPayment() == 789) {%>COD<%}%>
                                            </td>
                                            <%--                                            <td class="jsgrid-cell jsgrid-align-left"--%>
                                            <%--                                                style="width: 68px;"><%=o.getCode()%>--%>
                                            <%--                                            </td>--%>
                                            <td class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 68px;">
                                                <button class="view-detail" style=""
                                                        data-toggle="modal" data-target="#myModal<%=i%>">
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                                <div id="myModal<%=i%>" class="modal">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Chi tiết</h4>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">&times;
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <table class="table">
                                                                    <thead class="thead-light">
                                                                    <tr>
                                                                        <th scope="col">#</th>
                                                                        <th scope="col">Sản phẩm</th>
                                                                        <th scope="col">Size</th>
                                                                        <th scope="col">Giá</th>
                                                                        <th scope="col">Số lượng</th>
                                                                        <th scope="col">Tổng</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <% int k = 0;
                                                                        double bigTotal = 0;
                                                                        for (OrderItem ot : ListOrder.getListOrderById(o.getId())) {
                                                                            bigTotal += ot.getTotal();
                                                                            k++;
                                                                    %>
                                                                    <tr>
                                                                        <th scope="row"><%=k%>
                                                                        </th>
                                                                        <td><%=ot.getName()%>
                                                                        </td>
                                                                        <td><%=ot.getSize()%>
                                                                        </td>
                                                                        <td><%=ot.getPrice()%>
                                                                        </td>
                                                                        <td><%=ot.getQuantity()%>
                                                                        </td>
                                                                        <td><%=ot.getTotal()%>
                                                                        </td>
                                                                    </tr>
                                                                    <% }%>
                                                                    <tr>
                                                                        <th scope="row"></th>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td><span>Tổng đơn: </span><%=bigTotal%>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                        data-dismiss="modal">Đóng
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="jsgrid-button jsgrid-edit-button" data-toggle="modal"
                                                        data-target="#edit<%=p%>" type="button"
                                                        title="Edit">
                                                </button>
                                            </td>
                                        </tr>
                                        <div id="edit<%=p%>" class="modal ">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Cập nhật</h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">&times;
                                                        </button>
                                                    </div>
                                                    <form action="<%=Util.fullPath("UpdateStatus")%>"
                                                          method="post">
                                                        <div class="modal-body">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <input type="text" name="id" hidden value="<%=o.getId()%>">
                                                                    <label
                                                                           class="title-la">
                                                                        <b>Tên người nhận:</b> <%=o.getName()%>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <label
                                                                           class="title-la">
                                                                        <b> Địa chỉ người nhận:</b> <%=o.getAddress()%>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <label
                                                                           class="title-la">
                                                                        <b>Số điện thoại người
                                                                            nhận:</b> <%=o.getPhone()%>
                                                                    </label>
                                                                </div>
                                                                <div class="form-group col-md-12 d-flex">
                                                                    <!--Size-->
                                                                    <label class="title-la col-3"> <b>Trạng thái</b>
                                                                    </label>
                                                                    <br/>
                                                                    <div class="button-group col-6">
                                                                        <button type="button"
                                                                                class="d-flex justify-content-between border dropdown-toggle form-control"
                                                                                data-toggle="dropdown"
                                                                                aria-haspopup="true"
                                                                                aria-expanded="true">
                                                                            <span><%if (o.getStatus() == 1) {%>Chờ xác nhận <%}%>
                                                <%if (o.getStatus() == 2) {%>Đang giao hàng <%}%>
                                                <%if (o.getStatus() == 3) {%>Đã giao hàng<%}%>
                                                <%if (o.getStatus() == 4) {%>Đã hủy<%}%></span>
                                                                            <span class="caret"></span>
                                                                        </button>
                                                                        <ul class="dropdown-menu checkbox-menu allow-focus"
                                                                            style="width: 95%" data-flip="false"
                                                                            data-boundary="window"
                                                                            aria-labelledby="size">
                                                                            <li>
                                                                                <label>
                                                                                    <input type="radio"
                                                                                           name="status"
                                                                                           value="1"
                                                                                           class="form-c" <%=o.getStatus()==1 ? "checked":""%>>
                                                                                    Chờ giao hàng
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label>
                                                                                    <input type="radio"
                                                                                           name="status"
                                                                                           value="2"
                                                                                           class="form-c" <%=o.getStatus()==2 ? "checked":""%>> Đang giao
                                                                                    hàng
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label>
                                                                                    <input type="radio"
                                                                                           name="status"
                                                                                           value="3"
                                                                                           class="form-c" <%=o.getStatus()==3 ? "checked":""%>> Đã giao hàng
                                                                                </label>
                                                                            </li>
                                                                            <li>
                                                                                <label>
                                                                                    <input type="radio"
                                                                                           name="status"
                                                                                           value="4"
                                                                                           class="form-c" <%=o.getStatus()==4 ? "checked":""%>> Đã hủy
                                                                                </label>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!--End size-->
                                                                </div>
                                                            </div>


                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-info form-add">
                                                                Lưu
                                                            </button>
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                                <%--Pagination--%>
                                <% double countPage = 0;
                                    if (list.size() % 15 == 0) {
                                        countPage = (double) list.size() / (double) 15;
                                    } else {
                                        countPage = (double) list.size() / (double) 15 + 1;
                                    }

                                %>
                                <div class="jsgrid-pager-container" style="">
                                    <div class="jsgrid-pager">Trang:
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="order-manage.jsp?page=<%=1%>">Đầu</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="order-manage.jsp?page=<%=(Integer.parseInt(numPage)-1)%>">Trước</a></span>
                                        <% for (int j = 1; j <= (int) countPage; j++) {
                                            if (Integer.parseInt(numPage) == j) {
                                        %>
                                        <span class="jsgrid-pager-page jsgrid-pager-current-page"><%=j%></span>
                                        <%} else {%>
                                        <span class="jsgrid-pager-page"><a
                                                href="order-manage.jsp?&page=<%=j%>"><%=j%></a></span>
                                        <% }
                                        }
                                        %>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="order-manage.jsp?page=<%=(Integer.parseInt(numPage)+1)%>">Sau</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="order-manage.jsp?page=<%=(int) countPage%>">Cuối</a></span>
                                        &nbsp;&nbsp; <%=numPage%> of <%=(int) countPage%>
                                    </div>
                                </div>
                                <div class="jsgrid-load-shader"
                                     style="display: none; position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 1000;"></div>
                                <div class="jsgrid-load-panel"
                                     style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">
                                    Please, wait...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End PAge Content -->
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
        © 2019 Admin By Group Banana
    </footer>
</div>
<script data-cfasync="false" src="cdn-cgi/scripts/email-decode.min.js"></script>
<script src="assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="assets/node_modules/popper/popper.min.js"></script>
<script src="assets/node_modules/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="dist/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="dist/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
<script src="assets/node_modules/sparkline/jquery.sparkline.min.js"></script>
<!--Custom JavaScript -->
<script src="dist/js/custom.min.js"></script>
<!-- Editable -->
<script type="text/javascript" src="assets/node_modules/jsgrid/jsgrid.min.js"></script>

</body>

</html>