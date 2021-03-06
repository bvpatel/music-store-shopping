<!-- footer -->
<footer id="aa-footer">
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-footer-bottom-area">
                        <!-- <p><a href="<spring:url value="/version"/>">Version</a></p> -->
                        <div class="aa-footer-payment">
                            <span class="fa fa-cc-mastercard"></span>
                            <span class="fa fa-cc-visa"></span>
                            <span class="fa fa-paypal"></span>
                            <span class="fa fa-cc-discover"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- / footer -->

<!-- Login Modal -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4>Login or Register</h4>
                <c:if test="${not empty msg}">
                    <div class="msg" style="color: red">${msg}</div>
                </c:if>
                <form class="aa-login-form" action="<c:url value="/login" />" method="post">
                    <c:if test="${not empty error}">
                        <div class="error" style="color: red">${error}</div>
                    </c:if>

                    <div class="form-group">
                        <label for="email">Email<span>*</span></label>
                        <input id="email" type="text" name="email" placeholder="Email address" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="password">Password<span>*</span></label>
                        <input id="password" type="password" name="password" placeholder="Password" class="form-control">
                    </div>

                    <button type="submit" class="aa-browse-btn">Login</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    <label class="rememberme" for="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>
                    <p class="aa-lost-password"><a href="/fp">Lost your password?</a></p>
                    <div class="aa-register-now">
                        Don't have an account?<a href="<spring:url value="/register" />">Register now!</a>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!-- Angular JS -->
<script src="/js/angular.min.js" /></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/js/bootstrap.min.js"></script>
<!-- SmartMenus jQuery plugin -->
<script type="text/javascript" src="/js/jquery.smartmenus.js" /></script>
<!-- SmartMenus jQuery Bootstrap Addon -->
<script type="text/javascript" src="/js/jquery.smartmenus.bootstrap.js" /></script>
<!-- To Slider JS -->
<script src="/js/sequence.js" /></script>
<script src="/js/sequence-theme.modern-slide-in.js" /></script>
<!-- product view slider -->
<script type="text/javascript" src="/js/jquery.simpleGallery.js" /></script>
<script type="text/javascript" src="/js/jquery.simpleLens.js" /></script>
<!-- slick slider -->
<script type="text/javascript" src="/js/slick.js" /></script>
<!-- Price picker slider -->
<script type="text/javascript" src="/js/nouislider.min.js" /></script>
<!-- Custom js -->
<script src="/js/custom.js" /></script>
<script src="/js/controller.js" /></script>
</body>
</html>