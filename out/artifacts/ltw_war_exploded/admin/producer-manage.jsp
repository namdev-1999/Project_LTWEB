<%@ page import="vn.nlu.banana.model.ListCategory" %>
<%@ page import="vn.nlu.banana.model.ListProduct" %>
<%@ page import="vn.nlu.banana.model.Shoe" %>
<%@ page import="vn.nlu.banana.model.Type" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.nlu.banana.Util.Util" %>
<%@ page import="vn.nlu.banana.model.ListCategory" %>
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
    <title>Admin - Quản lý NSX</title>
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
    //    List<Shoe> list;
    List<Type> typeLst = ListCategory.getListCategory();
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
                    <h4 class="text-themecolor" title="Quản lý nhà sản xuất">Quản lý NSX</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Trang chủ</a></li>
                            <li class="breadcrumb-item active" title="Quản lý nhà sản xuát">Quản lý NSX</li>
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
                                <h4 class="card-title"></h4></div>
                            <div class="col-md-9 align-self-center text-right">
                                <div class="d-flex justify-content-end align-items-center">
                                    <div class="nav-item search-box">
                                        <form class="app-search d-flex justify-content-end">
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập thông tin và enter">
                                            <button type="button" class="btn btn-success"><i
                                                    class="fa fa-search"></i>
                                            </button>
                                        </form>
                                    </div>

                                    <button type="button" class=" btn btn-info d-none d-lg-block m-l-15 btn-add "
                                            data-toggle="modal" data-target="#myModal">
                                        <i class="fa fa-plus-circle"></i> Thêm
                                    </button>
                                    <div id="myModal" class="modal ">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" title="Thêm nhà sản xuất">Thêm NSX</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">&times;
                                                    </button>
                                                </div>
                                                <form action="<%=Util.fullPath("Add")%>" method="post">
                                                    <div class="modal-body">
                                                        <div class="form-row">
                                                            <div class="form-group col-md-12">
                                                                <input type="hidden" name="command" class="hidden"
                                                                       value="producer">
                                                                <label for="producer" class="title-la">Tên nhà sản xuất</label>
                                                                <input type="text" class="form-control"
                                                                       id="producer"
                                                                       placeholder="Tên NSX"
                                                                       name="producer" required
                                                                       title="Tên nhà sản xuất">
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
                                    <div class="small-space" style="height: 80px;width: 1px"></div>
                                </div>
                            </div>

                            <div id="basicgrid" class="jsgrid"
                                 style="position: relative; height: 100% ;width: 100%;">
                                <div class="jsgrid-grid-header jsgrid-header-scrollbar">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tr class="jsgrid-header-row">
                                            <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header"
                                                style="width: 40px;">ID
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 150px;">Tên NSX
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-right jsgrid-header"
                                                style="width: 60px;">Số lượng
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-right jsgrid-header"
                                                style="width: 60px;">Trạng thái
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
                                        <!-- ========== noi dung table ========== -->
                                        <%
                                            int count = 0;
                                            for (int i = 15 * (Integer.parseInt(numPage) - 1); i < typeLst.size(); i++) {
                                                Type type = typeLst.get(i);
                                                count++;
                                                if (count >= 16) {
                                                    break;
                                                }
                                        %>

                                        <tr class="jsgrid-row" style="height: 50px;">
                                            <td class="jsgrid-cell jsgrid-align-center"
                                                style="width: 40px;"><%=type.getId()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 150px;"><%=type.getName()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 60px;"><%=type.getQuantity()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-center" style="width: 60px;"><i
                                                    class="fas fa-check fa-lg" style="color:green"></i>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 60px;">
                                                <button class="jsgrid-button jsgrid-edit-button" data-toggle="modal"
                                                        data-target="#myModal<%=i%>" type="button"
                                                        title="Chỉnh sửa">
                                                </button>
                                                <a onclick="return confirm('Are you sure you want to delete this?')"
                                                   href=<%=Util.fullPath("Delete?del=" + type.getId() + "&command=producer")%>>
                                                    <button class="jsgrid-button jsgrid-delete-button" type="button"
                                                            title="Xóa"></button>
                                                </a>
                                            </td>
                                        </tr>
                                        <!-- ========== edit modal ========== -->
                                        <div id="myModal<%=i%>" class="modal ">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" title="Chỉnh sửa nhà sản xuất">Chỉnh sửa
                                                            NSX</h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">&times;
                                                        </button>
                                                    </div>
                                                    <form action="<%=Util.fullPath("Edit")%>" method="post">
                                                        <div class="modal-body">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <input type="hidden" name="command"
                                                                           value="producer">
                                                                    <input type="hidden" name="idType"
                                                                           value="<%=type.getId()%>">
                                                                    <label for="producer"
                                                                           class="title-la">Nhà sản xuất</label>
                                                                    <input type="text" class="form-control"
                                                                           id="producer<%=i%>"
                                                                           placeholder="Tên nhà sản xuất"
                                                                           value="<%=type.getName()%>"
                                                                           name="producer" required>
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
                                        <% }%>
                                        </tbody>
                                    </table>
                                </div>

                                <%--Pagination--%>
                                <% double countPage = 0;
                                    if (typeLst.size() % 15 == 0) {
                                        countPage = (double) typeLst.size() / (double) 15;
                                    } else {
                                        countPage = (double) typeLst.size() / (double) 15 + 1;
                                    }

                                %>
                                <div class="jsgrid-pager-container" style="">
                                    <div class="jsgrid-pager">Trang:
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="producer-manage.jsp?page=<%=1%>">Đầu</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="producer-manage.jsp?page=<%=(Integer.parseInt(numPage)-1)%>">Trước</a></span>
                                        <% for (int j = 1; j <= (int) countPage; j++) {
                                            if (Integer.parseInt(numPage) == j) {
                                        %>
                                        <span class="jsgrid-pager-page jsgrid-pager-current-page"><%=j%></span>
                                        <%} else {%>
                                        <span class="jsgrid-pager-page"><a
                                                href="producer-manage.jsp?&page=<%=j%>"><%=j%></a></span>
                                        <% }
                                        }
                                        %>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="producer-manage.jsp?page=<%=(Integer.parseInt(numPage)+1)%>">Sau</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="producer-manage.jsp?page=<%=(int) countPage%>">Cuối</a></span>
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
<script src="../ckeditor/ckeditor.js"></script>
<script src="../ckfinder/ckfinder.js"></script>
<script>
    var f = CKEDITOR.replace("desc");
    CKFinder.setupCKEditor(f, "<%=Util.fullPath("ckfinder/")%>");
</script>
</body>

</html>