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
    <link rel="stylesheet" href="css/template/core-style.css">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="scss/style.scss">
    <link rel="stylesheet" href="css/maincontent.css">
    <link rel="stylesheet" href="css/detail.css">

    <!--fotorama-->
    <!-- jQuery 1.8 or later, 33 KB -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Fotorama from CDNJS, 19 KB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
</head>
<body>
<%
    ListProduct lstProduct = new ListProduct();
    Shoe product = new Shoe();
    String productID = "";
    if (request.getParameter("id") != null) {
        productID = request.getParameter("id");
        product = ListProduct.getShoe(Integer.parseInt(productID));
    }
    String type = "";
    if (request.getParameter("type") != null) {
        type = request.getParameter("type");
    } else {
        type = "1";
    }

    int pageCurrent = -10;

    List<Shoe> lstRelatedProduct = ListProduct.getRelatedListProduct();
    List<Shoe> lstUpsellProduct = ListProduct.getUpsellListProduct();%>
<%@include file="header.jsp" %>
<!-- Start main Content -->
<div class="maincontent ">
    <div class="container-fluid ">
        <div class="row path">
            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                <span>  <a href="index.jsp">Trang chủ</a></span>
                <span>/</span>
                <span><a class="active" href="product.jsp">NIKE</a></span>
            </div>
            <div class="col-lg-9 col-12"></div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                <div class="shop__sidebar">
                    <aside class="wedget__categories poroduct--cat">
                        <h3 class="wedget__title">Danh mục sản phẩm</h3>
                        <ul>
                            <%
                                for (Type c : ListCategory.getListCategory()) {
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
                                                <a href="#">Lọc </a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </aside>
                    <aside class="wedget__categories poroduct--tag">
                        <h3 class="wedget__title">Từ khóa liên quan</h3>
                        <ul>
                            <li><a href="#">Sneaker</a></li>
                            <li>
                                <a href="product.jsp?type=<%=type%>"><%=ListCategory.getTypeName(Integer.parseInt(type))%>
                                </a></li>
                        </ul>
                    </aside>
                    <aside class="wedget__categories sidebar--banner">
                        <img src="imgs/qc.jpg" alt="banner images">
                        <div class="text">
                            <h2>sản phẩm mới</h2>
                            <h6>Tiết kiệm đến <br> Giảm<strong>40%</strong></h6>
                        </div>
                    </aside>
                </div>
            </div>
            <div class="col-lg-9 col-12">
                <div class="wn__single__product">
                    <div class="row">
                        <div class="col-lg-6 col-12">
                            <div class="wn__fotorama__wrapper">
                                <div class="fotorama wn__fotorama__action" data-nav="thumbs">
                                    <a href="detail.jsp?product=<%=product.getId()%>" target="_blank"><img
                                            src="<%=Util.fullPath(product.getImage().get(1))%>"
                                            alt=""></a>
                                    <a href="detail.jsp?product=<%=product.getId()%>" target="_blank"><img
                                            src="<%=Util.fullPath(product.getImage().get(2))%>"
                                            alt=""></a>
                                    <a href="detail.jsp?product=<%=product.getId()%>" target="_blank"><img
                                            src="<%=Util.fullPath(product.getImage().get(3))%>"
                                            alt=""></a>
                                    <a href="detail.jsp?product=<%=product.getId()%>" target="_blank"><img
                                            src="<%=Util.fullPath(product.getImage().get(4))%>"
                                            alt=""></a>
                                    <a href="detail.jsp?product=<%=product.getId()%>" target="_blank"><img
                                            src="<%=Util.fullPath(product.getImage().get(1))%>"
                                            alt=""></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-12">
                            <form action="Cart" method="get" id="cart">
                                <div class="product__info__main">
                                    <h1>GIÀY<%=" "%><%=product.getName()%>
                                    </h1>
                                    <div class="product-reviews-summary d-flex">
                                        <ul class="rating-summary d-flex">
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star-half-full"></i></li>
                                        </ul>
                                    </div>
                                    <div class="price-box">
                                        <span><%=product.insert(product.getPrice())%><%=" "%>đ</span>
                                    </div>
                                    <div class="product__size">
                                        <input type="hidden" id="command" name="command" value="add">
                                        <input type="hidden" name="id" value="<%=productID%>">
                                        <div class="input">
                                            <input type="radio" name="size" value="37" id="size-37" checked/>
                                            <label for="size-37">37</label>
                                            <input type="radio" name="size" value="38" id="size-38"/>
                                            <label for="size-38">38</label>
                                            <input type="radio" name="size" value="39" id="size-39"/>
                                            <label for="size-39">39</label>
                                            <input type="radio" name="size" value="40" id="size-40"/>
                                            <label for="size-40">40</label>
                                            <input type="radio" name="size" value="41" id="size-41"/>
                                            <label for="size-41">41</label>
                                            <input type="radio" name="size" value="42" id="size-42"/>
                                            <label for="size-42">42</label>
                                        </div>
                                    </div>
                                    <div class="box-tocart d-flex">
                                        <span>Số lượng</span>
                                        <input id="qty" class="input-text qty" name="qty" min="1" value="1"
                                               title="Số lượng"
                                               type="number">
                                        <div class="addtocart__actions">
                                            <button class="tocart" type="submit" title="Thêm vào giỏ hàng"><a>Thêm vào
                                                giỏ hàng</a>
                                            </button>
                                        </div>
                                        <div class="product-addto-links clearfix">
                                            <a class="wishlist" onclick="submit()" ;></a>
                                        </div>
                                    </div>
                                    <script>
                                        function submit() {
                                            document.getElementById('command').value = 'addtowishlist';
                                            document.getElementById('cart').submit();
                                        }
                                    </script>
                                    <div class="product_meta">
											<span class="posted_in">Danh mục:
												<a href="product.jsp?type=<%=product.getId()%>"><%=product.getName()%></a>,
												<a href="#">Man</a>
											</span>
                                    </div>
                                    <div class="product-share">
                                        <ul>
                                            <li class="categories-title">Chia sẻ :</li>
                                            <li>
                                                <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i
                                                        class="fa fa-facebook" aria-hidden="true"></i></a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Instagram"><i
                                                        class="fa fa-instagram" aria-hidden="true"></i></a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Twitter"><i class="fa fa-twitter"
                                                                      aria-hidden="true"></i></a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Pinterest"><i
                                                        class="fa fa-pinterest" aria-hidden="true"></i></a>

                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="product__info__detailed">
                    <div class="pro_details_nav nav justify-content-start" role="tablist">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#nav-details"
                           role="tab">Chi tiết</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-review" role="tab">Phản hồi</a>
                    </div>
                    <div class="tab__container">
                        <!-- Start Single Tab Content -->
                        <div class="pro__tab_label tab-pane fade show active" id="nav-details" role="tabpanel">
                            <div class="description__attribute">
                                <p><%=product.getDes()%>
                                </p>
                                <ul>
                                    <li>Colour Shown: Beechtree/Velvet Brown/Kinetic Green/Total Orange</li>
                                    <li>Style: CI3800-283</li>
                                    <li>Machine wash/dry.</li>
                                </ul>
                            </div>
                        </div>
                        <!-- End Single Tab Content -->
                        <!-- Start Single Tab Content -->
                        <div class="pro__tab_label tab-pane fade" id="nav-review" role="tabpanel">
                            <div class="review__attribute">
                                <h1>Phản hồi khách hàng</h1>
                                <%
                                    for (Comment c : product.getCommentArrayList()) {

                                %>
                                <div style="border-bottom: 1px solid #c9c9c9;" class="pb-2">
                                    <h5><%=c.username%>
                                    </h5>
                                    <div class="review__ratings__type d-flex">
                                        <div class="review-ratings">
                                            <div class="rating-summary d-flex">
                                                <span>Quality</span>
                                                <ul class="rating d-flex">
                                                    <li><i class="fa <%=c.getStar()>=1?"fa-star":"fa-star-o"%>"></i>
                                                    </li>
                                                    <li><i class="fa  <%=c.getStar()>=2?"fa-star":"fa-star-o"%>"></i>
                                                    </li>
                                                    <li><i class="fa  <%=c.getStar()>=3?"fa-star":"fa-star-o"%>"></i>
                                                    </li>
                                                    <li><i class="fa  <%=c.getStar()>=4?"fa-star":"fa-star-o"%>"></i>
                                                    </li>
                                                    <li><i class="fa  <%=c.getStar()>=5?"fa-star":"fa-star-o"%>"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="review-content text-s">
                                            <p>Đăng ngày <%=c.getDate().toString()%>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="review__ratings__type d-flex">
                                        <div class="review-ratings">
                                            <div class="rating-summary d-flex text-secondary">
                                                <%=c.content%>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <%}%>
                                <div class="review-fieldset">
                                    <h4>Phản hồi của bạn:</h4>
                                    <h5><%=product.getName()%>
                                    </h5>
                                    <form action="<%=Util.fullPath("AddComment")%>" method="post">
                                        <div class="review-field-ratings">
                                            <div class="product-review-table">
                                                <div class="review-field-rating d-flex">
                                                    <span>Sao</span>
                                                    <ul class="rating d-flex">
                                                        <li type="radio" value="1" name="star" id="1*" checked>
                                                            <input type="radio" value="1" name="star" checked><label
                                                                for="1*"><i onclick="star1()" id="star1"
                                                                            class="fa fa-star-o"></i></label></li>
                                                        <li type="radio" value="2" name="star" id="2*">
                                                            <input type="radio" value="2" name="star"><label for="2*"><i
                                                                onclick="star2()" id="star2"
                                                                class="fa fa-star-o"></i></label></li>
                                                        <li type="radio" value="3" name="star" id="3*">
                                                            <input type="radio" value="3" name="star"><label for="3*"><i
                                                                onclick="star3()" id="star3"
                                                                class="fa fa-star-o"></i></label></li>
                                                        <li type="radio" value="4" name="star" id="4*">
                                                            <input type="radio" value="4" name="star"><label for="4*"><i
                                                                onclick="star4()" id="star4"
                                                                class="fa fa-star-o"></i></label></li>
                                                        <li type="radio" value="5" name="star" id="5*">
                                                            <input type="radio" value="4" name="star"><label for="5*"><i
                                                                onclick="star5()" id="star5"
                                                                class="fa fa-star-o"></i></label></li>
                                                    </ul>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="review_form_field">
                                            <div class="input__box">
                                                <span>Nhận xét</span>
                                                <textarea name="review"></textarea>
                                            </div>
                                            <div class="review-form-actions">
                                                <input type="text" hidden value="<%=productID%>" name="id" id="id">
                                                <button type="submit">Gửi</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- End Single Tab Content -->
                        </div>
                    </div>
                    <div class="wn__related__product pt--80 pb--50">
                        <div class="section__title text-center">
                            <h2 class="title__be--2">Sản phẩm liên quan</h2>
                        </div>
                        <div class="row mt--60">
                            <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                <%
                                    for (Shoe s : lstRelatedProduct) {

                                %>
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><img
                                                src="<%=Util.fullPath(s.getImage().get(1))%>"
                                                alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><img
                                                src="<%=Util.fullPath(s.getImage().get(2))%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">RELATED</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><%=s.getName()%>
                                        </a></h4>
                                        <ul class="prize d-flex">
                                            <li><%=s.insert(s.getPrice())%><%=" "%>đ
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><i
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
                                <!-- Start Single Product -->
                                <%}%>
                            </div>
                        </div>
                    </div>
                    <div class="wn__related__product">
                        <div class="section__title text-center">
                            <h2 class="title__be--2">sản phẩm tăng giá</h2>
                        </div>
                        <div class="row mt--60">
                            <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                <%
                                    for (Shoe s : lstUpsellProduct) {

                                %>
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><img
                                                src="<%=Util.fullPath(s.getImage().get(1))%>"
                                                alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><img
                                                src="<%=Util.fullPath(s.getImage().get(2))%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">UPSELL</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><%=s.getName()%>
                                        </a></h4>
                                        <ul class="prize d-flex">
                                            <li><%=s.insert(s.getPrice())%><%=" "%>đ
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><i
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
                                <!-- Start Single Product -->
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- End main Content -->
    <script>
        function star1() {
            $("#star1").removeClass("fa-star-o");
            $("#star1").addClass("fa-star");
            $("#star2").removeClass("fa-star");
            $("#star2").addClass("fa-star-o");
            $("#star3").removeClass("fa-star");
            $("#star3").addClass("fa-star-o");
            $("#star4").removeClass("fa-star");
            $("#star4").addClass("fa-star-o");
            $("#star5").removeClass("fa-star");
            $("#star5").addClass("fa-star-o");
        }

        function star2() {
            star1();
            $("#star2").removeClass("fa-star-o");
            $("#star2").addClass("fa-star");
            $("#star3").removeClass("fa-star");
            $("#star3").addClass("fa-star-o");
            $("#star4").removeClass("fa-star");
            $("#star4").addClass("fa-star-o");
            $("#star5").removeClass("fa-star");
            $("#star5").addClass("fa-star-o");
        }

        function star3() {
            star2();
            $("#star3").removeClass("fa-star-o");
            $("#star3").addClass("fa-star");
            $("#star4").removeClass("fa-star");
            $("#star4").addClass("fa-star-o");
            $("#star5").removeClass("fa-star");
            $("#star5").addClass("fa-star-o");
        }

        function star4() {
            star3();
            $("#star4").removeClass("fa-star-o");
            $("#star4").addClass("fa-star");
            $("#star5").removeClass("fa-star");
            $("#star5").addClass("fa-star-o");
        }

        function star5() {
            star4();
            $("#star5").removeClass("fa-star-o");
            $("#star5").addClass("fa-star");
        }
    </script>

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

    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>