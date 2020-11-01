/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vinnie Long
 */
public class AccountDAO extends BaseDAO {

    public Account Login(String username, String password) {
        Account account = null;
        try {
            String sql = "SELECT * FROM dbo.Account WHERE username = ? AND password = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                account = new Account();
                account.setUsername(rs.getString("username"));
                account.setFullname(rs.getString("fullname"));
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setPhonenumber(rs.getString("phonenumber"));
                account.setAddress(rs.getString("address"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }

    public Account getAccountByID(String username) {
        Account account = null;
        try {
            String sql = "SELECT * FROM dbo.Account WHERE username = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                account = new Account();
                account.setUsername(rs.getString("username"));
                account.setFullname(rs.getString("fullname"));
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setPhonenumber(rs.getString("phonenumber"));
                account.setAddress(rs.getString("address"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }

    public boolean register(Account acc) {
        boolean isCreated = false;
        try {
            String sql = "INSERT INTO dbo.Account(username, fullname, password, email, phonenumber, address) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, acc.getUsername());
            st.setString(2, acc.getFullname());
            st.setString(3, acc.getPassword());
            st.setString(4, acc.getEmail());
            st.setString(5, acc.getPhonenumber());
            st.setString(6, acc.getAddress());
            isCreated = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isCreated;
    }

    public boolean updateAccount(Account account) {
        boolean isUpdated = false;
        try {
            String sql = "UPDATE dbo.Account SET fullname = ?, email = ?, phonenumber = ?, address = ? WHERE username = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getFullname());
            st.setString(2, account.getEmail());
            st.setString(3, account.getPhonenumber());
            st.setString(4, account.getAddress());
            st.setString(5, account.getUsername());
            isUpdated = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isUpdated;
    }
    
    public String getPassword(String username) {   
        String password = "";
        try {
            String sql = "SELECT password FROM dbo.Account WHERE username = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                password = rs.getString("password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return password;
    }
    
    public boolean resetPassword(String username, String password) {
        boolean isReset = false;
        try {
            String sql = "UPDATE dbo.Account SET password = ? WHERE username = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(1, username);
            isReset = st.executeUpdate() > 0;            
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isReset;
    }
}
