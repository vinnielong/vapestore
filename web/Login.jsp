<%-- 
    Document   : Login
    Created on : Oct 29, 2020, 7:02:27 PM
    Author     : Vinnie Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <%@include file="components/head.jsp"%>
    <body>
        <%@include file="components/header.jsp"%>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/category.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2 style="color: beige; font-family: 'Poppins';">Login</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!--================login_part Area =================-->
        <section class="login_part section_padding ">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center">
                            <div class="login_part_text_iner">
                                <h2>New to our Shop?</h2>
                                <p>There are advances being made in science and technology
                                    everyday, and a good example of this is the</p>
                                <a href="register" class="btn_3">Create an Account</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3>Welcome Back ! <br>
                                    Please Sign in now</h3>
                                <form class="row contact_form" action="login" method="post">
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="name" name="name" value="" placeholder="Username" required>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="password" value="" placeholder="Password" required>
                                    </div>
                                    <%if(request.getAttribute("errorMsg") != null) {%>
                                    <div class="col-md-12 form-group p_star">
                                        <label for="incorrect" style="color: red;"><%=request.getAttribute("errorMsg")%></label>
                                    </div>
                                    <%}%>
                                    <div class="col-md-12 form-group">                                       
                                        <button type="submit" value="submit" class="btn_3">log in</button>
                                        <a class="lost_pass" href="reset">forget password?</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================login_part end =================-->
        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
    </body>
</html>
