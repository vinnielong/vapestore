/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Vinnie Long
 */
public class Checkout {
  
    private String fullname;
    private String phonenumber;
    private String email;
    private String country;
    private String address;
    private String city;
    private String postcode;
    private String message;
    private String orders;
    private int total;

    public Checkout() {
    }

    public Checkout(String fullname, String phonenumber, String email, String country, String address, String city, String postcode, String message, String orders, int total) {
        this.fullname = fullname;
        this.phonenumber = phonenumber;
        this.email = email;
        this.country = country;
        this.address = address;
        this.city = city;
        this.postcode = postcode;
        this.message = message;
        this.orders = orders;
        this.total = total;
    }

    

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getOrders() {
        return orders;
    }

    public void setOrders(String orders) {
        this.orders = orders;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    
}
