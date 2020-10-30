<%-- 
    Document   : Change Password
    Created on : Oct 29, 2020, 7:12:48 PM
    Author     : Vinnie Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <%@include file="head.jsp"%>  
    <body>
        <%@include file="header.jsp" %>        
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/category.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Reset Password</h2>
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
                    <div class="col-lg-6 col-md-6" style="margin: auto;">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3 style="text-align: center;">RESET YOUR PASSWORD <br>
                                    Please enter your e-mail to reset password</h3>
                                <form class="row contact_form" action="#" method="post" novalidate="novalidate">                                   
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="email" value=""
                                               placeholder="E-mail">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="btn_3">
                                            reset
                                        </button>
                                        <a class="lost_pass" href="#">Skip</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================login_part end =================-->

        <%@include file="footer.jsp"%> 
        <%@include file="script.jsp"%> 
    </body>

</html>
