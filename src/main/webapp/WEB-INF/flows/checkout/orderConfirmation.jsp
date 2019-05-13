<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

    <div class="container" style="margin-left: 0%">
        <div class="page-header">
            <h1>Order</h1>

            <p class="lead">Order Confirmation</p>
        </div>

        <div class="container">
            <div class="row">
                <form:form commandName="order" class="form-horizontal">
                    <div class="well col-xs-10 col-sm-10 col-md-10 col-xs-offset-10 col-sm-offset-1">
                        <div class="text-center">
                            <h1>Receipt</h1>
                        </div>
						<div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                            	<c:forEach items="${shippingAddresses}" var="shippingAddress">
                            	<c:if test="${shippingAddress.addressId eq customerOrderShippingAddress.originalShippingAddressId }">
                                	<c:set var="address" value="${shippingAddress}"></c:set>
                                </c:if>
                                </c:forEach>
                                <address>
                                	
                                    <strong>Shipping Address</strong><br>
                                        ${address.address}
                                    <br>
                                        ${address.city}, ${address.state}
                                    <br>
                                        ${address.country}, ${address.zipCode}
                                    <br>
                                </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <p>Order Date: <fmt:formatDate type="date" value="${now}" /></p>
                                <p><strong>Name: ${address.fullName}</strong></p>
                                <p><strong>Phone: ${address.phoneNumber}</strong></p>
                            </div>
                        </div>

                        <div class="row">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>#</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <form:hidden path="orderTotalPrice" value="cart.grandTotal" />
                                <form:hidden path="orderDate" value="${now}" />
                                <c:forEach var="cartItem" items="${cart.cartItems}">
                                    <tr>
                                        <td class="col-md-9"><em>${cartItem.product.productName}</em></td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.product.productPrice}</td>
                                        <td class="col-md-1" style="text-align: center">{{converDouble(${cartItem.totalPriceDouble})}}</td>
                                    </tr>
                                </c:forEach>

                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td class="text-right">
                                        <h4><strong>Grand Total: </strong></h4>
                                    </td>
                                    <td class="text-center text-danger">
                                        <h4><strong>$${cart.grandTotal}</strong></h4>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <input type="hidden" name="_flowExecutionKey">

                        <br><br>

                        <button class="btn btn-default" name="_eventId_backToCollectCustomerInfo">Back</button>
                        <form commandName="chargeRequest" class="btn btn-default"  method='POST' id='checkout-form' name="_eventId_orderConfirmed">
                            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                            <input type="hidden" name="_flowExecutionKey">
                            <button id="payment" class="btn btn-default" name="_eventId_orderConfirmed" data-key=${payment.stripePublicKey} data-amount=${payment.amount}
                                data-currency=${payment.currency} data-name='Music Store' data-description='Music Store Checkout for Amount: $${payment.amount/100}'
                                data-image='<c:url value="/img/stripelogo.png" />' data-locale='auto' data-zip-code='false' >Payment</button>
                        </form>
                        <script src="https://checkout.stripe.com/v2/checkout.js"></script>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
                        <script>
                                $(document).ready(function() {
                                    $('#payment').on('click', function(event) {
                                        event.preventDefault();
                                        var $button = $(this),
                                        $form = $button.parents('form');
                                        $form.commandName = "chargeRequest";
                                        var opts = $.extend({}, $button.data(), {
                                            token: function(result) {
                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                result.description = $button.data().description;
                                                result.amount = parseInt($button.data().amount);
                                                console.log($button.data());
                                                console.log(result);
                                                    fetch("/payment/charge", {
                                                      method: "POST",
                                                      headers: {"Content-Type": "application/json", "X-CSRF-TOKEN": csrfToken},
                                                      body: JSON.stringify(result)
                                                    })
                                                    .then(response => {
                                                      if (!response.ok)
                                                        throw response;
                                                      resp = response.clone().json();
                                                      return resp;
                                                      })
                                                   .then(output => {
                                                     if(output.status.localeCompare("succeeded") == 0)
                                                        $form.append($('<input>').attr({ type: 'hidden', name: '_eventId_orderConfirmed', value: result.id })).submit();
                                                     $form.append($('<input>').attr({ type: 'hidden', name: '_eventId_paymentFailed', value: result.id })).submit();
                                                   })
                                                   .catch(err => {
                                                     console.log("Purchase failed:", err);
                                                     $form.append($('<input>').attr({ type: 'hidden', name: '_eventId_paymentFailed', value: result.id })).submit();
                                                   })
                                            }
                                        });

                                        StripeCheckout.open(opts);
                                        event.preventDefault();
                                    });
                                    window.addEventListener('popstate', function() {
                                      handler.close();
                                    });
                                });
                         </script>

                        <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp" %>