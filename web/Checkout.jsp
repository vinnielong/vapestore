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
                                <h2>Checkout</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!--================Checkout Area =================-->     
        <section class="checkout_area section_padding">
            <div class="container">               
                <div class="billing_details">
                    <form class="row contact_form" action="checkout" method="post">
                        <div class="row">
                            <div class="col-lg-8">
                                <h3>Billing Details</h3>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="first" name="name" value="<%=account.getFullname()%>" placeholder="Full Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full Name'" required="" />
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="number" name="number" value="<%=account.getPhonenumber()%>" placeholder="Phone Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'" required="" />
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="email" name="email" value="<%=account.getEmail()%>" placeholder="E-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'E-mail'" required="" />
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="country" name="country" placeholder="Country" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Country'" required="" />
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="address" name="address" value="<%=account.getAddress()%>" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" required="" />
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="city" name="city" placeholder="City" onfocus="this.placeholder = ''" onblur="this.placeholder = 'City'" required="" />
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="zip" name="zip" placeholder="Postcode/ZIP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Postcode/ZIP'" required="" />
                                </div>                                
                                <div class="col-md-12 form-group">
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
                                                <span class="middle">x <%=p.getQuantity()%></span>
                                                <span class="last"><%out.print(formatter.format(p.getPrice() * p.getQuantity()));%>đ</span>
                                            </a>
                                        </li><br>       
                                        <%total += p.getPrice() * p.getQuantity();%>
                                        <%}%>
                                        <%}%>
                                    </ul><br>                               
                                    <ul class="list list_2">
                                        <li>
                                            <a href="#">Subtotal
                                                <span><%out.print(formatter.format(total));%>đ</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">Shipping
                                                <span>Flat rate: 30,000đ</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">Total
                                                <span><%out.print(formatter.format(total + 30000));%>đ</span>
                                            </a>
                                        </li>
                                        <input type="hidden" name="total" value="<%=total + 30000%>">
                                    </ul><br>
                                    <%if (account.getProducts().isEmpty()) {%>
                                    <%if (request.getAttribute("errorMsg") != null) {%>
                                    <label for="incorrect" style="color: red;"><%=request.getAttribute("errorMsg")%></label>
                                    <%}%>
                                    <button type="submit" value="submit" class="btn_disable" style="width: 315px;" disabled="">Proceed to Order</button>                                    
                                    <%} else {%>
                                    <%if (request.getAttribute("errorMsg") != null) {%>
                                    <label for="incorrect" style="color: red;"><%=request.getAttribute("errorMsg")%></label>
                                    <%}%>
                                    <button type="submit" value="submit" class="btn_3" style="width: 315px;">Proceed to Order</button>
                                    <%}%>
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
