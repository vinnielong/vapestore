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
                                <h2 style="">Your Cart</h2>
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
                        <form method="GET" action="update">
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
                                    if (prod != null && !prod.isEmpty()) {
                                        for (Product p : prod) {

                                %>  
                                <tr>
                                    <td>
                                        <input type="hidden" name="pid[]" value="<%=p.getId()%>" />
                                        <div class="media">
                                            <div class="d-flex"> 
                                                <img src="<%=p.getImage()%>" alt="" />
                                            </div>
                                            <div class="media-body">
                                                <a href="productdetail?id=<%=p.getId()%>" style="color: #506172;"><%=p.getName()%></a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5><%out.print(formatter.format(p.getPrice()));%> đ</h5>
                                    </td>                                    
                                    <td>
                                        <div class="product_count">    
                                            <input class="input-number" type="number" name="quantity" value="<%=p.getQuantity()%>" min="0" max="100">
                                        </div>
                                    </td>
                                    <td>
                                        <h5><%out.print(formatter.format(p.getPrice() * p.getQuantity()));%> đ</h5>
                                    </td>
                                    <%total += p.getPrice() * p.getQuantity();%>
                                    <td>
                                        <a href="delete?id=<%=p.getId()%>" style="cursor: pointer; border: none; background: none;"><img src="assets/img/icon/delete.png" alt=""/></a>
                                    </td>                                       
                                </tr> 
                                <%}%>
                                <%} else {%>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td style="text-align: center;"><h5>No items to show!</h5></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <%}%>
                                <%if (prod.isEmpty()) {%>
                                <tr style="display: none;">
                                    <td>
                                        <button type="button" value="submit" class="btn_1">Update Cart</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <%} else {%>
                                <tr>
                                    <td>
                                        <button type="submit" value="submit" class="btn_1" >Update Cart</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <%}%>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <h5>Subtotal</h5>
                                    </td>
                                    <td>
                                        <h5><%out.print(formatter.format(total));%> đ</h5>
                                    </td>
                                </tr>                                                           
                            </table>
                        </form>
                        <div class="checkout_btn_inner float-right">
                            <a class="btn_1" href="category?catID=0">Continue Shopping</a>
                            <%if (prod.isEmpty()) {%>
                            <a class="btn_1 checkout_btn_1" href="checkout" style="display: none;">Proceed to checkout</a>
                            <%} else {%>
                            <a class="btn_1 checkout_btn_1" href="checkout">Proceed to checkout</a>
                            <%}%>
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
