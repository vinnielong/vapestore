<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page import="Model.Account"%>
<header>
    <!-- Header Start -->
    <script>
        function setImage(select) {
            var image = document.getElementsByName("image-swap")[0];
            image.src = select.options[select.selectedIndex].value;
        }
    </script>
    <%
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        Account account = (Account) session.getAttribute("account");
    %>
    <div class="header-area">
        <div class="main-header ">
            <div class="header-top top-bg d-none d-lg-block">
                <div class="container-fluid">
                    <div class="col-xl-12">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="header-info-left d-flex">
                                <div class="flag">
                                    <img src="assets/img/icon/header_icon_1.png" alt="" name="image-swap">
                                </div>
                                <div class="select-this">
                                    <form action="#">
                                        <div class="select-itms">
                                            <select name="select" id="select1" onchange="setImage(this)">
                                                <option value="assets/img/icon/header_icon_1.png">VIE</option>
                                                <option value="assets/img/icon/header_icon.png">USA</option>
                                            </select>
                                        </div>
                                    </form>
                                </div>
                                <ul class="contact-now">     
                                    <li>+84 934 578864</li>
                                </ul>
                            </div>   
                            <div class="header-info-right" style="margin-right: 30px; size: 40px;">
                                <ul>                                          
                                    <li><a href="#"><img src="https://stockx-assets.imgix.net/svg/icons/twitter-footer.svg?auto=compress,format"></a></li>
                                    <li><a href="#"><img src="https://stockx-assets.imgix.net/svg/icons/facebook-footer.svg?auto=compress,format"></a></li>
                                    <li><a href="#"><img src="https://stockx-assets.imgix.net/svg/icons/instagram-footer.svg?auto=compress,format"></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom  header-sticky">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <!-- Logo -->
                        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-3">
                            <div class="logo">
                                <a href="home"><img src="assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
                            <!-- Main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>                                                
                                    <ul id="navigation">                                                                                                                                     
                                        <li><a href="home">Home</a></li>
                                        <li><a href="category?catID=0">Shop</a></li>    
                                        <li><a href="contact">Contact</a></li>
                                        <li><a href="about">About</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div> 
                        <div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card" style="left: 10px;">
                            <ul class="header-right f-left d-none d-lg-block d-flex justify-content-between">
                                <li class="d-none d-xl-block">
                                    <div class="form-box f-right " style="margin-left: 100px; margin-top: 5px;">
                                        <form action="search" method="GET">
                                            <input type="text" name="result" placeholder="Search products" required="">
                                            <div class="search-icon">
                                                <button type="submit" value="submit" style=" background: none; border: none; cursor: pointer"><i class="fas fa-search special-tag"></i></button>                                                
                                            </div>
                                        </form>
                                    </div>
                                </li>
                                <li style="margin-left: -26px;">
                                    <div class="shopping-card d-none d-xl-block">
                                        <%if (account != null) {%>
                                        <a href="cart"><i class="fas fa-shopping-cart" style="margin-top: 3px;"></i></a>
                                        <span class="span"><%=account.getProducts().size()%></span>
                                        <%} else {%>
                                        <a href="cart"><i class="fas fa-shopping-cart" style="margin-top: 3px;"></i></a>
                                            <%}%>
                                    </div>
                                </li>
                                <li>
                                    <%if (account != null) {%>
                                    <div class="main-menu f-right d-lg-block d-none" style="margin-top: 2px; margin-left: -41px;">
                                        <nav>
                                            <ul id="navigation">
                                                <li> 
                                                    <a href="#" class="btn header-btn" style="color: white;"><%=account.getFullname()%></a>
                                                    <ul class="submenu">
                                                        <li><a href="profile?username=<%=account.getUsername()%>">My Profile</a></li>
                                                        <li><a href="manage">Manage Shop</a></li>
                                                        <li><a href="logout"> Logout</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <%} else {%>
                                    <div class="f-right d-none d-lg-block"> <a href="login" class="btn header-btn" style=" font-size: 15px; margin-top: 2px; margin-left: -21px;">Login/Register</a></div>
                                    <%}%>
                                </li>
                            </ul>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu f-right d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
</header>
