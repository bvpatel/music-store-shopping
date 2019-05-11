package com.ravi.musicstore.controller;

import javax.servlet.http.HttpServletRequest;

import com.ravi.musicstore.configuration.PaypalPaymentIntent;
import com.ravi.musicstore.configuration.PaypalPaymentMethod;
import com.ravi.musicstore.model.Cart;
import com.ravi.musicstore.model.CustomerOrder;
import com.ravi.musicstore.service.impl.PaypalService;
import com.ravi.musicstore.util.URLUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

@Controller
@RequestMapping("/customer/payment")
public class PaymentController {

    public static final String PAYPAL_SUCCESS_URL = "/success";
    public static final String PAYPAL_CANCEL_URL = "/cancel";

    private Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private PaypalService paypalService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping(method = RequestMethod.GET)
    public String pay(CustomerOrder customerOrder, Cart cart) {
        String cancelUrl = URLUtils.getBaseURl(request) + "/customer/payment" + PAYPAL_CANCEL_URL;
        String successUrl = URLUtils.getBaseURl(request) + "/customer/payment" + PAYPAL_SUCCESS_URL;
        try {

            Payment payment = paypalService.createPayment(
                    cart.getGrandTotal(),
                    "USD",
                    PaypalPaymentMethod.paypal,
                    PaypalPaymentIntent.sale,
                    cart.getCartId().toString(),
                    cancelUrl,
                    successUrl);
            for (Links links : payment.getLinks()) {
                if (links.getRel().equals("approval_url")) {
                    return "redirect:" + links.getHref();
                }
            }
        } catch (PayPalRESTException e) {
            log.error(e.getMessage());
        }
        return "redirect:/";
    }

    @RequestMapping(method = RequestMethod.GET, value = PAYPAL_CANCEL_URL)
    public String cancelPay() {
        return "cancel";
    }

    @RequestMapping(method = RequestMethod.GET, value = PAYPAL_SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
        try {
            Payment payment = paypalService.executePayment(paymentId, payerId);
            if (payment.getState().equals("approved")) {
                return "success";
            }
        } catch (PayPalRESTException e) {
            log.error(e.getMessage());
        }
        return "redirect:/";
    }

}