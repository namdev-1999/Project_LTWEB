<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");
%>
<!DOCTYPE html>
<html lang="en">
<% int pageCurrent = -2;
    String id = request.getParameter("id");
    Blog b = Blog.getBlogById(Integer.parseInt(id));
%>
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
    <title><%=b.getTitle()%>
    </title>
    <!-- Favicon  -->
    <link rel="icon" href="imgs/core-img/favicon.ico">
    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/template/core-style.css">
    <!--    <link rel="stylesheet" href="style.css">-->
    <link rel="stylesheet" href="css/list-product/nike.css">

</head>

<body>
<!-- ##### Header Area Start ##### -->
<%@include file="header.jsp" %>

<!-- ##### Header Area End ##### -->


<!-- ##### Blog Wrapper Area Start ##### -->
<div class="single-blog-wrapper">

    <!-- Single Blog Post Thumb -->
    <div class="single-blog-post-thumb">
        <img src="img/bg-img/bg-7.jpg" alt="">
    </div>

    <!-- Single Blog Content Wrap -->
    <div class="single-blog-content-wrapper d-flex">

        <!-- Blog Content -->
        <div class="single-blog--text">
            <%=b.getContent()%>
        </div>

        <!-- Related Blog Post -->
        <div class="related-blog-post">
            <!-- Single Related Blog Post -->
            <div class="single-related-blog-post">
                <img src="imgs/blog/rp1.jpg" alt="">
                <a href="#">
                    <h5>Cras lobortis nisl nec libero pulvinar lacinia. Nunc sed ullamcorper massa</h5>
                </a>
            </div>
            <!-- Single Related Blog Post -->
            <div class="single-related-blog-post">
                <img src="imgs/blog/rp2.jpg" alt="">
                <a href="#">
                    <h5>Fusce tincidunt nulla magna, ac euismod quam viverra id. Fusce eget metus feugiat</h5>
                </a>
            </div>
            <!-- Single Related Blog Post -->
            <div class="single-related-blog-post">
                <img src="imgs/blog/rp3.jpg" alt="">
                <a href="#">
                    <h5>Etiam leo nibh, consectetur nec orci et, tempus tempus ex</h5>
                </a>
            </div>
            <!-- Single Related Blog Post -->
            <div class="single-related-blog-post">
                <img src="imgs/blog/rp4.jpg" alt="">
                <a href="#">
                    <h5>Sed viverra pellentesque dictum. Aenean ligula justo, viverra in lacus porttitor</h5>
                </a>
            </div>
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
<script src="js/menu/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/menu/bootstrap.min.js"></script>
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