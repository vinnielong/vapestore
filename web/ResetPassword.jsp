<%-- 
    Document   : ResetPassword
    Created on : Nov 1, 2020, 6:18:56 PM
    Author     : Vinnie Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                                <h2 style="color: beige; font-family: 'Poppins';">Change Your Password</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        <%
            Account accounts = (Account) request.getAttribute("acc");
        %>
        <section class="login_part section_padding " style="padding: 0px;">
            <div class="container">
                <div class="row align-items-center">               
                    <div class="col-lg-6 col-md-6" style="margin: auto;">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3 style="text-align: center;">PASSWORD CHANGE<br> </h3>
                                <form class="row contact_form" action="reset" method="POST">
                                    <input type="hidden" class="form-control" id="username" name="username" value="<%=account.getUsername()%>" required>
                                    Old Password: 
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="oldpass" value="" required>
                                    </div><br>
                                    New Password:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="newpass" value="" required>
                                    </div><br>                            
                                    Re-enter New Password:
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="renewpass" value="" required>
                                    </div><br>   
                                    <%if (request.getAttribute("errorMsg") != null) {%>
                                    <div class="col-md-12 form-group p_star">
                                        <label for="incorrect" style="color: red;"><%=request.getAttribute("errorMsg")%></label>
                                    </div>
                                    <%}%>
                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="btn_3">reset</button>
                                        <a class="lost_pass" href="login">Skip! Go back to shopping</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
    </body>
</html>
