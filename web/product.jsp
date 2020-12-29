<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" href="imgs/core-img/favicon.ico">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">

    <link rel="stylesheet" href="css/template/core-style.css">
    <link rel="stylesheet" href="scss/style.scss">
    <link rel="stylesheet" href="css/maincontent.css">
    <link rel="stylesheet" href="css/list-product/nike.css">
    <!--fotorama-->
    <!-- jQuery 1.8 or later, 33 KB -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Fotorama from CDNJS, 19 KB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

</head>

<body>
<%
    String type = "";
    if (request.getParameter("type") != null) {
        type = request.getParameter("type");
    } else {
        type = "1";
    }
    int pageCurrent = Integer.parseInt(type);
    List<Type> listCategory = ListCategory.getListCategory();

    String numpage = "";
    if (request.getParameter("page") != null) {
        numpage = request.getParameter("page");
    } else {
        numpage = "1";
    }
    List<Shoe> list = ListProduct.getListProductByCategory(Integer.parseInt(type));

    if (request.getParameter("sort") != null) {
        if (request.getParameter("sort").equals("2")) {
            list = ListProduct.sortByPriceFromHighToLow(ListProduct.getListProductByCategory(Integer.parseInt(type)));
        }
        if (request.getParameter("sort").equals("1")) {
            list = ListProduct.sortByPriceFromLowToHigh(ListProduct.getListProductByCategory(Integer.parseInt(type)));
        }
    }

%>
<!-- ##### Header Area Start ##### -->
<%@include file="header.jsp" %>
<!-- ##### Header Area End ##### -->

<!-- ##### Shop Grid Area Start ##### -->
<section class="shop_grid_area pt-5">
    <div class="container">
        <div class="row path">
            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                <span>  <a href="index.jsp">TRANG CHỦ</a></span>
                <span>/</span>
                <span>
                    <a class="active"
                       href="product.jsp?type=<%=type%>"><%=ListCategory.getTypeName(Integer.parseInt(type))%></a>
                </span>

            </div>
            <div class="col-lg-9 col-12"></div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 col-lg-3 md-mt-40 sm-mt-40">
                <div class="shop__sidebar">
                    <aside class="wedget__categories poroduct--cat">
                        <h3 class="wedget__title">Danh mục sản phẩm</h3>
                        <ul>
                            <%
                                for (Type c : listCategory) {
                            %>
                            <li>
                                <a href="product.jsp?type=<%=c.getId()%>"><%=c.getName()%><span></span></a>
                            </li>
                            <%}%>
                        </ul>
                    </aside>
                    <aside class="wedget__categories pro--range">
                        <h3 class="wedget__title">Lọc theo giá</h3>
                        <div class="content-shopby">
                            <div class="price_filter s-filter clear">
                                <form action="#" method="GET">
                                    <div id="slider-range"></div>
                                    <div class="slider__range--output">
                                        <div class="price__output--wrap">
                                            <div class="price--output">
                                                <span>Giá :</span><input type="text" id="amount" readonly="">
                                            </div>
                                            <div class="price--filter">
                                                <a href="#">Lọc</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </aside>
                    <aside class="wedget__categories poroduct--tag">
                        <h3 class="wedget__title">Từ khóa liên quan</h3>
                        <ul >
                            <li style="text-decoration: none"><a href="#">Giày thể thao</a></li>
                            <li style="text-decoration: none">
                                <a href="product.jsp?type=<%=type%>"><%=ListCategory.getTypeName(Integer.parseInt(type))%>
                                </a></li>
                        </ul>
                    </aside>
                    <aside class="wedget__categories sidebar--banner">
                        <img src="imgs/qc.jpg" alt="banner images">
                        <div class="text">
                            <h2>sản phẩm mới</h2>
                            <h6>tiết kiệm đến <br>Giảm <strong>40%</strong></h6>
                        </div>
                    </aside>
                </div>
            </div>

            <div class="col-12 col-md-8 col-lg-9">
                <div class="shop_grid_product_area">
                    <div class="row">
                        <div class="col-12">
                            <div class="product-topbar d-flex align-items-center justify-content-between">
                                <!-- Total Products -->
                                <div class="total-products">
                                    <p><span><%=list.size()%></span> sản phẩm được tìm thấy</p>
                                </div>
                                <!-- Sorting -->
                                <div class="product-sorting d-flex pt-2">
                                    <p>Sắp xếp:</p>
                                    <form action="<%=Util.fullPath("Sort")%>" method="post">
                                        <select name="select" id="sortByselect">t
                                            <option value="1">Giá: Từ thấp đến cao</option>
                                            <option value="2">Giá: Từ cao đến thấp</option>
                                        </select>
                                        <button type="submit" class="price--filter border border-dark bg-dark rounded"
                                                style="margin-top: -5px">
                                            <a class="text-white">Lọc</a>
                                        </button>
                                        <input name="type" hidden value="<%=type%>">

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <% int count = 0;
                            for (int i = 12 * (Integer.parseInt(numpage) - 1); i < list.size(); i++) {
                                Shoe s = list.get(i);
                                count++;
                                if (count >= 13) {
                                    break;
                                }
                        %>
                        <!-- Start Single Product -->
                        <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                            <div class="product__thumb">
                                <a class="first__img" href="detail.jsp?product=<%=s.getId()%>"><img
                                        src="<%=Util.fullPath(s.getImage().get(1))%>"
                                        alt="product image"></a>
                                <a class="second__img animation1" href="detail.jsp?id=<%=s.getId()%>"><img
                                        src="<%=Util.fullPath(s.getImage().get(2))%>" alt="<%=s.getName()%>"></a>
                                <div class="hot__box">
                                    <span class="hot-label">BEST SALLER</span>
                                </div>
                            </div>
                            <div class="product__content content--center">
                                <h4><a href="detail.jsp">GIÀY<%=" "%><%=s.getName()%>
                                </a></h4>
                                <ul class="prize d-flex">
                                    <li><%=s.insert(s.getPrice())%><%=" "%>đ
                                    </li>

                                </ul>
                                <div class="action">
                                    <div class="actions_inner">
                                        <ul class="add_to_links">
                                            <li><a class="cart" href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><i
                                                    class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product__hover--content">
                                    <ul class="rating d-flex">
                                        <li class="on"><i class="fa fa-star-o"></i></li>
                                        <li class="on"><i class="fa fa-star-o"></i></li>
                                        <li class="on"><i class="fa fa-star-o"></i></li>
                                        <li><i class="fa fa-star-o"></i></li>
                                        <li><i class="fa fa-star-o"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <%}%>

                    </div>
                </div>
                <!-- Pagination -->
                <nav aria-label="navigation">
                    <ul class="pagination mt-50 mb-70">
                        <li class="page-item"><a class="page-link"
                                                 href="product.jsp?type=<%=type%><%if(request.getParameter("sort")!=null){%>&sort=<%=request.getParameter("sort")%><%}%>&page=<%if (Integer.parseInt(numpage)-1 > 0){%><%=Integer.parseInt(numpage)-1 %><%}else{%><%=1%><%}%>"><i
                                class="fa fa-angle-left"></i></a></li>
                        <% double i = (double) list.size() / (double) 15;
                            int countpage = 0;
                            for (int p = 1; p < 10; p++) {
                                if (i < p) {
                                    countpage = p;
                                    break;
                                }
                            }
                            for (int j = 1; j <= countpage; j++) {
                        %>

                        <li class="page-item"><a
                                class="page-link <%=(Integer.parseInt(numpage)==j)?"bg-pink text-white":"active"%>"
                                href="product.jsp?type=<%=type%>&page=<%=j%><%if(request.getParameter("sort")!=null){%>&sort=<%=request.getParameter("sort")%><%}%>"><%=j%>
                        </a></li>
                        <% }
                        %>
                        <li class="page-item"><a class="page-link"
                                                 href="product.jsp?type=<%=type%><%if(request.getParameter("sort")!=null){%>&sort=<%=request.getParameter("sort")%><%}%>&page=<%if (Integer.parseInt(numpage)+1 <= countpage){%><%=Integer.parseInt(numpage)+1 %><%}else{%><%=countpage%><%}%>"><i
                                class="fa fa-angle-right"></i></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ##### Shop Grid Area End ##### -->

<!-- ##### Footer Area Start ##### -->
<%@include file="footer.jsp" %>
<!-- ##### Footer Area End ##### -->

<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/menu/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/menu/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="js/menu/plugins.js"></script>
<!-- Classy Nav js -->
<script src="js/menu/classy-nav.min.js"></script>
<!-- Active js -->
<script src="js/menu/active.js"></script>
<script src="js/detail-page/price.js"></script>

<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>

</html>