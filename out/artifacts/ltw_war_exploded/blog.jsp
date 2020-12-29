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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="scss/style.scss">
    <link rel="stylesheet" href="css/maincontent.css">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Title  -->
    <title>Essence - Fashion Ecommerce Template</title>
    <!-- Favicon  -->
    <link rel="icon" href="imgs/core-img/favicon.ico">
    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/template/core-style.css">
    <!--    <link rel="stylesheet" href="style.css">-->
    <link rel="stylesheet" href="css/list-product/nike.css">

</head>

<body>
<%
    String type = "";
    if (request.getParameter("type") != null) {
        type = request.getParameter("type");
    } else {
        type = "1";
    }
    int pageCurrent = -2;

    String numpage = "";
    if (request.getParameter("page") != null) {
        numpage = request.getParameter("page");
    } else {
        numpage = "1";
    }
    List<Shoe> list = ListProduct.getListProductByCategory(Integer.parseInt(type));
    List<Blog> lstBlog = ListBlog.getListBlog();

%>
<!-- ##### Header Area Start ##### -->
<%@include file="header.jsp" %>
<!-- ##### Header Area End ##### -->

<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb_area breadcumb-style-two bg-img" style="background-image: url(imgs/blog/breadcumb2.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="page-title text-center">
                    <h2>Fashion Blog</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### Blog Wrapper Area Start ##### -->
<div class="blog-wrapper section-padding-80">
    <div class="container">
        <div class="row">
            <% int count = 0;
                for (int i = 4 * (Integer.parseInt(numpage) - 1); i < lstBlog.size(); i++) {
                    Blog b = lstBlog.get(i);
                    count++;
                    if (count >= 5) {
                        break;
                    }
            %>
            <!-- Single Blog Area -->
            <div class="col-12 col-lg-6">
                <div class="single-blog-area mb-50">
                    <a href="blogdetail.jsp?id=<%=b.getId()%>"></a><img
                        src="<%=Util.fullPath("imgs/blog/blog"+count+".jpg")%>" alt="">
                    <!-- Post Title -->
                    <div class="post-title">
                        <a href="blogdetail.jsp?id=<%=b.getId()%>"><%=b.getTitle()%>
                        </a>
                    </div>
                    <!-- Hover Content -->
                    <div class="hover-content">
                        <!-- Post Title -->
                        <div class="hover-post-title">
                            <a href="blogdetail.jsp?id=<%=b.getId()%>"><%=b.getTitle()%>
                            </a>
                        </div>
                        <p><%=b.getTitleContent()%>.</p>
                        <a href="blogdetail.jsp?id=<%=b.getId()%>">Continue reading <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
            <%}%>
            <nav aria-label="navigation" class="mr-auto ml-auto">
                <ul class="pagination mt-50 mb-70 ">
                    <li class="page-item"><a class="page-link"
                                             href="blog.jsp?page=<%if (Integer.parseInt(numpage)-1 > 0){%><%=Integer.parseInt(numpage)-1 %><%}else{%><%=1%><%}%>"><i
                            class="fa fa-angle-left"></i></a></li>
                    <% double i = (double) lstBlog.size() / (double) 4;
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
                            href="blog.jsp?page=<%=j%>"><%=j%>
                    </a></li>
                    <% }
                    %>
                    <li class="page-item"><a class="page-link"
                                             href="blog.jsp?page=<%if (Integer.parseInt(numpage)+1 <= countpage){%><%=Integer.parseInt(numpage)+1 %><%}else{%><%=countpage%><%}%>"><i
                            class="fa fa-angle-right"></i></a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- ##### Blog Wrapper Area End ##### -->

<!-- ##### Footer Area Start ##### -->
<%@include file="footer.jsp" %>
<!-- ##### Footer Area End ##### -->

<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/cart/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/cart/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="js/menu/plugins.js"></script>
<!-- Classy Nav js -->
<script src="js/menu/classy-nav.min.js"></script>
<!-- Active js -->
<script src="js/menu/active.js"></script>

<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>

</html>