<%-- 
    Document   : Cart
    Created on : Oct 29, 2020, 7:03:25 PM
    Author     : Vinnie Long
--%>

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
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="assets/img/arrivel/arrivel_1.png" alt="" />
                                            </div>
                                            <div class="media-body">
                                                <p>Minimalistic shop for multipurpose use</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>$360.00</h5>
                                    </td>
                                    <td>
                                        <div class="product_count">
                                            <!-- <input type="text" value="1" min="0" max="10" title="Quantity:"
                                              class="input-text qty input-number" />
                                            <button
                                              class="increase input-number-increment items-count" type="button">
                                              <i class="ti-angle-up"></i>
                                            </button>
                                            <button
                                              class="reduced input-number-decrement items-count" type="button">
                                              <i class="ti-angle-down"></i>
                                            </button> -->
                                            <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                                            <input class="input-number" type="text" value="1" min="0" max="10">
                                            <span class="input-number-increment"> <i class="ti-plus"></i></span>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>$720.00</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="assets/img/arrivel/arrivel_2.png" alt="" />
                                            </div>
                                            <div class="media-body">
                                                <p>Minimalistic shop for multipurpose use</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>$360.00</h5>
                                    </td>
                                    <td>
                                        <div class="product_count">
                                            <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                                            <input class="input-number" type="text" value="1" min="0" max="10">
                                            <span class="input-number-increment"> <i class="ti-plus"></i></span>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>$720.00</h5>
                                    </td>
                                </tr>
                                <tr class="bottom_button">
                                    <td>
                                        <a class="btn_1" href="Products.jsp">Update Cart</a>
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
                                        <h5>$2160.00</h5>
                                    </td>
                                </tr>                               
                            </tbody>
                        </table>
                        <div class="checkout_btn_inner float-right">
                            <a class="btn_1" href="#">Continue Shopping</a>
                            <a class="btn_1 checkout_btn_1" href="#">Proceed to checkout</a>
                        </div>
                    </div>
                </div>
        </section>
        <!--================End Cart Area =================-->

        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
    </body>

</html>
