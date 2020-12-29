<%@ page import="vn.nlu.banana.model.User" %>
<%@ page import="vn.nlu.banana.model.Shoe" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/17/2019
  Time: 8:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    Shoe s = new Shoe();
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");
    if (session.getAttribute("user") == null) {
        response.sendRedirect("../login.jsp");
    }
    if (session.getAttribute("user") != null) {
        User u = (User) session.getAttribute("user");
        if (u.getAdmin() != 1) {
            response.sendRedirect("../notice.jsp");
        }
    }

%>
<header class="topbar">
    <nav class="navbar top-navbar navbar-expand-md navbar-dark">
        <!-- ============================================================== -->
        <!-- Logo -->
        <!-- ============================================================== -->
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">
                <!-- Logo icon --><b>
                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                <!-- Dark Logo icon -->
                <img src="assets/images/banana.png" alt="homepage" class="dark-logo"/>
                <!-- Light Logo icon -->
                <img src="assets/images/banana-light.png" alt="homepage" class="light-logo"/>
            </b>
            </a>
        </div>
        <!-- ============================================================== -->
        <!-- End Logo -->
        <!-- ============================================================== -->
       <% if (session.getAttribute("user") != null) {
        User u = (User) session.getAttribute("user");%>
        <div class="navbar-collapse">
            <!-- ============================================================== -->
            <!-- toggle and nav items -->
            <!-- ============================================================== -->
            <ul class="navbar-nav mr-auto">
                <!-- This is  -->
                <li class="nav-item hidden-sm-up"><a class="nav-link nav-toggler waves-effect waves-light"
                                                     href="javascript:void(0)"><i class="ti-menu"></i></a></li>
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Search -->
                <!-- ============================================================== -->
            </ul>
            <ul class="navbar-nav my-lg-0">
                <!-- ============================================================== -->
                <!-- User profile and search -->
                <!-- ============================================================== -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="#"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ti-user fa-lg"
                                                                                            style="color: #868686"></i></a>
                    <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                        <span class="with-arrow"><span class="bg-primary"></span></span>
                        <div class="d-flex no-block align-items-center p-15 bg-primary text-white m-b-10">
                            <div class=""><i class="far fa-user-circle fa-3x" style="color: #ffffff"></i></div>
                            <div class="m-l-10">
                                <h4 class="m-b-0"><%=u.getName()%>
                                </h4>
                                <p class=" m-b-0">
                                </p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="../profile-user.jsp"><i class="ti-user m-r-5 m-l-5"></i> Trang cá
                            nhân
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../index.jsp"><i class="ti-settings m-r-5 m-l-5"></i>
                            Trang mua sắm</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<%=Util.fullPath("DoLogout")%>"><i
                                class="fa fa-power-off m-r-5 m-l-5"></i> Đăng xuất </a>
                        <div class="dropdown-divider"></div>
                    </div>
                </li>
                <!-- ============================================================== -->
                <!-- User profile and search -->
                <!-- ============================================================== -->
                <li class="nav-item right-side-toggle"><a class="nav-link  waves-effect waves-light"
                                                          href="javascript:void(0)"><i class="ti-settings"></i></a>
                </li>
            </ul>
        </div>
        <%}%>
    </nav>
</header>

