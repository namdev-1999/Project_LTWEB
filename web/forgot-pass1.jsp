<%@ page import="vn.nlu.banana.Util.Util" %>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" href="imgs/core-img/favicon.ico">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/login/util.css">
    <link rel="stylesheet" type="text/css" href="css/login/main.css">

    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
            <p>&nbsp</p>
            <p></p>
            <blockquote>
                <%
                    String err = (String) request.getAttribute("err");
                    if (err == null)
                        err = "";
                %>
                <form class="login100-form validate-form" action="<%=Util.fullPath("DoForgot")%>" method="post">
					<span class="login100-form-title p-b-40">
						Forgot
					</span>
                    <div class="m-b-16">
                        <span style="color:#db030b; "><%=err %></span>
                    </div>
                    <div class="wrap-input100 validate-input m-b-16"
                         data-validate="Valid email is required: ex@abc.xyz">
                        <input class="input100" type="text" name="email" placeholder="Enter your email">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
							<span class="lnr lnr-envelope"></span>
						</span>
                    </div>

                    <div class="container-login100-form-btn p-t-25">
                        <button class="login100-form-btn">
                            Continue
                        </button>
                    </div>

                    <div class="text-center w-full p-t-115">
						<span class="txt1">
							Don't have an account?
						</span>

                        <a class="txt1 bo1 hov1" href="sign-up.jsp">
                            Sign up now
                        </a>
                    </div>
                </form>

            </blockquote>
            <p></p>
            <p></p>
        </div>
    </div>
</div>


<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="js/login/main.js"></script>

</body>
</html>