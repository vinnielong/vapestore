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
                    Username:
                    <div class="mt-10">
                        <input type="text" name="username" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User Name'" required="" class="single-input">
                    </div><br>
                    Full Name:
                    <div class="mt-10">
                        <input type="text" name="fullname" placeholder="Full Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full Name'" required="" class="single-input">
                    </div><br>
                    E-mail:
                    <div class="mt-10">
                        <input type="email" name="EMAIL" placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required="" class="single-input">
                    </div><br>
                    Address:
                    <div class="mt-10">
                        <input type="text" name="address" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" required="" class="single-input">
                    </div><br>
                    City:
                    <div class="input-group-icon mt-10">
                        <div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
                        <div class="form-select" id="default-select" "="">
                            <select style="display: none;">
                                <option value="1">City</option>
                                <option value="1">Hanoi</option>
                                <option value="1">Paris</option>
                                <option value="1">New York</option>
                                <option value="1">Hai Phong</option>
                            </select><div class="nice-select" tabindex="0"><span class="current">City</span><ul class="list"><li data-value=" 1" class="option selected">City</li><li data-value="1" class="option">Hanoi</li><li data-value="1" class="option">Paris</li><li data-value="1" class="option">New York</li><li data-value="1" class="option">Hai Phone</li></ul></div>
                        </div>
                    </div><br>
                    Country:
                    <div class="input-group-icon mt-10">
                        <div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
                        <div class="form-select" id="default-select" "="">
                            <select style="display: none;">
                                <option value="1">Country</option>
                                <option value="1">Vietnam</option>
                                <option value="1">France</option>
                                <option value="1">England</option>
                                <option value="1">America</option>
                            </select><div class="nice-select" tabindex="0"><span class="current">Country</span><ul class="list"><li data-value=" 1" class="option selected">Country</li><li data-value="1" class="option">Vietnam</li><li data-value="1" class="option">French</li><li data-value="1" class="option">England</li><li data-value="1" class="option">America</li></ul></div>
                        </div>
                    </div><br>
                    Phone Number:
                    <div class="mt-10">
                        <input type="text" name="phone_num" placeholder="Phone Num" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Num'" required="" class="single-input">
                    </div><br>                   
                </form>
                <a href="reset" class="genric-btn primary e-large" style="float: left; background-color: #4cd3e3;">Reset Password</a>
                <button type="submit" value="submit" class="genric-btn primary e-large" style="float: right; background-color: #4cd3e3;">Save</button>
            </div>
        </div>

        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
    </body>
</html>
