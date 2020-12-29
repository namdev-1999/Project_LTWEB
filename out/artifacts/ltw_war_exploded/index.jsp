<%@ page import="java.util.Random" %>
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
    <link rel="stylesheet" href="scss/style.scss">
    <link rel="stylesheet" href="css/template/bootstrap.min.css">

    <!--===============================================================================================-->
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->

    <link rel="stylesheet" type="text/css" href="css/contact/util.css">
    <link rel="stylesheet" type="text/css" href="css/contact/main.css">
    <link rel="stylesheet" href="css/maincontent.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/template/core-style.css">
    <link rel="stylesheet" href="css/index/index.css">
    <link rel="stylesheet" href="css/index/slide.css">
    <style>.mySlides {
        display: none
    }

    .w3-left, .w3-right, .w3-badge {
        cursor: pointer
    }

    .w3-badge {
        height: 13px;
        width: 13px;
        padding: 0
    }</style>
</head>
<body>
<%

    Shoe product = new Shoe();
    Image img = new Image();
    List<Shoe> lstNewProduct = ListProduct.getNewListProduct();
    List<Shoe> lstHotProduct = ListProduct.getHotListProduct();
    int pageCurrent = 0;
%>

<%@include file="header.jsp" %>
<button id="qc" type="button" class="btn btn-primary d-none" data-toggle="modal" data-target="#myModal" > click
</button>

<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close pt-3 pr-3" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <%Ads ad;
            ArrayList<Ads> listAd = (ArrayList<Ads>) Ads.getListAds();
            int random = new Random().nextInt(listAd.size());
            ad=listAd.get(random);
            %>
            <div class="modal-body">
                <img src="<%=ad.getImg()%>" alt="">
            </div>

        </div>
    </div>
</div>

</div>


<!-- Start QC -->
<!-- Start main Content -->
<div class="w3-content w3-display-container pt-4" style="max-width:1700px;">
    <img class="mySlides" src="imgs/slide-show/1.svg" style="width:1700px;">
    <img class="mySlides" src="imgs/slide-show/2.svg" style="width:1700px;">
    <img class="mySlides" src="imgs/slide-show/3.svg" style="width:1700px;">
    <div class="w3-center w3-container w3-section w3-large text-white w3-display-bottommiddle" style="width:100% ;">
        <div class="w3-left w3-hover-text-khaki page-link bg-light" onclick="plusDivs(-1)">&#10094;</div>
        <div class="w3-right w3-hover-text-khaki page-link bg-light" onclick="plusDivs(1)">&#10095;</div>
        <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
        <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
        <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
    </div>
</div>

<script>
    var slideIndex = 0;
    carousel();

    function plusDivs(n) {
        showDivs(slideIndex += n);
    }

    function currentDiv(n) {
        showDivs(slideIndex = n);
    }

    function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        if (n > x.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = x.length
        }
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" w3-white", "");
        }
        x[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " w3-white";
    }


    function carousel() {
        showDivs(slideIndex);
        slideIndex++;
        if (slideIndex > 3) {
            slideIndex = 1
        }
        ;
        setTimeout(carousel, 4000); // Change image every 2 seconds
    }

</script>

<section class="ftco-section ftco-no-pt ftco-no-pb">
    <div class="container">
        <div class="row no-gutters ftco-services">
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <span class="fa fa-truck"> </span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Miễn phí vận chuyển</h3>
                        <p>Khi mua hàng online, một trong những ưu tiên hàng đầu của khách hàng là phí vận chuyển, và
                            Banana là một trong những kênh mua sắm trực tuyến có chính sách miễn phí vận chuyển Banana
                            cho khách hàng.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <span class="fa fa-users"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Hỗ trợ khách hàng</h3>
                        <p>Nếu bạn gặp khó khăn hay bạn cần hỗ trợ của Banana thì bạn hãy gọi đến số điện thoại đường
                            dây nóng của Banana 19001221 để nhận được hỗ trợ trực tiếp từ nhân viên tổng đài hỗ trợ cả
                            người bán hàng và người mua 24/7.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <span class="fa fa-paypal"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Thanh toán an toàn</h3>
                        <p>Việc dùng đến ví điện tử để thực hiện thanh toán trực tuyến cũng là một trong những nhu cầu
                            ngày càng cao của người dùng. Bởi nó mang đến không ít sự thuận tiện cho người dùng có thể
                            thanh toán được những những chi phí sử dụng thông qua internet, thực hiện gửi tiền và nhận
                            tiền được nhanh chóng hơn.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="newproduct">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-12">
                <div class="wn__related__product pt--80 pb--50">

                    <div class="container">
                        <div class="section__title text-left">
                            <h2 class="title__be--2">Sản phẩm mới</h2>
                        </div>
                        <div class="row mt--60">
                            <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                <%
                                    for (Shoe s : lstNewProduct) {

                                %>
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><img
                                                src="<%=Util.fullPath(s.getImage().get(1))%>"
                                                alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><img
                                                src="<%=Util.fullPath(s.getImage().get(2))%>"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">NEW</span>
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
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <!-- End Single Product -->
                                <%}%>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<div class="hotproduct">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-12">
                <div class="wn__related__product pt--80 pb--50">

                    <div class="container">
                        <div class="section__title text-left">
                            <h2 class="title__be--2">Sản phẩm bán chạy</h2>
                        </div>
                        <div class="row mt--60">

                            <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                <%
                                    for (Shoe s : lstHotProduct) {

                                %>
                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><img
                                                src="<%=Util.fullPath(s.getImage().get(1))%>"
                                                alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="<%=Util.fullPath("detail.jsp?id="+s.getId())%>"><img
                                                src="<%=Util.fullPath(s.getImage().get(2))%>"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">HOT</span>
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
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<div id="dropDownSelect1"></div>
<!-- End main Content -->
<!-- ##### Brands Area Start ##### -->
<div class="row brands-area d-flex align-items-center justify-content-between">
    <!-- Brand Logo -->
    <div class="single-brands-logo col-2 col-sm-2">
        <a href=""> <img src="imgs/brands/1.png" alt=""></a>
    </div>
    <!-- Brand Logo -->
    <div class="single-brands-logo col-2 col-sm-2">
        <a href=""> <img src="imgs/brands/2.png" alt=""></a>
    </div>
    <!-- Brand Logo -->
    <div class="single-brands-logo col-2 col-sm-2">
        <a href=""> <img src="imgs/brands/3.png" alt=""></a>
    </div>
    <!-- Brand Logo -->
    <div class="single-brands-logo col-2 col-sm-2">
        <a href=""> <img src="imgs/brands/4.png" alt=""></a>
    </div>
    <!-- Brand Logo -->
    <div class="single-brands-logo col-2 col-sm-2">
        <a href=""> <img src="imgs/brands/5.png" alt=""></a>
    </div>
    <!-- Brand Logo -->
    <div class="single-brands-logo col-2 col-sm-2">
        <a href=""> <img src="imgs/brands/6.png" alt=""></a>
    </div>
</div>
<!-- ##### Brands Area End ##### -->

<!-- ##### Footer Area Start ##### -->
<%@include file="footer.jsp" %>
<!-- ##### Footer Area End ##### -->


<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<script>
    $(".selection-2").select2({
        minimumResultsForSearch: 20,
        dropdownParent: $('#dropDownSelect1')
    });
</script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="js/contact/main.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }

    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
</script>
<script>
    $(document).ready(function () {
        // Activate Carousel with a specified interval
        $("#bs4-slide-carousel").carousel({interval: 3000});

        // Enable Carousel Indicators
        $(".item1").click(function () {
            $("#bs4-slide-carousel").carousel(0);
        });
        $(".item2").click(function () {
            $("#bs4-slide-carousel").carousel(1);
        });
        $(".item3").click(function () {
            $("#bs4-slide-carousel").carousel(2);
        });

        // Enable Carousel Controls
        $(".carousel-control-prev").click(function () {
            $("#bs4-slide-carousel").carousel("prev");
        });
        $(".carousel-control-next").click(function () {
            $("#bs4-slide-carousel").carousel("next");
        });
    });
</script>
<script> var i = 1;
if (i == 1) {
    document.getElementById("qc").click();
    i++;
}</script>

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
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>--%>
</body>
</html>