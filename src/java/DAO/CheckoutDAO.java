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
            String sql = "";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(0, 0);
            st.setString(0, sql);
            isOrdered = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isOrdered;
    }
    
}
