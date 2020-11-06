/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Checkout;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vinnie Long
 */
public class CheckoutDAO extends BaseDAO{
    
    public boolean createOrder(Checkout c) {
        boolean isOrdered = false;
        try {
            String sql = "INSERT INTO dbo.Orders (fullname, phonenumber, email, country, address, city, postcode, message, [order], total) VALUES (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getFullname());
            st.setString(2, c.getPhonenumber());
            st.setString(3, c.getEmail());
            st.setString(4, c.getCountry());
            st.setString(5, c.getAddress());
            st.setString(6, c.getCity());
            st.setString(7, c.getPostcode());
            st.setString(8, c.getMessage());
            st.setString(9, c.getOrders());
            st.setInt(10, c.getTotal());
            isOrdered = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isOrdered;
    }
    
}
