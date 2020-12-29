<%@ page import="java.sql.SQLException" %>
<%@ page import="vn.nlu.banana.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.nlu.banana.model.ListCategory" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.nlu.banana.Util.Util" %>
<%@ page import="vn.nlu.banana.model.Type" %>
<%@ page import="vn.nlu.banana.model.Shoe" %>
<%@ page import="vn.nlu.banana.model.ListProduct" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.nlu.banana.model.Cart" %>
<%@ page import="vn.nlu.banana.model.*" %>
<%@ page import="vn.nlu.banana.model.Image" %>
<%--
  Created by IntelliJ IDEA.
  User: COMPUTER
  Date: 11/17/2019
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");
%>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="css/header.css">
<body>
<%
    List<Type> lst = new ArrayList<>();
    Shoe shoe = new Shoe();
    try {
        lst = ListCategory.getListCategory();
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
    Cart wishlist = (Cart) session.getAttribute("wishlist");
    if (wishlist == null) {
        wishlist = new Cart();
        session.setAttribute("wishlist", wishlist);
    }



%>
<header class="header_area">
    <%
        if (session.getAttribute("user") == null) {

    %>
    <div class="sub-nav">
        <span> <a href="login.jsp">ĐĂNG NHẬP</a></span>
        <span>/</span>
        <span> <a href="sign-up.jsp">ĐĂNG KÍ</a></span>
    </div>
    <%}%>
    <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
        <!-- Classy Menu -->
        <nav class="classy-navbar" id="essenceNav">
            <!-- Logo -->
            <a class="nav-brand" href="index.jsp"><img src="imgs/core-img/logo.png" alt="" width="150&"></a>
            <!-- Navbar Toggler -->
            <div class="classy-navbar-toggler">
                <span class="navbarToggler"><span></span><span></span><span></span></span>
            </div>
            <!-- Menu -->
            <div class="classy-menu">
                <!-- close btn -->
                <div class="classycloseIcon">
                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                </div>
                <!-- Nav Start -->
                <div class="classynav">
                    <ul>
                        <li><a href="index.jsp" <%if (pageCurrent == 0) {%> class="active" <%}%>>TRANG CHỦ</a></li>
                        <% for (Type t : lst) {
                        %>
                        <li><a href="product.jsp?type=<%=t.getId()%>"<%if (pageCurrent == t.getId()) {%>
                               class="active" <%}%>><%=t.getName()%>
                        </a></li>
                        <%}%>
                        <li><a href="contact.jsp"<%if (pageCurrent == (-1)) {%> class="active" <%}%>>LIÊN HỆ</a></li>
                        <li><a href="blog.jsp"<%if (pageCurrent == (-2)) {%> class="active" <%}%>>BLOG</a></li>

                    </ul>
                </div>
                <!-- Nav End -->
            </div>
        </nav>

        <!-- Header Meta Data -->
        <div class="header-meta d-flex clearfix justify-content-end">
            <!-- Search Area -->
            <div class="search-area">
                <form action="<%=Util.fullPath("result")%>">
                    <input type="search" name="search" id="search" placeholder="Nhập để tìm kiếm">
                    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                </form>
            </div>
            <!-- Favourite Area -->
            <div type="button" class="favourite-area bg-white">
                <a href="withlist.jsp"><img src="imgs/core-img/heart.svg" alt="">
                    <span><%=wishlist.getData().size()%></span></a>
            </div>

            <%
                if (session.getAttribute("user") != null) {

            %>
            <div class="nav-item dropdown user-login-info">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <img src="imgs/core-img/user.svg" alt="">
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="profile-user.jsp"><i class="fa fa-user"></i><%="\t"%>Tài khoản</a>
                    <% if (session.getAttribute("user") != null) {
                        User u = (User) session.getAttribute("user");
                        if (u.getAdmin() == 1) { %>

                    <a class="dropdown-item" href="admin/index.jsp"><i class="fa fa-user"></i><%="\t"%>Admin</a>
                    <%
                            }
                        }
                    %>
                    <a class="dropdown-item" href="history.jsp"><i class="fa fa-paper-plane"></i><%="\t"%>Đơn mua</a>
                    <a class="dropdown-item" href="<%=Util.fullPath("DoLogout")%>"><i class="fa fa-power-off"></i><%="\t"%>Đăng xuất</a>
                </div>

            </div>
            <%} else{%>
            <div class="nav-item dropdown user-login-info">
            </div>
            <%}%>
            <!-- Cart Area -->
            <div type="button" class="cart-area bg-white ">
                <a id="essenceCartBtn"><img src="imgs/core-img/bag.svg"
                                            alt=""><span><%=cart.getData().size()%></span></a>
            </div>
        </div>

    </div>
</header>
<div class="cart-bg-overlay"></div>

<div class="right-side-cart-area">

    <!-- Cart Button -->
    <div class="cart-button">
        <a href="" id="rightSideCart"><img src="imgs/core-img/bag.svg" alt="">
            <span><%=cart.getData().size()%></span></a>
    </div>

    <div class="cart-content d-flex">

        <!-- Cart List Area -->
        <div class="cart-list">
            <!-- Single Cart Item -->
            <%for (Item item : cart.getData()) {%>
            <div class="single-cart-item">
                <a href="http://localhost:8080/ltw/detail.jsp?id=<%=item.getShoe().getId()%>" class="product-image">
                    <img src="<%=Util.fullPath(item.getShoe().getImage().get(3))%>" class="cart-thumb" alt="">
                    <!-- Cart Item Desc -->
                    <div class="cart-item-desc">
                        <%--                        <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>--%>
                        <span class="badge"><%=ListCategory.getTypeName(item.getShoe().getIdType())%></span>
                        <h6><%=item.getShoe().getName()%>
                        </h6>
                        <p class="size">Size: <%=item.getSize()%>
                        </p>
                        <p class="color">Quantity: <%=item.getQuantity()%>
                        </p>
                        <p class="price"><%=shoe.insert(item.getShoe().getPrice())%><%=" "%>đ
                        </p>
                    </div>
                </a>
            </div>

            <%}%>
        </div>

        <!-- Cart Summary -->
        <div class="cart-amount-summary">
            <h2>Tổng quan </h2>
            <ul class="summary-table">
                <li><span>Tạm tính:</span> <span><%=shoe.insert(cart.total())%><%=" "%>đ</span></li>
                <li><span>Vận chuyển:</span> <span>Miễn phí</span></li>
                <li><span>Giảm giá:</span> <span>0%</span></li>
                <li><span>Tổng:</span> <span><%=shoe.insert(cart.total())%><%=" "%>đ</span></li>
            </ul>
            <div class="checkout-btn mt-100 mr-4">
                <a href="<%=Util.fullPath("cart.jsp")%>" class="btn essence-btn">đi tới giỏ hàng</a>
            </div>
        </div>
    </div>
</div>
</body>


</html>

