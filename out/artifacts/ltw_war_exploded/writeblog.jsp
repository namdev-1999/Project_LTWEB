<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    }

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
    <link rel="stylesheet" href="css/writeblog.css">
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


<!-- ##### Blog Wrapper Area Start ##### -->
<div class="blog-wrapper section-padding-80">
    <form action="<%=Util.fullPath("WriteBlog")%>">
        <div class="container-fluid mr-5">
            <div class="row">
                <div class="col-12 d-flex mb-2 title">
                    <label class="pl-3 pb-3 pt-2">Bài đăng</label>
                    <input class="form-control  ml-3" type="text" name="title" placeholder="Tiêu đề bài đăng">
                    <a href="">
                        <button type="submit" class="btn btn-warning rounded w-100 ml-2">Xuất bản</button>
                    </a>
                    <a href="admin/blog-manage.jsp">
                        <button class="btn btn-warning rounded w-100 ml-4">Đóng lại</button>
                    </a>
                </div>
                <div class="col-12 d-flex mb-2 ">
                    <label class="pl-3 pb-3 pt-2">Mô tả</label>
                    <input class="form-control  ml-3" type="text" name="titleContent" placeholder="Mô tả bài đăng">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12 form">
                    <div id="form">
                <textarea name="desc" type="text" class="form-control"
                          id="desc"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
<script src="ckeditor/ckeditor.js"></script>
<script src="ckfinder/ckfinder.js"></script>
<script>
    var f = CKEDITOR.replace("desc");
    CKFinder.setupCKEditor(f, "<%=Util.fullPath("ckfinder/")%>");
</script>

<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>

</html>
