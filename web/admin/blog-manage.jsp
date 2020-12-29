<%@ page import="vn.nlu.banana.model.Type" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.nlu.banana.model.Blog" %>
<%@ page import="vn.nlu.banana.model.ListBlog" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>Admin - Product management</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/elegant-admin/"/>
    <!-- Editable CSS -->
    <link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid.min.css"/>
    <link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid-theme.min.css"/>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="stylesheet" href="dist/css/blog/blog.css">
    <link rel="stylesheet" href="dist/css/style-ltw.css">

</head>

<body class="skin-default-dark fixed-layout lock-nav">
<%
    //    List<Shoe> list;
    ArrayList<Blog> list = ListBlog.getListBlog();
    String numPage = "";
    if (request.getParameter("page") != null) {
        numPage = request.getParameter("page");
    } else {
        numPage = "1";
    }
    String sort = "";
    if (request.getParameter("sorter") != null) {
        sort = request.getParameter("sorter");
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
                    <h4 class="text-themecolor">Quản lý blog</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Quản lý blog</li>
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
                                <h4 class="card-title">Tất cả bài đăng</h4></div>
                            <div class="col-md-9 align-self-center text-right">
                                <div class="d-flex justify-content-end align-items-center">
                                    <div class="nav-item search-box">
                                        <form class="app-search d-flex justify-content-end">
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập thông tin &amp; enter">
                                            <button type="button" class="btn btn-success"><i
                                                    class="fa fa-search"></i>
                                            </button>
                                        </form>
                                    </div>

                                    <button type="button" class="btn btn-info text-white d-none d-lg-block m-l-15 btn-add">
                                        <a  style="color: white" href="../writeblog.jsp"><i class="fa fa-plus-circle"></i> Bài đăng mới</a>
                                    </button>
                                </div>
                            </div>
                            <div class="small-space" style="height: 80px;width: 1px"></div>
                            <div id="basicgrid" class="jsgrid" style="position: relative; height: 100% ;width: 100%;">
                                <div class="jsgrid-grid-header jsgrid-header-scrollbar">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tr class="jsgrid-header-row">
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                title="Số thứ tự"
                                                style="width: 50px;">STT
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 150px;">Tiều đề
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 50px;">Ngày đăng
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 60px;">Tác vụ
                                            </th>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jsgrid-grid-body blog" style="height: 394px;">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tbody>
                                        <!-- ========== noi dung table ========== -->
                                        <%
                                            int count = 0;
                                            for (int i = 15 * (Integer.parseInt(numPage) - 1); i < list.size(); i++) {
                                                Blog blog = list.get(i);
                                                count++;
                                                if (count >= 16) {
                                                    break;
                                                }
                                        %>

                                        <tr class="jsgrid-row" style="height: 50px;">
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 50px;"><%=blog.getId()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 150px;"><%=blog.getTitle()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 50px;"><%=blog.getDate()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 60px;">
                                                <button class="view-detail" style=""
                                                ><a target="_blank"
                                                    href="<%=Util.fullPath("blogdetail.jsp?id=")+blog.getId()%>"><i
                                                        class="fa fa-eye"></i></a>

                                                </button>
                                                <button class="edit" type="button"
                                                        title="Edit">
                                                    <a target="_blank"
                                                       href="<%=Util.fullPath("editblog.jsp?id=")+blog.getId()%>"><i
                                                            class="fa fa-edit"></i></a></a>
                                                </button>
                                                <a onclick="return confirm('Are you sure you want to delete this?')"
                                                   href=<%=Util.fullPath("Delete?del=" + blog.getId() + "&command=blog")%>>
                                                    <button class="jsgrid-button jsgrid-delete-button" type="button"
                                                            title="Delete"></button>
                                                </a>
                                            </td>
                                        </tr>
                                        <% }%>
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
                                                href="product-manage.jsp?sorter=<%=sort%>&page=<%=1%>">Đầu</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="product-manage.jsp?sorter=<%=sort%>&page=<%=(Integer.parseInt(numPage)-1)%>">Trước</a></span>
                                        <% for (int j = 1; j <= (int) countPage; j++) {
                                            if (Integer.parseInt(numPage) == j) {
                                        %>
                                        <span class="jsgrid-pager-page jsgrid-pager-current-page"><%=j%></span>
                                        <%} else {%>
                                        <span class="jsgrid-pager-page"><a
                                                href="product-manage.jsp?sorter=<%=sort%>&page=<%=j%>"><%=j%></a></span>
                                        <% }
                                        }
                                        %>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="product-manage.jsp?sorter=<%=sort%>&page=<%=(Integer.parseInt(numPage)+1)%>">Tiếp</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="product-manage.jsp?sorter=<%=sort%>&page=<%=(int) countPage%>">Cuối</a></span>
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
                    <!-- Column -->
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End PAge Content -->
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