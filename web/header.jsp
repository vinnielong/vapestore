<header>
    <!-- Header Start -->
    <script>
    function setImage(select) {
        var image = document.getElementsByName("image-swap")[0];
        image.src = select.options[select.selectedIndex].value;
    }
    </script>

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
                                    <li>+777 2345 7886</li>
                                </ul>
                            </div>
                            <div class="header-info-right">
                                <ul>                                          
                                    <li><a href="Login.jsp">My Account </a></li>
                                    <li><a href="Cart.jsp">Cart</a></li>
                                    <li><a href="Checkout.jsp">Checkout</a></li>
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
                                <a href="Home.jsp"><img src="assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
                            <!-- Main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>                                                
                                    <ul id="navigation">                                                                                                                                     
                                        <li><a href="Home.jsp">Home</a></li>
                                        <li><a href="Products.jsp">Shop</a></li>    
                                        <li><a href="Contact.jsp">Contact</a></li>
                                        <li><a href="About.jsp">About</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div> 
                        <div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
                            <ul class="header-right f-right d-none d-lg-block d-flex justify-content-between">
                                <li class="d-none d-xl-block">
                                    <div class="form-box f-right ">
                                        <input type="text" name="Search" placeholder="Search products">
                                        <div class="search-icon">
                                            <i class="fas fa-search special-tag"></i>
                                        </div>
                                    </div>
                                </li>
                                <li class="d-none d-lg-block"> <a href="Login.jsp" class="btn header-btn">Sign in</a></li>
                            </ul>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
</header>
