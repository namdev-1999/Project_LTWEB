<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="css/cart/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" href="imgs/core-img/favicon.ico">
    <link rel="stylesheet" href="css/template/core-style.css">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.0.0/css/all.css"
          integrity="sha256-zpHiFE6if4IpLvLIfF2eHQuZlN9jg2EwKThlrKGPxVA=" crossorigin="anonymous"/>
    <link rel="stylesheet" href="scss/style.scss">
    <link rel="stylesheet" href="css/maincontent.css">
    <!--fotorama-->
    <!-- jQuery 1.8 or later, 33 KB -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Fotorama from CDNJS, 19 KB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

    <link rel="stylesheet" href="css/cart/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/cart/animate.css">

    <link rel="stylesheet" href="css/cart/owl.carousel.min.css">
    <link rel="stylesheet" href="css/cart/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/cart/magnific-popup.css">
    <link rel="stylesheet" href="css/cart/aos.css">
    <link rel="stylesheet" href="css/cart/ionicons.min.css">
    <link rel="stylesheet" href="css/cart/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/cart/jquery.timepicker.css">
    <link rel="stylesheet" href="css/cart/cart-ltw.css">


</head>
<body class="goto-here">
<%
    Shoe s = new Shoe();
    int pageCurrent = -10;
%>
<%@include file="header.jsp" %>
<!-- END nav -->


<section class="ftco-section ftco-cart">
    <div class="container">

        <div class="row path">
            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                <span>
                    <a class="" href="index.jsp">TRANG CHỦ</a>
                </span>
                <span>/</span>
                <span>
                    <a class="active " href="cart.jsp">GIỎ HÀNG</a>
                </span>
            </div>
        </div>
        <div class="row">

            <div class="col-md-12 ftco-animate">

                <div class="cart-list">
                    <table class="table">
                        <thead class="thead-primary">
                        <tr class="text-center">
                            <th>Hình ảnh</th>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Size</th>
                            <th>Số lượng</th>
                            <th>Tống</th>
                            <th>Tác vụ</th>
                        </tr>
                        </thead>
                        <%for (Item item : cart.getData()) {%>
                        <tbody>
                        <tr class="text-center">

                            <td class="image-prod">
                                <div class="img"><img src="<%=item.getShoe().getImage().get(1)%>"></div>
                            </td>

                            <td class="product-name">
                                <h3><%=item.getShoe().getName()%>
                                </h3>
                                <p>Full box, full size....</p>
                            </td>

                            <td class="price"><%=item.insert(item.getShoe().getPrice())%><%=" "%>đ
                            </td>
                            <td class="size"><%=item.getSize()%>
                            </td>

                            <td class="quantity">
                                <div class="input-group bootstrap-touchspin">

                                       <span class="input-group-btn">
                                             <form action="<%=Util.fullPath("CartUpdate")%>">
                                           <input type="hidden" name="command" value="sub">
                                           <input type="hidden" name="id" value="<%=item.getShoe().getId()%>">
                                           <input type="hidden" name="size" value="<%=item.getSize()%>">
                                            <button
                                                    class="btn btn-default bootstrap-touchspin-down quantity-left-minus"
                                                    type="submit">-</button>
</form>
                                        </span>

                                    <span class="input-group-addon bootstrap-touchspin-prefix"
                                          style="display: none;"></span><input id="qty" disabled type="tel" name="qty"
                                                                               value="<%=item.getQuantity()%>"
                                                                               min="1" max="999999999"
                                                                               class="form-control"
                                                                               style="display: block;"><span
                                        class="input-group-addon bootstrap-touchspin-postfix"
                                        style="display: none;"></span>

                                    <span class="input-group-btn">
                                          <form action="<%=Util.fullPath("CartUpdate")%>">
                                           <input type="hidden" name="command" value="add">
                                           <input type="hidden" name="id" value="<%=item.getShoe().getId()%>">
                                           <input type="hidden" name="size" value="<%=item.getSize()%>">
                                            <button
                                                    class="btn btn-default bootstrap-touchspin-down quantity-left-minus"
                                                    type="submit">+</button>
</form>
                                        </span>

                                </div>
                                </p>
                            </td>

                            <td class="total"><%=s.insert(item.total())%><%=" "%>đ
                            </td>

                            <td class="product-remove"><a
                                    onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')"
                                    href="Cart?command=remove&id=<%=item.getShoe().getId()%>&size=<%=item.getSize()%>"
                                    title="Remove"><i
                                    class="fas fa-times"></i></a>
                            </td>

                        </tr><!-- END TR-->
                        </tbody>
                        <%}%>
                    </table>
                </div>

            </div>

        </div>
        <div class="row justify-content-start">

            <div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
                <div class="cart-total mb-3">
                    <h3>Tổng số giỏ hàng</h3>
                    <p class="d-flex">
                        <span>Tạm tính</span>
                        <span><%=s.insert(cart.total())%><%=" "%>đ</span>
                    </p>
                    <p class="d-flex">
                        <span>Vận chuyển</span>
                        <span>0.00<%=" "%>đ</span>
                    </p>
                    <p class="d-flex">
                        <span>Giảm giá</span>
                        <span>0.00<%=" "%>đ</span>
                    </p>
                    <hr>
                    <p class="d-flex total-price">
                        <span>Tổng</span>
                        <span><%=s.insert(cart.total())%><%=" "%>đ</span>
                    </p>
                </div>
                <p class="text-center"><a href="checkout.jsp" class="btn btn-dark py-3 px-4">Tiến hành thanh toán</a>
                </p>
            </div>
        </div>
    </div>
</section>


<%@include file="footer.jsp" %>


<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>


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

<script src="js/cart/jquery.min.js"></script>
<script src="js/cart/jquery-migrate-3.0.1.min.js"></script>
<script src="js/cart/popper.min.js"></script>
<script src="js/cart/bootstrap.min.js"></script>
<script src="js/cart/jquery.easing.1.3.js"></script>
<script src="js/cart/jquery.waypoints.min.js"></script>
<script src="js/cart/jquery.stellar.min.js"></script>
<script src="js/cart/owl.carousel.min.js"></script>
<script src="js/cart/jquery.magnific-popup.min.js"></script>
<script src="js/cart/aos.js"></script>
<script src="js/cart/jquery.animateNumber.min.js"></script>
<script src="js/cart/bootstrap-datepicker.js"></script>
<script src="js/cart/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/cart/google-map.js"></script>
<script src="js/cart/main.js"></script>

<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>