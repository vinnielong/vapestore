<%-- 
    Document   : product_details
    Created on : Nov 2, 2020, 5:54:15 PM
    Author     : Vinnie Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="components/head.jsp"%>
    <body>
        <%@include file="components/header.jsp"%>
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/category.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2 style="color: beige; font-family: 'Poppins';">Products</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            Product p = (Product) request.getAttribute("product");
        %>
        <section class="product_list section_padding" style="padding: 100px">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <!-- Place somewhere in the <body> of your page -->
                        <div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="assets/img/categories/product1.jpg">
                                    <img src="assets/img/categories/product1.jpg" class="w-100" />
                                </li>
                                <li data-thumb="assets/img/categories/product2.jpg">
                                    <img src="assets/img/categories/product2.jpg" class="w-100" />
                                </li>
                                <li data-thumb="assets/img/categories/product3.jpg">
                                    <img src="assets/img/categories/product3.jpg" class="w-100" />
                                </li>
                                <li data-thumb="assets/img/categories/product4.jpg">
                                    <img src="assets/img/categories/product4.jpg" class="w-100" />
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6" style="padding-top: 65px;">
                        <div class="single_product_text">
                            <h1>LICORNE BY CURIEUX (60ML)</h1>
                            <h2>$ 24.99</h2>
                            <p>Licorne is a unique and surprising combination of strawberry and dragon fruit flavors</p>
                            <div class="card_area"ss>
                                <div class="product_count_area">
                                <p>Quantity:</p>
                                    <div class="product_count d-inline-block">
                                        <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span>
                                        <input class="product_count_item input-number" type="text" value="1" min="0" max="100">
                                        <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>
                                    </div>
                                </div>
                                <div class="add_to_cart">
                                    <a href="productdetail?id=1" class="btn_3">add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">test</div>
                </div>
            </div>
        </section>
        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="assets/js/jquery.flexslider-min.js"></script>
        <script>
            // Can also be used with $(document).ready()
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>
    </body>
</html>
