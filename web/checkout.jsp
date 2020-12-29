<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <link rel="icon" href="imgs/core-img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Title  -->
    <title>Tittle</title>

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/template/core-style.css">

</head>

<body>

<%
    Shoe s = new Shoe();
    int pageCurrent = -10;
%>
<!-- ##### Header Area Start ##### -->
<%@include file="header.jsp" %>
<!-- ##### Header Area End ##### -->

<!-- ##### Right Side Cart Area ##### -->
<div class="cart-bg-overlay"></div>

<div class="right-side-cart-area">

    <!-- Cart Button -->
    <div class="cart-button">
        <a href="#" id="rightSideCart"><img src="img/core-img/bag.svg" alt=""> <span>3</span></a>
    </div>

    <div class="cart-content d-flex">

        <!-- Cart Summary -->
        <div class="cart-amount-summary">

            <h2>Summary</h2>
            <ul class="summary-table">
                <li><span>subtotal:</span> <span>$274.00</span></li>
                <li><span>delivery:</span> <span>Free</span></li>
                <li><span>discount:</span> <span>-15%</span></li>
                <li><span>total:</span> <span>$232.00</span></li>
            </ul>
            <div class="checkout-btn mt-100">
                <a href="checkout.jsp" class="btn essence-btn">check out</a>
            </div>
        </div>
    </div>
</div>
<!-- ##### Right Side Cart End ##### -->

<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb_area bg-img">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="page-title text-center">
                    <h2>Checkout</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### Checkout Area Start ##### -->
<div class="checkout_area section-padding-80">
    <div class="container">
        <form action="<%=Util.fullPath("Checkout")%>" method="post">
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="checkout_details_area mt-50 clearfix">

                        <div class="cart-page-heading mb-30">
                            <h5>Địa chỉ thanh toán</h5>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="first_name">Họ<span>*</span></label>
                                <input type="text" class="form-control" id="first_name" name="first_name">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="last_name">Tên <span>*</span></label>
                                <input type="text" class="form-control" id="last_name" name="last_name" required>
                            </div>
                            <div class="col-12 mb-3">
                                <label for="street_address">Địa chỉ <span>*</span></label>
                                <input type="text" class="form-control mb-3" id="street_address" name="street_address">
                            </div>
                            <div class="col-12 mb-3">
                                <label for="phone_number">Số điện thoại <span>*</span></label>
                                <input type="text" class="form-control" id="phone_number" name="phone_number">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                    <div class="order-details-confirmation">

                        <div class="cart-page-heading">
                            <h5>Đơn của bạn</h5>
                            <p>Chi tiết</p>
                        </div>

                        <ul class="order-details-form mb-4">
                            <li><span>Sản phẩm</span> <span>Tổng</span></li>
                            <li><span></span> <span><%=s.insert(cart.total())%><%=" "%>đ</span></li>
                            <li><span>Phụ phí</span> <span>0.00<%=" "%>đ</span></li>
                            <li><span>Phí ship</span> <span>miễn phí</span></li>
                            <li><span>Tổng</span> <span><%=s.insert(cart.total())%><%=" "%>đ</span></li>
                        </ul>

                        <button type="submit"><a class="btn essence-btn">Đặt hàng</a></button>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>
<!-- ##### Checkout Area End ##### -->

<!-- ##### Footer Area Start ##### -->
<%@include file="footer.jsp" %>
<!-- ##### Footer Area End ##### -->

<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/checkout/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/checkout/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="js/checkout/plugins.js"></script>
<!-- Classy Nav js -->
<script src="js/checkout/classy-nav.min.js"></script>
<!-- Active js -->
<script src="js/checkout/active.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


</body>

</html>