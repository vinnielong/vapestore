<%-- 
    Document   : ManageProducts
    Created on : Nov 17, 2020, 10:16:41 AM
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
                                <h2>Shop Management</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="cart_area section_padding">
            <div class="container">
                <div class="cart_inner">
                    <div class="form-box">
                        <form action="searchproduct" method="GET" >
                            <input type="text" name="result" placeholder="Search products" required="">
                            <div class="search-icon">
                                <button type="submit" value="submit" class="btn-cartsearch"><i class="fas fa-search special-tag"></i></button>                                                
                            </div>
                        </form>
                    </div>
                    <br>
                    <div class="col-lg-4 col-md-4 f-left"><a class="btn_1" href="createproduct" style="margin-left: -13px; padding: 12px 50px;">Add New Product</a></div>
                    <div class="col-lg-1 col-md-1 f-right" style="padding-bottom: 25px; margin-right: 19px;">                        
                        <ul class="pagination"></ul>
                    </div>
                    <br>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Stock</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <%
                                int total = 0;
                                ArrayList<Product> prod = (ArrayList<Product>) request.getAttribute("products");
                                if (prod != null && !prod.isEmpty()) {
                                    for (Product p : prod) {

                            %>  
                            <tr>
                                <td>
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
                                    <h5><%=formatter.format(p.getPrice())%> đ</h5>
                                </td>                                    
                                <td>
                                    <h5><%=p.getStock()%></h5>
                                </td>
                                <td>
                                    <a href="editproduct?id=<%=p.getId()%>" style="cursor: pointer; border: none; background: none;"><img src="assets/img/icon/edit.svg" alt="" style="max-width: 40px;"/></a>                                    
                                    <a href="deleteproduct?id=<%=p.getId()%>" style="cursor: pointer; border: none; background: none;"><img src="assets/img/icon/delete.png" alt=""/></a>
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
                        </table>
                    </div>
                    <div class="f-right">
                        <ul class="pagination"></ul>
                    </div>
                </div>
            </div>>
        </section>

        <%@include file="components/footer.jsp"%>
        <%@include file="components/script.jsp"%>
        <script src="assets/js/pagger.js"></script>
        <%
            int pageIndex = Integer.parseInt(request.getAttribute("pageIndex").toString());
            int totalPages = Integer.parseInt(request.getAttribute("totalPages").toString());
            if (pageIndex > 0 && totalPages > 0) {
        %>
        <script>paggerBasic('pagination', <%=pageIndex%>, <%=totalPages%>, 2);</script>
        <%}%>
    </body>
</html>
