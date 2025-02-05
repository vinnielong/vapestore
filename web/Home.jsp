<%-- 
    Document   : Home
    Created on : Oct 29, 2020, 6:47:33 PM
    Author     : Vinnie Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <%@include file="components/head.jsp"%>
    <body>
        <!-- Preloader Start -->
<!--        <div id="preloader-active">
            <div class="preloader d-flex align-items-center justify-content-center">
                <div class="preloader-inner position-relative">
                    <div class="preloader-circle"></div>
                    <div class="preloader-img pere-text">
                        <img src="assets/img/logo/logo.png" alt="">
                    </div>
                </div>
            </div>
        </div>-->
        <!-- Preloader End -->
        <%@include file="components/header.jsp"%>
        <main>
            <!-- slider Area Start -->
            <div class="slider-area ">
                <!-- Mobile Menu -->
                <div class="slider-active">
                    <div class="single-slider slider-height" data-background="assets/img/hero/h1_hero.jpg">
                        <div class="container">
                            <div class="row d-flex align-items-center justify-content-between">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                                    <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                        <img src="assets/img/hero/hero.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-xl-5 col-lg-5 col-md-5 col-sm-8" style="margin-top: 62px;">
                                    <div class="hero__caption">
                                        <span data-animation="fadeInRight" data-delay=".4s">New Arrival</span>
                                        <h1 data-animation="fadeInRight" data-delay=".6s">Dotmod <br> AIO Kit</h1>
                                        <p data-animation="fadeInRight" data-delay=".8s">Best Vape Of 2020!</p>
                                        <!-- Hero-btn -->
                                        <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                            <a href="category?catID=0" class="btn hero-btn">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- slider Area End-->
            <!-- Category Area Start-->
            <section class="category-area section-padding30" style="padding-top: 0px;">
                <div class="container-fluid">
                    <!-- Section Tittle -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-tittle text-center mb-85">
                                <h2>Shop by Category</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-4 col-lg-6">
                            <div class="single-category mb-30">
                                <div class="category-img">
                                    <a href="category?catID=1">
                                        <img src="assets/img/categories/cat1.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-6">
                            <div class="single-category mb-30">
                                <div class="category-img text-center">
                                    <a href="category?catID=2">
                                        <img src="assets/img/categories/cat2.jpg" alt="">      
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-6">
                            <div class="single-category mb-30">
                                <div class="category-img">
                                    <a href="category?catID=3">
                                        <img src="assets/img/categories/cat3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Category Area End
            <!-- Latest Products Start -->
            <section class="latest-product-area padding-bottom" style="padding-bottom: 130px;">
                <div class="container">
                    <div class="row product-btn d-flex justify-content-end align-items-end">
                        <!-- Section Tittle -->
                        <div class="col-xl-4 col-lg-5 col-md-5">
                            <div class="section-tittle mb-30">
                                <h2>Latest Products</h2>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-7 col-md-7">
                            <div class="properties__button f-right">
                                <!--Nav Button  -->
                                <nav>                                                                                                
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">New</a>
                                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="true">Featured</a>
                                    </div>
                                </nav>
                                <!--End Nav Button  -->
                            </div>
                        </div>
                    </div>
                    <!-- Nav Card -->
                    <div class="tab-content" id="nav-tabContent">
                        <!-- card one -->
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            <div class="row">
                                <%
                                    ArrayList<Product> newprod = (ArrayList<Product>) request.getAttribute("newPro");
                                    for (Product p : newprod) {
                                %>
                                <div class="col-xl-4 col-lg-4 col-md-6">
                                    <div class="single-product mb-60">
                                        <div class="product-img">
                                            <img src="<%=p.getImage()%>" alt="">
                                            <div class="new-product">
                                                <span>New</span>
                                            </div>
                                        </div>
                                        <div class="product-caption">                                           
                                            <h4><a href="productdetail?id=<%=p.getId()%>"><%=p.getName()%></a></h4>
                                            <div class="price">
                                                <ul>
                                                    <li><%out.print(formatter.format(p.getPrice()));%>đ</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                        <!-- Card two -->
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <div class="row">
                                <%
                                    for (Product p : newprod) {
                                %>
                                <div class="col-xl-4 col-lg-4 col-md-6">
                                    <div class="single-product mb-60">
                                        <div class="product-img">
                                            <img src="<%=p.getImage()%>" alt="">
                                        </div>
                                        <div class="product-caption">

                                            <h4><a href="productdetail?id=<%=p.getId()%>"><%=p.getName()%></a></h4>
                                            <div class="price">
                                                <ul>
                                                    <li><%out.print(formatter.format(p.getPrice()));%>đ</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>                              
                                <%}%>
                            </div>
                        </div>          
                        <!-- End Nav Card -->
                    </div>
            </section>
            <!-- Latest Products End --> 
            <!-- Shop Method Start-->
            <div class="shop-method-area section-padding30" style="padding-top: 10px">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div class="col-xl-3 col-lg-3 col-md-6">
                            <div class="single-method mb-40">
                                <i class="ti-package"></i>
                                <h6>Free Shipping Method</h6>
                                <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-6">
                            <div class="single-method mb-40">
                                <i class="ti-unlock"></i>
                                <h6>Secure Payment System</h6>
                                <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                            </div>
                        </div> 
                        <div class="col-xl-3 col-lg-3 col-md-6">
                            <div class="single-method mb-40">
                                <i class="ti-reload"></i>
                                <h6>Refund Policy System</h6>
                                <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Shop Method End-->
            <!-- Best Product Start -->
            <div class="best-product-area lf-padding" style="background: rgb(250, 201, 4);">
                <div class="product-wrapper bg-height" >
                    <div class="container position-relative">
                        <div class="row justify-content-between align-items-end">
                            <div class="product-man position-absolute  d-none d-lg-block" style="left: -2%; top: 25%;">
                                <img src="assets/img/categories/resize.png" alt="">
                            </div>
                            <div class="col-xl-2 col-lg-2 col-md-2 d-none d-lg-block">
                            </div>
                            <div class="col-xl-8 col-lg-8">
                                <div class="best-product-caption">
                                    <h2 style="padding-left: 140px;">Find The Best Product<br> from Our Shop</h2>
                                    <p style="padding-left: 140px;">Customers who are interested creating state of the.</p>
                                    <a href="category?catID=0" class="black-btn" style="margin-left: 140px">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="subscribe_part section_padding" style="background: #191d34">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="subscribe_part_content">
                                <h2>Get promotions & updates!</h2>
                                <p>Seamlessly empower fully researched growth strategies and internal or “organic” sources credibly innovate granular internal .</p>
                                <div class="subscribe_form">
                                    <input type="email" placeholder="Enter your mail">
                                    <a href="#" class="btn_1">Subscribe</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
    </body>
</html>
