<%@ page import="vn.nlu.banana.model.Ads" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
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
    <title>Admin - Quản lý khuyến mãi</title>
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
    List<Ads> listAds = Ads.getListAllAds();
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
                    <h4 class="text-themecolor">Quản lý khuyến mãi</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Quản lý khuyến mãi</li>
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
                                <h4 class="card-title">Bảng khuyến mãi</h4></div>
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

                                    <button type="button" class=" btn btn-info d-none d-lg-block m-l-15 btn-add "
                                            data-toggle="modal" data-target="#myModal">
                                        <i class="fa fa-plus-circle"></i> Thêm
                                    </button>
                                    <div id="myModal" class="modal ">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Thêm chương trình khuyến mãi</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">&times;
                                                    </button>
                                                </div>
                                                <form action="<%=Util.fullPath("AddAds")%>" method="post"
                                                      enctype="multipart/form-data">
                                                    <div class="modal-body">
                                                        <div class="form-row">
                                                            <div class="form-group col-md-8">
                                                                <label for="Sale" class="title-la">Tên chương trình
                                                                </label>
                                                                <input type="text" class="form-control"
                                                                       id="Sale"
                                                                       placeholder="Nhập tên chương trình"
                                                                       name="Sale-Name">
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label for="input-IdSale" class="title-la"> Giảm giá
                                                                </label>
                                                                <input type="text" class="form-control"
                                                                       id="input-IdSale" placeholder="Giảm %"
                                                                       name="Sale-Up">
                                                            </div>

                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-6">
                                                                <label for="from-date">Từ</label>
                                                                <input class="form-control" type="date"
                                                                       value="2018-08-19" id="from-date"
                                                                       name="from-date">
                                                            </div>
                                                            <div class="form-group col-md-6 ">
                                                                <label for="to-date">Đến</label>
                                                                <input class="form-control" type="date" min="2020-01-01"
                                                                       value="2018-08-19" id="to-date" name="to-date">
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <div class="form-check ">
                                                                <input class="form-check-input" type="checkbox"
                                                                       id="inlineCheckbox1" value="1"
                                                                       name="active">
                                                                <label class="form-check-label" for="inlineCheckbox1">Kích
                                                                    hoạt</label>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label for="ad"></label>
                                                            <input value="" type="file" name="ad"
                                                                   id="ad" required/>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-info form-add">Thêm
                                                        </button>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Close
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="small-space" style="height: 80px;width: 1px"></div>
                                </div>
                            </div>
                            <div id="saletable" class="jsgrid" style="position: relative; height: 500px; width: 100%;">
                                <div class="jsgrid-grid-header jsgrid-header-scrollbar">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tr class="jsgrid-header-row">
                                            <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
                                                style="width: 68px;">ID
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header-sortable"
                                                style="width: 128px;">Tên chương trình
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
                                                style="width: 130px;">Ảnh quảng cáo
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header-sortable"
                                                style="width: 99px;">Từ ngày
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header-sortable"
                                                style="width: 100px;">Đến ngày
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-center" style="width: 100px;">
                                                Kích hoạt
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 70px;">Tác vụ
                                            </th>
                                        </tr>
                                    </table>
                                </div>

                                <div class="jsgrid-grid-body" style="height: 394px;">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tbody>
                                        <%
                                            int count = 0;
                                            for (int i = 15 * (Integer.parseInt(numPage) - 1); i < listAds.size(); i++) {
                                                Ads ads = listAds.get(i);
                                                count++;
                                                if (count >= 16) {
                                                    break;
                                                }
                                        %>
                                        <!-- ========== noi dung table ========== -->
                                        <tr class="jsgrid-row">
                                            <td class="jsgrid-cell jsgrid-align-center"
                                                style="width: 68px;"><%=ads.getId()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 130px;"><%=ads.getName()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-center" style="width: 130px;"><img
                                                    src="<%=Util.fullPath(ads.getImg())%>"
                                                    alt="" style="width: 80px;height: 75px">
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 100px;"><%=ads.getDateStart()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 100px;"><%=ads.getDateEnd()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"><input
                                                    type="checkbox" <%= (ads.getActive()==1)?"checked":""%> disabled="">
                                            </td>
                                            <td class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 70px;">
                                                <button class="jsgrid-button jsgrid-edit-button" data-toggle="modal"
                                                        data-target="#myModal<%=i%>" type="button"
                                                        title="Edit">
                                                </button>
                                                <a onclick="return confirm('Are you sure you want to delete this?')"
                                                   href=<%=Util.fullPath("Delete?del=" + ads.getId() + "&command=sale")%>>
                                                    <button class="jsgrid-button jsgrid-delete-button" type="button"
                                                            title="Delete"></button>
                                                </a>
                                            </td>
                                        </tr>
                                        <div id="myModal<%=i%>" class="modal ">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Sửa chương trình khuyến mãi</h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">&times;
                                                        </button>
                                                    </div>
                                                    <form action="<%=Util.fullPath("EditAds")%>" method="post"
                                                          enctype="multipart/form-data">
                                                        <div class="modal-body">
                                                            <div class="form-row">
                                                                <input type="hidden" class="hidden" name="id"
                                                                       value="<%=ads.getId()%>">
                                                                <input type="hidden" class="hidden" name="image"
                                                                       value="<%=ads.getImg()%>">
                                                                <div class="form-group col-md-8">
                                                                    <label for="Sale" class="title-la">Tên chương trình
                                                                    </label>
                                                                    <input type="text" class="form-control"
                                                                           id="Sale<%=i%>"
                                                                           value="<%=ads.getName()%>"
                                                                           placeholder="Nhập tên chương trình"
                                                                           name="Sale-Name">
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="input-IdSale" class="title-la"> Giảm giá
                                                                    </label>
                                                                    <input type="text" class="form-control"
                                                                           value="<%=ads.getSaleUp()%>"
                                                                           id="input-IdSale<%=i%>" placeholder="Giảm %"
                                                                           name="Sale-Up">
                                                                </div>

                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-6">
                                                                    <label for="from-date">Từ</label>
                                                                    <input class="form-control" type="date"
                                                                        <%DecimalFormat format = new DecimalFormat("00");%>
                                                                           value="<%=ads.getDateStart().getYear()+"-"+format.format(ads.getDateStart().getMonth())+"-"+format.format(ads.getDateStart().getDay())%>"
                                                                           id="from-date<%=i%>"
                                                                           name="from-date">
                                                                </div>
                                                                <div class="form-group col-md-6 ">
                                                                    <label for="to-date">Đến</label>
                                                                    <input class="form-control" type="date"
                                                                           min="2020-01-01"
                                                                           value="<%=ads.getDateEnd().getYear()+"-"+format.format(ads.getDateEnd().getMonth())+"-"+format.format(ads.getDateEnd().getDay())%>"
                                                                           id="to-date<%=i%>" name="to-date">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <div class="form-check ">
                                                                    <input class="form-check-input" type="checkbox"
                                                                           id="inlineCheckbox1<%=i%>"
                                                                           value="1"<%= (ads.getActive()==1)?"checked":""%>
                                                                           name="active">
                                                                    <label class="form-check-label"
                                                                           for="inlineCheckbox1">Kích
                                                                        hoạt</label>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-3">
                                                                    <div id="thumb" style=" width:64px; height:53px;">
                                                                        <img src="<%=Util.fullPath(ads.getImg())%>"
                                                                             alt="product image" width="100%">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-9">
                                                                    <label for="ad"></label>
                                                                    <input value="" type="file" name="ad"
                                                                           id="ad<%=i%>"/>
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
                                        <%}%>
                                        <!-- ========== end ========== -->
                                        </tbody>
                                    </table>
                                </div>

                                <% double countPage = 0;
                                    if (listAds.size() % 15 == 0) {
                                        countPage = (double) listAds.size() / (double) 15;
                                    } else {
                                        countPage = (double) listAds.size() / (double) 15 + 1;
                                    }

                                %>
                                <div class="jsgrid-pager-container" style="">
                                    <div class="jsgrid-pager">Trang:
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="sale-manage.jsp?page=<%=1%>">Đầu</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==1) {%> disabled <%}%>"
                                                href="sale-manage.jsp?page=<%=(Integer.parseInt(numPage)-1)%>">Trước</a></span>
                                        <% for (int j = 1; j <= (int) countPage; j++) {
                                            if (Integer.parseInt(numPage) == j) {
                                        %>
                                        <span class="jsgrid-pager-page jsgrid-pager-current-page"><%=j%></span>
                                        <%} else {%>
                                        <span class="jsgrid-pager-page"><a
                                                href="sale-manage.jsp?&page=<%=j%>"><%=j%></a></span>
                                        <% }
                                        }
                                        %>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="sale-manage.jsp?page=<%=(Integer.parseInt(numPage)+1)%>">Sau</a></span>
                                        <span class="jsgrid-pager-nav-button"><a
                                                class="btn <%if (Integer.parseInt(numPage)==(int)countPage) {%> disabled <%}%>"
                                                href="sale-manage.jsp?page=<%=(int) countPage%>">Cuối</a></span>
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