<%-- 
    Document   : Cart
    Created on : Oct 29, 2020, 7:03:25 PM
    Author     : Vinnie Long
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
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
                                <h2 style="color: beige; font-family: 'Poppins';">Your Cart</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!--================Cart Area =================-->
        <section class="cart_area section_padding">
            <div class="container">
                <div class="cart_inner">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <%
                                int total = 0;
                                ArrayList<Product> prod = account.getProducts();
                                if (prod != null || !prod.isEmpty()) {
                                    for (Product p : prod) {
                            %>  
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="<%=p.getImage()%>" alt="" />
                                        </div>
                                        <div class="media-body">
                                            <p><%=p.getName()%></p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5><%=p.getPrice()%></h5>
                                </td>                                    
                                <td>
                                        <div class="product_count">                                            
                                            <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                                            <input class="input-number" type="text" name="quantity" value="<%=p.getQuantity()%>" min="0" max="100">
                                            <span class="input-number-increment"> <i class="ti-plus"></i></span>
                                        </div>
                                </td>
                                <td>
                                    <h5><%=(p.getPrice() * p.getQuantity())%></h5>
                                </td>
                                <%total += p.getPrice() * p.getQuantity();%>
                            </tr> 
                            <%}%>
                            <%}%>
                            <tr class="bottom_button">
                                <td>
                                    <a class="btn_1" href="category?catID=0">Update Cart</a>
                                </td>
                                <td></td>
                                <td></td>                                   
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5>đ <%=total%></h5>
                                </td>
                            </tr>                               

                        </table>
                        <div class="checkout_btn_inner float-right">
                            <a class="btn_1" href="category?catID=0">Continue Shopping</a>
                            <a class="btn_1 checkout_btn_1" href="checkout?username=<%=account.getUsername()%>">Proceed to checkout</a>
                        </div>
                    </div>
                </div>
            </div>>
        </section>
        <!--================End Cart Area =================-->

        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
    </body>

</html>
