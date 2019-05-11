<%@include file="/WEB-INF/view/template/header.jsp"%>
<!-- Start slider -->
<!-- <button onclick="testMe('${_csrf.parameterName}=${_csrf.token}')">Click Me</button> -->
<section id="aa-slider">
    <div class="aa-slider-area">
        <div id="sequence" class="seq">
            <div class="seq-screen">
                <ul class="seq-canvas">
                    <!-- single slide item -->
                    <c:forEach items="${sliders}" var="slider">
                    <li>
                        <div class="seq-model">
                            <img data-seq style="width: 1920px; height: 700px; object-fit: cover;" src="<c:url value="/images/slider/${slider.sliderId}/0.png" />"/>
                        </div>
                        <div class="seq-title">
                            <span data-seq>${slider.sliderUpperData}</span>
                            <h2 data-seq>${slider.sliderTitle}</h2>
                            <p data-seq>${slider.sliderDescription}</p>
                            <c:if test="${empty slider.sliderLink}">
                            <a data-seq href="/pd/s" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
                            </c:if>
                            <c:if test="${not empty slider.sliderLink}">
                            <a data-seq href="/pd/s?mc=${slider.sliderLink}" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
                        	</c:if>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- slider navigation btn -->
            <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
                <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
                <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
            </fieldset>
        </div>
    </div>
</section>
<!-- / slider -->
<!-- Start Promo section -->
<section id="aa-promo">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-promo-area">
                    <div class="row">
                        <!-- promo left -->
                        <div class="col-md-5 no-padding">
                            <div class="aa-promo-left">
                                <div class="aa-promo-banner">
                                    <img style="object-fit: cover;" src="img/CondenserMicrophones.jpeg" alt="img"/>
                                    <div class="aa-prom-content">
                                        <!-- <span>75% Off</span> -->
                                        <h4><a href="/pd/s?mc=microphones">Condenser Microphones</a></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- promo right -->
                        <div class="col-md-7 no-padding">
                            <div class="aa-promo-right">
                                    <div class="aa-promo-banner">
                                        <img style="object-fit: cover;" src="img/piano.jpg" alt="img"/>
                                        <div class="aa-prom-content">
                                            <span>Exclusive Item</span>
                                            <h4><a href="/pd/s?mc=pianos">Pianos</a></h4>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Promo section -->
<!-- banner section -->
<!--<section id="aa-banner">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-banner-area">
                        <a href="#"><img src="<spring:url value="img/banner-footer-1170x170.jpg" />" alt="fashion banner img"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> -->
<!-- popular section -->
<section id="aa-popular-category" ng-controller="cartCtrl">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-popular-category-area">
                        <!-- start prduct navigation -->
                        <ul class="nav nav-tabs aa-products-tab">
                            <li class="active"><a href="#popular" data-toggle="tab">Popular</a></li>
                            <li><a href="#latest" data-toggle="tab">Latest</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <!-- Start men popular category -->
                            <div class="tab-pane fade in active" id="popular">
                                <ul class="aa-product-catg aa-popular-slider">
                                    <!-- start single product item -->
                                    <c:forEach items="${productPopular}" var="product">
                                    <li>
                                        <figure>
                                            <a class="aa-product-img" href="<c:url value="/pd/p?id=${product.productId}" />">
                                                <img style="width: 250px; height: 300px" src="<c:url value="/images/product/${product.productId}/0.png" />" ></a>
                                            <a class="aa-add-card-btn" style="cursor: hand" ng-click="addToCart('${product.productId}','${_csrf.parameterName}=${_csrf.token}')">
                                                <span class="fa fa-shopping-cart"></span>Add To Cart
                                            </a>
                                            <figcaption>
                                                <h4 class="aa-product-title"><a href="<c:url value="/pd/p?id=${product.productId}" />">${product.productName}</a></h4>
                                                <span class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price"><!--<del>$999</del>--></span>
                                            </figcaption>
                                        </figure>
                                        <!-- product badge -->
                                        <!-- <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                    </li>
                                    </c:forEach>
                                </ul>
                                <a class="aa-browse-btn" href="/pd/s">Browse all Product <span
                                        class="fa fa-long-arrow-right"></span></a>
                            </div>
                            <!-- / popular product category -->

                            <!-- start latest product category -->
                            <div class="tab-pane fade" id="latest">
                                <ul class="aa-product-catg aa-latest-slider">
                                    <!-- start single product item -->
                                    <c:forEach items="${productLatest}" var="product" >
                                    <li>
                                        <figure>
                                            <a class="aa-product-img" href="<c:url value="/pd/p?id=${product.productId}" />">
                                                <img style="width: 250px; height: 300px" src="<c:url value="/images/product/${product.productId}/0.png" />" ></a>
                                            <a class="aa-add-card-btn" style="cursor: hand" ng-click="addToCart('${product.productId}','${_csrf.parameterName}=${_csrf.token}')">
                                                <span class="fa fa-shopping-cart"></span>Add To Cart
                                            </a>
                                            <figcaption>
                                                <h4 class="aa-product-title"><a href="<c:url value="/pd/p?id=${product.productId}" />">${product.productName}</a></h4>
                                                <span class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price"></span>
                                            </figcaption>
                                        </figure>
                                        <!-- product badge
                                        <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                    </li>
                                    </c:forEach>
                                </ul>
                                <a class="aa-browse-btn" href="#">Browse all Product <span
                                        class="fa fa-long-arrow-right"></span></a>
                            </div>
                            <!-- / latest product category -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / popular section -->
<!-- Support section -->
<section id="aa-support">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-support-area">
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-truck"></span>
                            <h4>FREE SHIPPING</h4>
                            <P>FREE shipping available - Find your favorite Drum, Key Board, Guitar & more!</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-clock-o"></span>
                            <h4>30 DAYS MONEY BACK</h4>
                            <P>If for any reason you wish to discontinue using the product, within 30 days of the purchase, we will issue a refund within 24-48 hours</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-phone"></span>
                            <h4>SUPPORT 24/7</h4>
                            <P>Call us on +1.234.456.7890 or email us on kravids@aol.com</P>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Support section -->

<!-- Client Brand -->
<!-- <section id="aa-client-brand">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-client-brand-area">
                    <ul class="aa-client-brand-slider">
                        <li><a href="#"><img src="<c:url value="img/client-brand-java.png" />" alt="java img"></a></li>
                        <li><a href="#"><img src="<c:url value="img/client-brand-jquery.png" />" alt="jquery img"></a></li>
                        <li><a href="#"><img src="<c:url value="img/client-brand-html5.png" />" alt="html5 img"></a></li>
                        <li><a href="#"><img src="<c:url value="img/client-brand-css3.png" />" alt="css3 img"></a></li>
                        <li><a href="#"><img src="<c:url value="img/client-brand-wordpress.png" />" alt="wordPress img"></a></li>
                        <li><a href="#"><img src="<c:url value="img/client-brand-joomla.png" />" alt="joomla img"></a></li>
                        <li><a href="#"><img src="<c:url value="img/client-brand-css3.png" />" alt="css3 img"></a></li>
                        <li><a href="#"><img src="<c:url value="img/client-brand-wordpress.png" />" alt="wordPress img"></a></li>
                        <li><a href="#"><img src="<c:url value="img/client-brand-joomla.png" />" alt="joomla img"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section> -->
<!-- / Client Brand -->

<%@include file="/WEB-INF/view/template/footer.jsp"%>