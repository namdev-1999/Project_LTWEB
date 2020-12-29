<%@ page import="vn.nlu.banana.Util.Util" %>
<%@ page import="vn.nlu.banana.model.ListUser" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
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
    <title>Admin - Quản lý người dùng</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/elegant-admin/"/>
    <!-- Editable CSS -->
    <link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid.min.css"/>
    <link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid-theme.min.css"/>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="stylesheet" href="dist/css/style-ltw.css">

</head>

<body class="skin-default-dark fixed-layout lock-nav">
<%
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
                    <h4 class="text-themecolor">Quản lý người dùng</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Quản lý người dùng</li>
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
                                <h4 class="card-title">Bảng người dùng</h4></div>
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

                                    <!-- Modal-->
                                    <button type="button" class=" btn btn-info d-none d-lg-block m-l-15 btn-add "
                                            data-toggle="modal" data-target="#myModal">
                                        <i class="fa fa-plus-circle"></i> Thêm
                                    </button>
                                    <div id="myModal" class="modal ">
                                        <div class="modal-dialog">
                                            <form action="<%=Util.fullPath("Add")%>" method="post">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Thêm người dùng</h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">&times;
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-row">
                                                            <div class="form-group col-md-6">
                                                                <input class="hidden" type="hidden" name="command"
                                                                       value="user">
                                                                <label for="email" class="title-la">Email
                                                                </label>
                                                                <input type="email" class="form-control"
                                                                       id="email"
                                                                       placeholder="Email" name="email">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="password" class="title-la">Mật khẩu
                                                                </label>
                                                                <input type="password" class="form-control"
                                                                       id="password"
                                                                       placeholder="******" name="password">
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-8">
                                                                <label for="user" class="title-la"> Tên người dùng
                                                                </label>
                                                                <input type="text" class="form-control"
                                                                       id="user" placeholder="Tên người dùng" name="username">
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label for="Phone" class="title-la">SĐT
                                                                </label>
                                                                <input type="text" class="form-control"
                                                                       id="Phone"
                                                                       placeholder="SĐT" name="phone">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="address" class="title-la"> Địa chỉ
                                                            </label>
                                                            <input type="text" class="form-control"
                                                                   id="address" placeholder="Địa chỉ" name="address">
                                                        </div>
                                                        <div class="form-group ">
                                                            <div class="form-check col-md-4 ">
                                                                <input class="form-check-input" type="checkbox"
                                                                       id="inlineCheckbox1" value="1" name="active">
                                                                <label class="form-check-labe1" for="inlineCheckbox1">Kích hoạt</label>
                                                            </div>
                                                            <div class="form-check col-md-4 ">
                                                                <input class="form-check-input" type="checkbox"
                                                                       id="inlineCheckbox2" value="1" name="admin">
                                                                <label class="form-check-label" for="inlineCheckbox2">Admin
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-info form-add">Thêm</button>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Đóng
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- ====================================-->
                                    <!--  end Modal-->
                                    <div class="small-space" style="height: 80px;width: 1px"></div>
                                </div>
                            </div>
                            <div id="customertable" class="jsgrid"
                                 style="position: relative; height: 500px; width: 100%;">
                                <div class="jsgrid-grid-header jsgrid-header-scrollbar">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tr class="jsgrid-header-row">
                                            <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header"
                                                style="width: 40px;">ID
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-header" style="width: 100px;">
                                                Email
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-header" style="width: 100px;">
                                                Họ Tên
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-header" style="width: 100px;">
                                                Địa chỉ
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 70px;">SĐT
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-center" style="width: 40px;">
                                                Admin
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-center" style="width: 45px;">
                                                Kích hoạt
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 60px;">Tác vụ
                                            </th>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jsgrid-grid-body" style="height: 394px;">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tbody>
                                        <%
                                            ResultSet rs = null;
                                            try {
                                                rs = ListUser.getRSUser();
                                                int i = 0;
                                                while (rs.next()) {
                                                    i++;
                                        %>
                                        <tr class="jsgrid-row" style="height: 50px;">
                                            <td class="jsgrid-cell jsgrid-align-center"
                                                style="width: 40px;"><%=rs.getInt(1)%>
                                            </td>
                                            <td class="jsgrid-cell" style="width: 100px;"><%=rs.getString(2)%>
                                            </td>
                                            <td class="jsgrid-cell" style="width: 100px;"><%=rs.getString(4)%>
                                            </td>
                                            <td class="jsgrid-cell" style="width: 100px;"><%=rs.getString(5)%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 70px;"><%=rs.getString(6)%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-center" style="width: 40px;"><input
                                                    type="checkbox" <%if (rs.getByte(7) == 1 ){%> checked="true"<%}%>
                                                    disabled=""></td>
                                            <td class="jsgrid-cell jsgrid-align-center" style="width: 45px;"><input
                                                    type="checkbox" <%if (rs.getByte(8) == 1 ){%> checked="true"<%}%>
                                                    disabled=""></td>
                                            <td class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 60px;">
                                                <button class="jsgrid-button jsgrid-edit-button" data-toggle="modal"
                                                        data-target="#myModal<%=i%>" type="button"
                                                        title="Edit">
                                                </button>
                                                <a onclick="return confirm('Are you sure you want to delete this?')"
                                                   href=<%=Util.fullPath("Delete?del=" + rs.getInt(1) + "&command=user")%>>
                                                    <button class="jsgrid-button jsgrid-delete-button" type="button"
                                                            title="Delete"></button>
                                                </a>
                                            </td>
                                        </tr>

                                        <!-- ========== edit modal ========== -->
                                        <div id="myModal<%=i%>" class="modal ">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Sửa thông tin người dùng</h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">&times;
                                                        </button>
                                                    </div>
                                                    <form action="<%=Util.fullPath("Edit")%>" method="post">
                                                        <div class="modal-body">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-6">
                                                                    <input class="hidden" type="hidden" name="command"
                                                                           value="user">
                                                                    <input class="hidden" type="hidden" name="id"
                                                                           value="<%=rs.getInt(1)%>">
                                                                    <label for="email<%=i%>" class="title-la">Email
                                                                    </label>
                                                                    <input type="email" class="form-control"
                                                                           id="email<%=i%>"
                                                                           placeholder="Email"
                                                                           value="<%=rs.getString(2)%>" name="email">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="password<%=i%>" class="title-la">Mật khẩu
                                                                    </label>
                                                                    <input type="password" class="form-control"
                                                                           id="password<%=i%>"
                                                                           placeholder="******"
                                                                           value="<%=rs.getString(3)%>" name="password">
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-8">
                                                                    <label for="user<%=i%>" class="title-la"> Tên người dùng
                                                                    </label>
                                                                    <input type="text" class="form-control"
                                                                           id="user<%=i%>" placeholder="Tên người dùng"
                                                                           value="<%=rs.getString(4)%>" name="username">
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="Phone<%=i%>" class="title-la">SĐT
                                                                    </label>
                                                                    <input type="text" class="form-control"
                                                                           id="Phone<%=i%>"
                                                                           placeholder="SĐT"
                                                                           value="<%=rs.getString(6)%>" name="phone">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="address<%=i%>" class="title-la"> Địa chỉ
                                                                </label>
                                                                <input type="text" class="form-control"
                                                                       id="address<%=i%>" placeholder="Địa chỉ"
                                                                       value="<%=rs.getString(5)%>" name="address">
                                                            </div>
                                                            <div class="form-group ">
                                                                <div class="form-check col-md-4 ">
                                                                    <input class="form-check-input" type="checkbox"
                                                                           id="inlineCheckbox2<%=i%>" value="1"
                                                                           name="admin" <%if (rs.getByte(7) == 1 ){%> checked="true"<%}%>>
                                                                    <label class="form-check-label"
                                                                           for="inlineCheckbox2">Admin
                                                                    </label>
                                                                </div>
                                                                <div class="form-check col-md-4 ">
                                                                    <input class="form-check-input" type="checkbox"
                                                                           id="inlineCheckbox1<%=i%>" value="1"
                                                                           name="active" <%if (rs.getByte(8) == 1 ){%> checked="true"<%}%>>
                                                                    <label class="form-check-labe1"
                                                                           for="inlineCheckbox1">Kích hoạt</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-info form-add">Lưu
                                                            </button>
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- ========== end ========== -->
                                        <%
                                                }
                                            } catch (SQLException | ClassNotFoundException e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                                <%--Pagination--%>
                                <% rs.last();
                                    double userCounter = rs.getRow();
                                    double countPage = 0;
                                    if (rs.getRow() % 15 == 0) {
                                        countPage = (double) rs.getRow() / (double) 15;
                                    } else {
                                        countPage = (double) rs.getRow() / (double) 15 + 1;
                                    }

                                %>
                                <div class="jsgrid-pager-container" style="">
                                    <div class="jsgrid-pager">Trang:
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="user-manage.jsp?page=<%=1%>">Đầu</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="user-manage.jsp?page=<%=(Integer.parseInt(numPage)-1)%>">Trước</a></span>
                                        <% for (int j = 1; j <= (int) countPage; j++) {
                                            if (Integer.parseInt(numPage) == j) {
                                        %>
                                        <span class="jsgrid-pager-page jsgrid-pager-current-page"><%=j%></span>
                                        <%} else {%>
                                        <span class="jsgrid-pager-page"><a
                                                href="user-manage.jsp?page=<%=j%>"><%=j%></a></span>
                                        <% }
                                        }
                                        %>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="user-manage.jsp?page=<%=(Integer.parseInt(numPage)+1)%>">Sau</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="user-manage.jsp?page=<%=(int) countPage%>">Cuối</a></span>
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
        © 2019 Admin Made By Group Banana
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
</body>

</html>