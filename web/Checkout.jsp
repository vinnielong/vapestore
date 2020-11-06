<%-- 
    Document   : Checkout
    Created on : Oct 29, 2020, 7:03:36 PM
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
                                <h2 style="color: beige; font-family: 'Poppins';">Checkout</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!--================Checkout Area =================-->       
        <%
            Account acc = (Account) request.getAttribute("account");
        %>
        <section class="checkout_area section_padding">
            <div class="container">               
                <div class="billing_details">
                    <form class="row contact_form" action="checkout" method="post">
                        <div class="row">
                            <div class="col-lg-8">
                                <h3>Billing Details</h3>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="first" name="name" value="<%=acc.getFullname()%>" placeholder="Full Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full Name'" required="" />
                                </div>
                                <div class="col-md-5 form-group p_star">
                                    <input type="text" class="form-control" id="number" name="number" value="<%=acc.getPhonenumber()%>" placeholder="Phone Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'" required="" />
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="email" name="email" value="<%=acc.getEmail()%>" placeholder="E-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'E-mail'" required="" />
                                </div>
                                <div class="col-md-5 form-group p_star">
                                    <input type="text" class="form-control" id="country" name="country" placeholder="Country" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Country'" required="" />
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="address" name="address" value="<%=acc.getAddress()%>" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" required="" />
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="city" name="city" placeholder="City" onfocus="this.placeholder = ''" onblur="this.placeholder = 'City'" required="" />
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="zip" name="zip" placeholder="Postcode/ZIP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Postcode/ZIP'" required="" />
                                </div>                                
                                <div class="col-md-12 form-group">
                                    <div class="creat_account">
                                        <h3>Shipping Details</h3>
                                        <input type="checkbox" id="f-option3" name="selector" />
                                        <label for="f-option3">Ship to a different address?</label>
                                    </div>
                                    <textarea class="form-control" name="message" id="message" rows="1"
                                              placeholder="Order Notes"></textarea>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="order_box">
                                    <h2>Your Order</h2>
                                    <ul class="list">
                                        <li>
                                            <a href="#">Product
                                                <span>Total</span>
                                            </a>
                                        </li>
                                        <%
                                            int total = 0;
                                            String order = "";
                                            ArrayList<Product> prod = account.getProducts();
                                            if (prod != null || !prod.isEmpty()) {
                                                for (Product p : prod) {
                                                    order += p.getName() + " * " + p.getQuantity() + " / ";
                                        %>
                                        <li>
                                            <input type="hidden" name="order" value="<%=order%>">
                                            <a href="productdetail?id=<%=p.getId()%>"><%=p.getName()%><br>
                                                <span class="middle"><%=p.getQuantity()%></span>
                                                <span class="last"><%=(p.getPrice() * p.getQuantity())%></span>
                                            </a>
                                        </li><br>       
                                        <%total += p.getPrice() * p.getQuantity();%>
                                        <%}%>
                                        <%}%>
                                    </ul><br>                               
                                    <ul class="list list_2">
                                        <li>
                                            <a href="#">Subtotal
                                                <span><%=total%>đ</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">Shipping
                                                <span>Flat rate: 50000đ</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">Total
                                                <span><%=total + 50000%>đ</span>
                                            </a>
                                        </li>
                                        <input type="hidden" name="total" value="<%=total%>">
                                    </ul><br>
                                    <button type="submit" value="submit" class="btn_3">Proceed to Order</button>>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!--================End Checkout Area =================-->

        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
    </body>
</html>
