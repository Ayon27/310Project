package com.addPlace;

public class Place {
    private int bedrooms;
    private int washrooms;
    private int guests;

    private String country;
    private String state;
    private String address;

    protected void setBedrooms(int n) {
        bedrooms = n;
    }

    protected void setWashrooms(int n) {
        washrooms = n;
    }

    protected void setGuests(int n) {
        guests = n;
    }

    protected void setCountry(String s) {
        country = s;
    }

    protected void setState(String s) {
        state = s;
    }

    protected void setAddress(String s) {
        address = s;
    }

    protected int getBedrooms() {
        return bedrooms;
    }

    protected int getWashrooms() {
        return washrooms;
    }

    protected int getGuests() {
        return guests;
    }

    protected String getCountry() {
        return country;
    }

    protected String getState() {
        return state;
    }

    protected String getAddress() {
        return address;
    }

}

