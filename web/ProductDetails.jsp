<%-- 
    Document   : product_details
    Created on : Nov 2, 2020, 5:54:15 PM
    Author     : Vinnie Long
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
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
            String category = "";
            ArrayList<String> img = (ArrayList<String>) request.getAttribute("image");
            Product p = (Product) request.getAttribute("product");
            if (p.getCategoryID() == 1) {
                category = "Freebase Juice";
            } else if (p.getCategoryID() == 2) {
                category = "Salt-Nicotine Juice";
            } else {
                category = "Device";
            }
        %>
        <section class="product_list section_padding" style="padding: 100px">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <!-- Place somewhere in the <body> of your page -->
                        <div class="flexslider">
                            <ul class="slides">                               
                                <%
                                    for (int i = 0; i < img.size(); i++) {
                                %>
                                <li data-thumb="<%out.println(img.get(i));%>">
                                    <img src="<%out.println(img.get(i));%>" class="w-100" />
                                </li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6" style="padding-top: 65px;">
                        <div class="single_product_text">
                            <h1><%=p.getName()%></h1>
                            <h2><%out.print(formatter.format(p.getPrice()));%> đ</h2>
                            <p><%=p.getShortdesc()%></p>
                            <p>Category: <%=category%></p>
                            <!--                            <p>Origin:</p>-->
                            <p>Stock: <%=p.getStock()%></p>
                            <div class="card_area"ss>
                                <div class="product_count_area">
                                    <form action="productdetail?id=<%=p.getId()%>" method="POST">
                                        Quantity:
                                        <div class="product_count d-inline-block">
                                            <span class="product_count_item inumber-decrement" style="cursor: pointer;"> <i class="ti-minus"></i></span>
                                            <input class="product_count_item input-number" name="quantity" type="text" value="1" min="0" max="100">
                                            <span class="product_count_item number-increment" style="cursor: pointer;"> <i class="ti-plus"></i></span>
                                        </div>
                                        <div class="add_to_cart">
                                            <button type="submit" value="submit" class="btn_3" style="cursor: pointer;">add to cart</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" style="padding-top: 30px;">
                        <h2 class="single_product_text">Specifications</h2><br>                  
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget quam in libero consequat vehicula quis et diam. 
                            Nullam mollis diam ut massa porta, vitae rutrum nibh lacinia. Mauris ornare aliquam urna. Sed posuere dui ac ante finibus laoreet. Fusce ut elit euismod, luctus 
                            dolor eu, porta neque. Mauris id velit in sem mollis sodales luctus sollicitudin velit. Maecenas pellentesque tempus nunc, ac eleifend nulla. Mauris hendrerit velit 
                            sed leo congue, ut porttitor felis feugiat. Mauris odio eros, dapibus nec molestie a, bibendum pellentesque neque. Curabitur lobortis lacinia ipsum, ut euismod arcu 
                            mollis mollis. Integer at venenatis nisi.</p>
                    </div>
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
