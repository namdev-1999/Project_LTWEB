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
    <link rel="stylesheet" href="css/profile/profile.css">

    <!--fotorama-->
    <!-- jQuery 1.8 or later, 33 KB -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Fotorama from CDNJS, 19 KB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

</head>
<body>
<%
    int pageCurrent = -10;
    User user = null;
    if (session.getAttribute("user") != null) {
        user= (User) session.getAttribute("user");
    }
%>

<%@include file="header.jsp" %>
<!-- Start main Content -->
<div class="maincontent ">
    <div class="container">
        <div class="row path">
            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                <span>  <a href="index.jsp">TRANG CHỦ</a></span>
                <span>/</span>
                <span><a class="active" href="profile-user.jsp">TÀI KHOẢN CỦA TÔI</a></span>
            </div>
            <div class="col-lg-9 col-12"></div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                <div class="shop__sidebar">
                    <aside class="wedget__categories poroduct--cat">
                        <h3 class="wedget__title">Cài đặt</h3>
                        <ul>
                            <li><a href="profile-user.jsp">Tài khoản của tôi</a></li>
                            <li><a href="history.jsp">Lịch sử mua hàng</a></li>
                        </ul>
                    </aside>
                </div>
            </div>
            <div class="col-lg-9 col-12">
                <div class="wn__single__product">
                    <div class="row">
                        <div class="col-lg-9 col-12">
                            <div class="review_form_field">
                                <div class="row">
                                    <div class="input__box col-md-12 col-sm-12">
                                        <span>Họ Tên</span>
                                        <input id="first-name" type="text" name="first-name" value="<%=user.getName()%>">
                                    </div>

                                </div>
                                <div class="input__box">
                                    <span>Email</span>
                                    <input id="email" type="email" name="email" value="<%=user.getEmail()%>">
                                </div>
                                <div class="input__box overflow-hidden">
                                    <span>Giới tính</span>
                                    <div class="input ">
                                        <input type="radio" name="gender" value="Male" id="Male" checked/>
                                        <label for="Male">Name</label>
                                        <input type="radio" name="gender" value="Female" id="Female"/>
                                        <label for="Female">Nữ</label>
                                    </div>
                                </div>
                                <div class="input__box">
                                    <span>Số điện thoại</span>
                                    <div class="input__subbox">
                                        <input id="phone" type="text" name="phone" value="<%=user.getPhone()%>" disabled>
                                        <div class="change"><a href="" title="Thay đổi số điện thoại">Thay đổi SĐT</a></div>
                                    </div>
                                </div>
                                <div class="input__box">
                                    <span>Địa chỉ</span>
                                    <div class="input__subbox">
                                        <input id="address" type="text" name="address" value="<%=user.getAddress()%>">
                                    </div>
                                </div>

                                <div class="input__box">
                                    <span>Mật khẩu</span>
                                    <div class="input__subbox">
                                        <div class="change"><a href="changepass.jsp">Thay đổi mật khẩu</a></div>
                                    </div>
                                </div>
                                <div class="input__box">
                                    <span>Mô tả bản thân</span>
                                    <textarea name="about"></textarea>
                                </div>
                                <div class="review-form-actions">
                                    <button class="btn btn-primary">Lưu</button>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- End main Content -->


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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>