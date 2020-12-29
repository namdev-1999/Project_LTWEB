<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" href="dist/css/style-ltw.css">
    <link rel="stylesheet" href="dist/css/style-new.css">
</head>

<body class="skin-default-dark fixed-layout lock-nav">
<%
    List<Shoe> list;
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
    HttpSession currentPage = request.getSession();
    currentPage.setAttribute("currentPage", numPage);
    HttpSession sorter = request.getSession();
    sorter.setAttribute("sort", sort);

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
                    <h4 class="text-themecolor">Quản lý sản phẩm</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Quản lý sản phẩm</li>
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
                                <h4 class="card-title">Bảng sản phẩm</h4></div>
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

                                    <button type="button" class=" btn btn-info d-none d-lg-block m-l-15 btn-add "
                                            data-toggle="modal" data-target="#myModal">
                                        <i class="fa fa-plus-circle"></i> Thêm
                                    </button>
                                    <%if (sort == "") {%>
                                    <div id="myModal" class="modal ">
                                        <div class="modal-dialog modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Thêm sản phẩm</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">&times;
                                                    </button>
                                                </div>
                                                <form action="<%=Util.fullPath("AddProduct")%>" method="post"
                                                      enctype="multipart/form-data">
                                                    <div class="modal-body">
                                                        <div class="form-row">
                                                            <div class="form-group col-md-12">
                                                                <label for="input-Product" class="title-la"> Tên sản phẩm
                                                                </label>
                                                                <input type="text" class="form-control"
                                                                       id="input-Product"
                                                                       placeholder="Tên sản phẩm"
                                                                       name="proName" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-4">
                                                                <label for="inputState" class="title-la"> Thương hiệu
                                                                </label>
                                                                <select name="idType" id="inputState"
                                                                        class="form-control" required>
                                                                    <option selected hidden disabled>Brand...</option>
                                                                    <%for (Type type : typeLst) {%>
                                                                    <option value="<%=type.getId()%>"><%=type.getName()%>
                                                                    </option>
                                                                    <%}%>
                                                                </select>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label for="product-price" class="title-la"> Giá
                                                                </label>
                                                                <input type="text" class="form-control"
                                                                       id="product-price"
                                                                       placeholder="Price" name="price" required>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <!--Size-->
                                                                <label for="size" class="title-la"> Size
                                                                </label>
                                                                <br/>
                                                                <div class="button-group">
                                                                    <button type="button" id="size"
                                                                            class="d-flex justify-content-between border dropdown-toggle form-control"
                                                                            data-toggle="dropdown" aria-haspopup="true"
                                                                            aria-expanded="true">
                                                                        <span>Size &nbsp;</span>
                                                                        <span class="caret"></span>
                                                                    </button>
                                                                    <ul class="dropdown-menu checkbox-menu allow-focus"
                                                                        style="width: 95%" data-flip="false"
                                                                        data-boundary="window" aria-labelledby="size">
                                                                        <%for (int i = 30; i <= 43; i++) {%>
                                                                        <li>
                                                                            <label>
                                                                                <input type="checkbox" name="size"
                                                                                       value="<%=i%>"
                                                                                       class="form-c"> <%=i%>
                                                                            </label>
                                                                        </li>
                                                                        <%}%>
                                                                    </ul>
                                                                </div>

                                                                <!--End size-->
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-12">
                                                                <label for="desc">Miêu tả</label>
                                                                <textarea name="desc" type="text" class="form-control"
                                                                          id="desc"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-12">
                                                                <label for="homeimg0"></label>
                                                                <input value="" type="file" name="homeimg0"
                                                                       id="homeimg0" required/>
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="homeimg1"></label>
                                                                <input value="" type="file" name="homeimg1"
                                                                       id="homeimg1" required/>
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="homeimg2"></label>
                                                                <input value="" type="file" name="homeimg2"
                                                                       id="homeimg2" required/>
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="homeimg3"></label>
                                                                <input value="" type="file" name="homeimg3"
                                                                       id="homeimg3" required/>
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="homeimg4"></label>
                                                                <input value="" type="file" name="homeimg4"
                                                                       id="homeimg4" required/>
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
                                    <%} else { %>
                                    <div id="myModal" class="modal  ">
                                        <div class="modal-dialog modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Thêm sản phẩm <%=sort%>
                                                    </h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">&times;
                                                    </button>
                                                </div>
                                                <form action="<%=Util.fullPath("Add")%>" method="post">
                                                    <div class="modal-body">
                                                        <div class="form-row">
                                                            <div class="form-group col-md-12">
                                                                <input type="hidden" class="hidden" name="command"
                                                                       value="<%=sort%>">
                                                                <select name="idProduct" id="input"
                                                                        class="form-control" required>
                                                                    <%for (Shoe product : ListProduct.getListProductExcept(sort + "product")) {%>
                                                                    <option value="<%=product.getId()%>">
                                                                        <%=product.getName()%>
                                                                    </option>
                                                                    <%}%>
                                                                </select>
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
                                    <%
                                        }
                                    %>
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
                                                style="width: 150px;">Sản phẩm
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-right jsgrid-header"
                                                style="width: 60px;">Giá
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 60px;">Brand
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-left jsgrid-header"
                                                style="width: 60px;">Hình ảnh
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-align-right jsgrid-header"
                                                style="width: 60px;">Kích hoạt
                                            </th>
                                            <th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 62px;">Tác vụ
                                            </th>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jsgrid-grid-body" style="height: 394px;">
                                    <table class="jsgrid-table table table-striped table-hover">
                                        <tbody>
                                        <!-- ========== noi dung table ========== -->
                                        <%
                                            if (sort.equalsIgnoreCase("hot")) {
                                                list = ListProduct.getHotListProduct();
                                            } else if (sort.equals("new")) {
                                                list = ListProduct.getNewListProduct();
                                            } else if (sort.equals("related")) {
                                                list = ListProduct.getRelatedListProduct();
                                            } else if (sort.equals("upsell")) {
                                                list = ListProduct.getUpsellListProduct();
                                            } else {
                                                list = ListProduct.getListProduct();
                                            }
                                            int count = 0;
                                            for (int i = 15 * (Integer.parseInt(numPage) - 1); i < list.size(); i++) {
                                                Shoe product = list.get(i);
                                                count++;
                                                if (count >= 16) {
                                                    break;
                                                }
                                        %>

                                        <tr class="jsgrid-row">
                                            <td class="jsgrid-cell jsgrid-align-center"
                                                style="width: 40px;"><%=product.getId()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 150px;"><%=product.getName()%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-right" style="width: 60px;">
                                                <%=product.getPrice()%>$
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-left"
                                                style="width: 60px;"><%=ListCategory.getTypeName(product.idType)%>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-align-center" style="width: 60px;">
                                                <img src="<%=Util.fullPath(product.getImage().get(1))%>"
                                                     alt="product image" width="50%"></td>
                                            <td class="jsgrid-cell jsgrid-align-center" style="width: 60px;"><i
                                                    class="fas fa-check fa-lg" style="color:green"></i>
                                            </td>
                                            <td class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
                                                style="width: 60px;">

                                                <!--Chi tiet size-->
                                                <button class="view-detail"
                                                        data-toggle="modal" data-target="#productDetail<%=i%>">
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                                <div id="productDetail<%=i%>" class="modal">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title"><%=product.getName()%>
                                                                </h4>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">&times;
                                                                </button>
                                                            </div>
                                                            <form action="<%=Util.fullPath("Edit")%>"
                                                                  method="post">
                                                                <input type="hidden" name="command" value="size">
                                                                <input type="hidden" name="idproduct"
                                                                       value="<%=product.getId()%>">
                                                                <div class="modal-body">
                                                                    <table class="table">
                                                                        <thead class="thead-light">
                                                                        <tr>
                                                                            <th scope="col">Size</th>
                                                                            <th scope="col">Còn lại</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <% int k = 0;
                                                                            for (SizeDetail sd : ListSizeDetail.listProductSize(product.getId())) {
                                                                                k++;
                                                                        %>
                                                                        <input type="hidden" name="idsize<%=k%>"
                                                                               value="<%=sd.getId()%>">
                                                                        <tr>
                                                                            <th scope="row">
                                                                                <input class="remain bg-transparent border-0"
                                                                                       type="number"
                                                                                       value="<%=sd.getSize()%>" min="0"
                                                                                       name="size<%=k%>" disabled>
                                                                            </th>
                                                                            <td><input
                                                                                    class="remain bg-transparent border-0"
                                                                                    type="number"
                                                                                    value="<%=sd.getRemain()%>" min="0"
                                                                                    name="remain<%=k%>" disabled>
                                                                            </td>
                                                                        </tr>
                                                                        <%}%>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="submit"
                                                                            class="save btn btn-info d-none">Lưu
                                                                    </button>
                                                                    <button type="button"
                                                                            class="back btn btn-secondary d-none">
                                                                        Quay lại
                                                                    </button>
                                                                    <button type="button" class="add btn btn-info"
                                                                            data-toggle="modal"
                                                                            data-target="#size<%=i%>">
                                                                        Thêm
                                                                    </button>
                                                                    <button type="button"
                                                                            class="edit btn btn-secondary">
                                                                        Sửa
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--End chi tiet size-->

                                                <button class="jsgrid-button jsgrid-edit-button" data-toggle="modal"
                                                        data-target="#myModal<%=i%>" type="button"
                                                        title="Edit">
                                                </button>
                                                <a onclick="return confirm('Are you sure you want to delete this?')"
                                                   href=<%=Util.fullPath("Delete?del=" + product.getId() + "&command=" + sort)%>>
                                                    <button class="jsgrid-button jsgrid-delete-button" type="button"
                                                            title="Delete"></button>
                                                </a>
                                            </td>
                                        </tr>
                                        <!--Modal add size-->
                                        <div id="size<%=i%>" style="z-index: 2000;" class="modal ">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Thêm Size
                                                        </h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">&times;
                                                        </button>
                                                    </div>
                                                    <form action="<%=Util.fullPath("Add")%>" method="post">
                                                        <div class="modal-body">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-6">
                                                                    <input type="hidden" class="hidden"
                                                                           name="command"
                                                                           value="size">
                                                                    <input type="hidden" class="hidden"
                                                                           name="idproduct"
                                                                           value="<%=product.getId()%>">
                                                                    <label for="input-size<%=i%>"
                                                                           class="title-la">
                                                                        Size
                                                                    </label>
                                                                    <input type="text" class="form-control"
                                                                           id="input-size<%=i%>"
                                                                           placeholder="Size"
                                                                           name="size" required>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="input-remain<%=i%>"
                                                                           class="title-la">
                                                                        Còn lại
                                                                    </label>
                                                                    <input type="number" class="form-control"
                                                                           id="input-remain<%=i%>"
                                                                           placeholder="Còn lại" min="0"
                                                                           name="remain" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-info">
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
                                        <!--End modal add size-->
                                        <!-- ========== edit modal ========== -->
                                        <div id="myModal<%=i%>" class="modal ">
                                            <div class="modal-dialog modal-xl">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Sửa</h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">&times;
                                                        </button>
                                                    </div>
                                                    <form action="<%=Util.fullPath("EditProduct")%>" method="post"
                                                          enctype="multipart/form-data">
                                                        <div class="modal-body">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <input type="hidden" value="<%=product.getId()%>"
                                                                           name="idProduct">
                                                                    <label for="input-Product<%=i%>" class="title-la">
                                                                        Tên sản phẩm
                                                                    </label>
                                                                    <input type="text" class="form-control"
                                                                           id="input-Product<%=i%>"
                                                                           placeholder="T"
                                                                           value="<%=product.getName()%>"
                                                                           name="proName" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-4">
                                                                    <label for="inputState" class="title-la"> Brand
                                                                    </label>
                                                                    <select name="idType" id="inputState<%=i%>"
                                                                            class="form-control" required>
                                                                        <%
                                                                            for (Type type : typeLst) {%>
                                                                        <option <%=product.getIdType() == type.getId() ? "selected" : ""%>
                                                                                value="<%=type.getId()%>"><%=type.getName()%>
                                                                        </option>
                                                                        <%}%>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="product-price" class="title-la"> Giá
                                                                    </label>
                                                                    <input type="text" class="form-control"
                                                                           id="product-price<%=i%>"
                                                                           placeholder="Price" name="price" required
                                                                           value="<%=product.getPrice()%>">
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <!--Size-->
                                                                    <label for="size" class="title-la"> Size
                                                                    </label>
                                                                    <br/>
                                                                    <div class="button-group">
                                                                        <button type="button" id="size<%=i%>"
                                                                                class="d-flex justify-content-between border dropdown-toggle form-control"
                                                                                data-toggle="dropdown"
                                                                                aria-haspopup="true"
                                                                                aria-expanded="true">
                                                                            <span>Size &nbsp;</span>
                                                                            <span class="caret"></span>
                                                                        </button>
                                                                        <ul class="dropdown-menu checkbox-menu allow-focus"
                                                                            style="width: 95%" data-flip="false"
                                                                            data-boundary="window"
                                                                            aria-labelledby="size">
                                                                            <%for (int j = 30; j <= 43; j++) {%>
                                                                            <li>
                                                                                <label>
                                                                                    <input type="checkbox" name="size"
                                                                                           value="<%=j%>"
                                                                                           class="form-c"> <%=j%>
                                                                                </label>
                                                                            </li>
                                                                            <%}%>
                                                                        </ul>
                                                                    </div>
                                                                    <!--End size-->
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <label for="desc<%=i%>">Miêu tả</label>
                                                                    <textarea name="desc" type="text"
                                                                              class="form-control"
                                                                              id="desc<%=i%>"
                                                                              value="<%=product.getDes()%>"></textarea>
                                                                </div>
                                                            </div>

                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <label for="thumb">Hình ảnh</label>
                                                                </div>
                                                            </div>
                                                            <% for (int m = 0; m < product.getImage().size(); m++) {%>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-3">
                                                                    <div id="thumb" style=" width:64px; height:53px;">
                                                                        <img src="<%=Util.fullPath(product.getImage().get(m))%>"
                                                                             alt="product image" width="100%">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-9">
                                                                    <input value="" type="file" name="homeimg<%=m%>"
                                                                           id="homeimg<%=m%>"/>
                                                                </div>
                                                            </div>
                                                            <%}%>
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
                                                href="product-manage.jsp?sorter=<%=sort%>&page=<%=(Integer.parseInt(numPage)+1)%>">Sau</a></span>
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
<!-- Ckeditor -->
<script src="../ckeditor/ckeditor.js"></script>
<script src="../ckfinder/ckfinder.js"></script>
<script>
    var f = CKEDITOR.replace('desc');
    CKFinder.setupCKEditor(f, "ckfinder/")
    for (var i = 0; i < <%=list.size()%>; i++) {
        var f = CKEDITOR.replace('desc' + i);
        CKFinder.setupCKEditor(f, "<%=Util.fullPath("ckfinder/")%>");
    }
</script>


<!-- ltw javascript -->
<script src="dist/js/ltw.js"></script>

</body>
</html>