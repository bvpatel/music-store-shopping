package com.ravi.musicstore.service.impl;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.ravi.musicstore.configuration.PaypalPaymentIntent;
import com.ravi.musicstore.configuration.PaypalPaymentMethod;
import com.ravi.musicstore.model.Cart;
import com.ravi.musicstore.model.CustomerOrder;
import com.ravi.musicstore.util.URLUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class PaymentServiceImpl {


    @Autowired
    private PaypalService paypalService;


    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpServletResponse response;


    public static final String PAYPAL_SUCCESS_URL = "pay/success";
    public static final String PAYPAL_CANCEL_URL = "pay/cancel";



    public String pay(Cart cart){
        //request.getServletContext().getFlowExecutionUrl();
        String cancelUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_CANCEL_URL;
        String successUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_SUCCESS_URL;
        try {
            Payment payment = paypalService.createPayment(
                    cart.getGrandTotal(),
                    "USD",
                    PaypalPaymentMethod.paypal,
                    PaypalPaymentIntent.sale,
                    cart.getCartId().toString(),
                    cancelUrl,
                    successUrl);
            for(Links links : payment.getLinks()){
                if(links.getRel().equals("approval_url")){
                    response.setHeader("Location", links.getHref());
                    response.setStatus(302);
                    return "redirect:" + links.getHref();
                }
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }



}
