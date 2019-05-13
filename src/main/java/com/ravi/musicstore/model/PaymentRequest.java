package com.ravi.musicstore.model;

import java.io.Serializable;

public class PaymentRequest implements Serializable {

    private static final long serialVersionUID = 576789765769L;
    private String stripePublicKey;
    private double amount;
    private ChargeRequest.Currency currency;

    public String getStripePublicKey() {
        return stripePublicKey;
    }

    public void setStripePublicKey(String stripePublicKey) {
        this.stripePublicKey = stripePublicKey;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public ChargeRequest.Currency getCurrency() {
        return currency;
    }

    public void setCurrency(ChargeRequest.Currency currency) {
        this.currency = currency;
    }
}
