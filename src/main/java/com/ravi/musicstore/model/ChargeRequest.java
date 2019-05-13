package com.ravi.musicstore.model;

import java.io.Serializable;

public class ChargeRequest implements Serializable {

    private static final long serialVersionUID = 576785433459765769L;
    public enum Currency {
        EUR, USD;
    }
    private String description;
    private int amount; // cents
    private Currency currency;
    private String email;
    private String id;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "ChargeRequest{" +
                "description='" + description + '\'' +
                ", amount=" + amount +
                ", currency=" + currency +
                ", email='" + email + '\'' +
                ", id='" + id + '\'' +
                '}';
    }
}