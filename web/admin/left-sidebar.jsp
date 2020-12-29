<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/17/2019
  Time: 8:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.nlu.banana.Util.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");
%>

<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li><a href="index.jsp">Quản lý doanh thu<i class="far fa-circle text-success"></i></a></li>
                <li class="nav-small-cap"></li>
                <li><a class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i
                        class="ti-layout-menu-full"></i><span
                        class="hide-menu">Quản lý sản phẩm</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="product-manage.jsp">Tất cả sản phẩm<i class="ti-package"></i></a>
                        </li>
                        <li class="nav-small-cap"></li>
                        <li><a href="product-manage.jsp?sorter=<%="hot"%>">Sản phẩm bán chạy<i
                                class="ti-package"></i></a>
                        </li>
                        <li class="nav-small-cap"></li>
                        <li><a href="product-manage.jsp?sorter=<%="new"%>">Sản phẩm mới<i
                                class="ti-package"></i></a>
                        </li>
                        <li class="nav-small-cap"></li>
                        <li><a href="product-manage.jsp?sorter=<%="related"%>">Sản phẩm liên quan<i
                                class="ti-package"></i></a>
                        </li>
                        <li class="nav-small-cap"></li>
                        <li><a href="product-manage.jsp?sorter=<%="upsell"%>">Sản phẩm tăng giá<i
                                class="ti-package"></i></a>
                        </li>
                    </ul>
                </li>
                <li class="nav-small-cap"></li>
                <li><a href="order-manage.jsp">Quản lý đơn hàng<i
                        class="ti-layout-accordion-merged"></i></a></li>
                <li class="nav-small-cap"></li>
                <li><a href="sale-manage.jsp">Quản lý khuyến mãi<i
                        class="ti-layout-tab"></i></a></li>
                <li class="nav-small-cap"></li>
                <li><a href="user-manage.jsp">Quản lý người dùng<i
                        class="ti-credit-card"></i></a></li>
                <li class="nav-small-cap"></li>
                <li><a href="producer-manage.jsp" title="Quản lý nhà sản xuất">Quản lý NSX<i
                        class="ti-pie-chart"></i></a></li>
                <li class="nav-small-cap"></li>
                <li><a href="comment-manage.jsp" title="Quản lý comment">Quản lý comment<i
                        class="ti-pie-chart"></i></a></li>
                <li class="nav-small-cap"></li>
                <li><a href="blog-manage.jsp">Quản lý blog<i
                        class="ti-pie-chart"></i></a></li>
                <li class="nav-small-cap"></li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
