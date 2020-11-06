<%-- 
    Document   : Profile
    Created on : Oct 29, 2020, 7:12:04 PM
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
                                <h2 style="color: beige; font-family: 'Poppins';">My Profile</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        <div class="container" style="padding: 50px;">
            <div class="col-lg-8 col-md-8">
                <h3 class="mb-30">User Profile </h3>
                <form action="profile" method="POST">
                    Username (Not Editable) :
                    <div class="mt-10">
                        <input type="text" name="username" value="<%=account.getUsername()%>" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User Name'" required="" class="single-input" readonly="">
                    </div><br>
                    Full Name:
                    <div class="mt-10">
                        <input type="text" name="fullname" value="<%=account.getFullname()%>" placeholder="Full Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full Name'" required="" class="single-input">
                    </div><br>
                    E-mail:
                    <div class="mt-10">
                        <input type="email" name="email" value="<%=account.getEmail()%>" placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required="" class="single-input">
                    </div><br>
                    Address:
                    <div class="mt-10">
                        <input type="text" name="address" value="<%=account.getAddress()%>" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" required="" class="single-input">
                    </div><br>
                    Phone Number:
                    <div class="mt-10">
                        <input type="text" name="phonenumber" value="<%=account.getPhonenumber()%>" placeholder="Phone Num" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Num'" required="" class="single-input">
                    </div><br>                   
                    <a href="reset" class="genric-btn primary e-large" style="float: left; background-color: #4cd3e3;">Reset Password</a>
                    <button type="submit" value="submit" class="genric-btn primary e-large" style="float: right; background-color: #4cd3e3;">Save</button>
            </div>
        </form>
    </div>

    <%@include file="components/footer.jsp"%>
    <%@include file="components/script.jsp"%>
</body>
</html>
