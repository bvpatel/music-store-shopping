package com.ravi.musicstore.controller;

import com.ravi.musicstore.model.ChargeRequest;
import com.ravi.musicstore.model.ChargeResponse;
import com.ravi.musicstore.service.impl.StripeServiceImpl;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/payment/charge")
public class ChargeController {

    @Autowired
    StripeServiceImpl paymentsService;

    @RequestMapping(method = RequestMethod.POST, consumes = {MediaType.APPLICATION_JSON_VALUE}, produces = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody
    ChargeResponse charge(@RequestBody ChargeRequest chargeRequest) {
        ChargeResponse response = new ChargeResponse();
        try {
            chargeRequest.setCurrency(ChargeRequest.Currency.USD);
            Charge charge = paymentsService.charge(chargeRequest);
            response.setId(charge.getId());
            response.setStatus(charge.getStatus());
            response.setBalanceTransaction(charge.getBalanceTransaction());
        } catch(StripeException ex) {
            response.setStatus("error");
            response.setErrorMessage(ex.getMessage());
            return response;
        }
        return response;
     }
}