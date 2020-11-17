<%-- 
    Document   : CreateProduct
    Created on : Nov 17, 2020, 12:28:10 PM
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
                                <h2>Create Product</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" style="padding: 50px;">
            <div class="col-lg-12 col-md-12">
                <h3 class="mb-30">Product Information </h3>
                <form action="createproduct" method="POST">
                    Product ID:
                    <div class="mt-10">
                        <input type="text" name="id" value="" placeholder="Product ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Product ID'" required="" class="single-input">
                    </div><br>
                    Product Name:
                    <div class="mt-10">
                        <input type="text" name="name" value="" placeholder="Product Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Product Name'" required="" class="single-input">
                    </div><br>
                    Price:
                    <div class="mt-10">
                        <input type="text" name="price" value="" placeholder="Price" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Price'" required="" class="single-input">
                    </div><br>
                    Category:
                    <div class="mt-10">
                        <input type="text" name="category" value="" placeholder="Category" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Category'" required="" class="single-input">
                    </div><br>
                    Stock:
                    <div class="mt-10">
                        <input type="text" name="stock" value="" placeholder="Stock" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Stock'" required="" class="single-input">
                    </div><br>
                    Image URL:
                    <div class="mt-10">
                        <input type="text" name="img" value="" placeholder="URL" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Image'" required="" class="single-input">
                    </div><br>
                    Detail:
                    <div class="mt-10">
                        <textarea name="detail" value="" placeholder="Detail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Detail'" required="" class="single-input" style="height: 200px;"></textarea>
                    </div><br> 
                    <a href="manage" class="genric-btn primary e-large" style="float: right; background-color: #4cd3e3; margin-left: 10px;">Exit</a>                    
                    <button type="submit" value="submit" class="genric-btn primary e-large" style="float: right; background-color: #4cd3e3;">Save</button>
            </div>
        </div>
        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
    </body>
</html>
