<%-- 
    Document   : Change Password
    Created on : Oct 29, 2020, 7:12:48 PM
    Author     : Vinnie Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <%@include file="components/head.jsp"%>  
    <body>
        <%@include file="components/header.jsp" %>        
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/category.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Create Account</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!--================login_part Area =================-->
        <section class="login_part section_padding " style="padding: 0px;">
            <div class="container">
                <div class="row align-items-center">               
                    <div class="col-lg-6 col-md-6" style="margin: auto;">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3 style="text-align: center;">CREATE NEW ACCOUNT <br>
                                    Please enter all fields below to get access to our shop.</h3>
                                <form class="row contact_form" action="register" method="POST">  
                                    <%if(request.getAttribute("errorMsg") != null) {%>
                                    <div class="col-md-12 form-group p_star">
                                        <label for="incorrect" style="color: red;"><%=request.getAttribute("errorMsg")%></label>
                                    </div>
                                    <%}%>
                                    Username:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="password" name="username" value="" required></div><br>
                                    Full Name:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="password" name="fullname" value="" required></div><br>
                                    E-mail:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="email" class="form-control" id="password" name="email" value="" required></div><br>
                                    Address:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="password" name="address" value="" required></div><br>
                                    Phone Number:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="password" name="phonenumber" value="" required></div><br>
                                    Password:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="pass" value="" required></div><br>
                                    Re-Password:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="repass" value="" required></div><br>
                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="btn_3">create</button>
                                        <a class="lost_pass" href="login">Already have an account? Login!</a>
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
