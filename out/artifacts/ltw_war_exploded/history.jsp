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
    <link rel="stylesheet" href="css/history.css">

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
        user = (User) session.getAttribute("user");
    }

    List<Order> listOrder = ListOrder.getListOrderByIdUser(user.getId());
%>


<%@include file="header.jsp" %>
<!-- Start main Content -->
<div class="maincontent ">
    <div class="container">
        <div class="row path">
            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                <span>  <a href="index.jsp">TRANG CHỦ</a></span>
                <span>/</span>
                <span><a class="active" href="product.jsp">LỊCH SỬ MUA HÀNG</a></span>
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
                    <%
                        int k = 0;
                        for (Order order : listOrder
                        ) {
                            k++;
                    %>
                    <div class="col-lg-9 col-12 bg-his rounded">
                        <div class="row border-bottom border-secondary mb-2 ">
                            <div class="col-6 text-left p-2 text-secondary"><%=order.getDate()%>
                            </div>
                            <div class="col-6 text-right p-2 text-danger"><%if (order.getStatus() == 1) {%>Chờ xác
                                nhận <%}%>
                                <%if (order.getStatus() == 2) {%>Đang giao <%}%>
                                <%if (order.getStatus() == 3) {%>Đã giao<%}%></div>
                        </div>
                        <div class="order-content-item row  border-secondary border-bottom pb-3">
                            <%
                                Shoe s = new Shoe();

                                for (OrderItem orderItem : order.getListOrderItem()
                                ) {

                            %>
                            <div class="order-content-item-image col-2">
                                <img src="<%=orderItem.getUrlImg()%>">
                            </div>
                            <div class="order-content-item-detail col-7 text-center">
                                <span class="text-center"><%=orderItem.getName()%></span><br>
                                <span class="text-center">x<%=orderItem.getQuantity()%></span>

                            </div>
                            <div class="order-content-item-price col-3 d-flex justify-content-between"><br>

                                <span class="text-secondary"><%=s.insert(orderItem.getPrice())%><%=" "%>đ</span>

                            </div>
                            <%}%>
                        </div>
                        <div class="row border-bottom mb-2">

                            <div class="col-9 text-right p-2 text-danger pr-2">
                                <button class="view-detail btn btn-danger" style=""
                                        data-toggle="modal" data-target="#myModal<%=k%>">
                                    Chi tiết
                                </button>
                                <div id="myModal<%=k%>" class="modal">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Chi tiết</h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">&times;
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table">
                                                    <thead class="thead-light">
                                                    <tr>
                                                        <th scope="col" class="text-left">Địa chỉ nhận hàng</th>
                                                        <th scope="col" class="text-left">Tên người nhận</th>
                                                        <th scope="col" class="text-left">Số điện thoại</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td class="text-left"><%=order.getAddress()%>
                                                        </td>
                                                        <td class="text-left"><%=order.getName()%>
                                                        </td>
                                                        <td class="text-left"><%=order.getPhone()%>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Close
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 text-right p-2 text-secondary ">Tổng
                                tiền: <%=s.insert(order.getTotal())%><%=" "%>đ
                            </div>

                        </div>
                    </div>
                    <%}%>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>