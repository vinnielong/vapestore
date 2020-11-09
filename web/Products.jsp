<%-- 
    Document   : Products
    Created on : Oct 29, 2020, 7:03:10 PM
    Author     : Vinnie Long
--%>

<%@page import="Model.Category"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="components/head.jsp"%>
    <body>
        <!-- Preloader Start -->
        <div id="preloader-active">
            <div class="preloader d-flex align-items-center justify-content-center">
                <div class="preloader-inner position-relative">
                    <div class="preloader-circle"></div>
                    <div class="preloader-img pere-text">
                        <img src="assets/img/logo/logo.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- Preloader End -->
        <%@include file="components/header.jsp"%>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/category.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Products</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!-- product list part start-->
        <section class="product_list section_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="product_sidebar">
                            <div class="single_sedebar">
                                <form action="search" method="GET">
                                    <input type="text" name="result" placeholder="Search keyword" required="">
                                    <button type="submit" value="submit" style=" background: none; border: none; color: black; cursor: pointer"><i class="ti-search"></i></button>
                                </form>
                            </div>
                            <div class="single_sedebar">
                                <div class="select_option">
                                    <div class="select_option_list">Category <i class="right fas fa-caret-down"></i> </div>
                                    <div class="select_option_dropdown">
                                        <p><a href="category?catID=0">All</a></p>
                                        <%
                                            ArrayList<Category> cat = (ArrayList<Category>) request.getAttribute("category");
                                            for (Category c : cat) {
                                        %>
                                        <p><a href="category?catID=<%=c.getId()%>"><%=c.getName()%></a></p>
                                            <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="product_list">
                            <div class="row">
                                <div class="col-lg-12">
                                    <ul class="pagination"></ul>
                                </div>
                                <%
                                    ArrayList<Product> prod = (ArrayList<Product>) request.getAttribute("products");
                                    if (prod != null && !prod.isEmpty()) {
                                        for (Product p : prod) {
                                %>
                                <div class="col-lg-6 col-sm-6" >
                                    <div class="single_product_item" style="text-align: center;">
                                        <img src="<%=p.getImage()%>" alt="" class="img-fluid">
                                        <h3> <a href="productdetail?id=<%=p.getId()%>"><%=p.getName()%></a> </h3>
                                        <p><%out.print(formatter.format(p.getPrice()));%> đ</p>
                                    </div>
                                </div>
                                <%}%>
                                <%}%>
                            </div><br>
                            <div class="col-lg-12">
                                <ul class="pagination"></ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- product list part end-->


        <!-- Shop Method Start-->
        <div class="shop-method-area section-padding30">
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
                            <h6>Secure Payment System</h6>
                            <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Method End-->

        <!-- subscribe part here -->
        <section class="subscribe_part section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="subscribe_part_content">
                            <h2>Get promotions & updates!</h2>
                            <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p>
                            <div class="subscribe_form">
                                <input type="email" placeholder="Enter your mail">
                                <a href="#" class="btn_1">Subscribe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- subscribe part end -->
        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
        <script src="assets/js/pagger.js"></script>
        <%
            String cate = request.getAttribute("catID").toString();
            int pageIndex = Integer.parseInt(request.getAttribute("pageIndex").toString());
            int totalPages = Integer.parseInt(request.getAttribute("totalPages").toString());
            int cateid = Integer.parseInt(cate);
        %>
        <script>pagger('pagination', 'catID', <%=cateid%>, <%=pageIndex%>, <%=totalPages%>, 2);</script>
    </body>
</html>
