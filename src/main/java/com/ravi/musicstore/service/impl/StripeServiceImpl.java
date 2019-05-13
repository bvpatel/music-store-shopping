package com.ravi.musicstore.service.impl;

import com.ravi.musicstore.model.Cart;
import com.ravi.musicstore.model.ChargeRequest;
import com.ravi.musicstore.model.PaymentRequest;
import com.stripe.Stripe;
import com.stripe.exception.APIConnectionException;
import com.stripe.exception.APIException;
import com.stripe.exception.AuthenticationException;
import com.stripe.exception.CardException;
import com.stripe.exception.InvalidRequestException;
import com.stripe.model.Charge;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class StripeServiceImpl {

    @Value("${stripe.api_key}")
    private String stripePublicKey;

    @Value("${stripe.secret_key}")
    private String apiKey;

    @PostConstruct
    public void init() {
        Stripe.apiKey = apiKey;
    }

    public Charge charge(ChargeRequest chargeRequest)
            throws AuthenticationException, InvalidRequestException, APIConnectionException, CardException, APIException {
        Map<String, Object> chargeParams = new HashMap<>();
        chargeParams.put("amount", chargeRequest.getAmount());
        chargeParams.put("currency", chargeRequest.getCurrency());
        chargeParams.put("description", chargeRequest.getDescription());
        chargeParams.put("source", chargeRequest.getId());
        return Charge.create(chargeParams);
    }

    public PaymentRequest checkout(PaymentRequest paymentRequest, Cart cart) {
        paymentRequest.setAmount(cart.getGrandTotal() * 100);// in cents
        paymentRequest.setStripePublicKey(stripePublicKey);
        paymentRequest.setCurrency(ChargeRequest.Currency.USD);
        return paymentRequest;
    }
}