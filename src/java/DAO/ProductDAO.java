/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vinnie Long
 */
public class ProductDAO extends BaseDAO {

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM dbo.Products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("price"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setShortdesc(rs.getString("detail"));
                product.setDescription(rs.getString("desc"));
                product.setStock(rs.getString("stock"));               
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public Product getProductByID(int id) {
        Product product = null;
        try {
            String sql = "SELECT * FROM dbo.Products WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {   
                product = new Product();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("price"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setShortdesc(rs.getString("detail"));
                product.setDescription(rs.getString("desc"));  
                product.setStock(rs.getString("stock")); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    
    public ArrayList<Product> getProductsByCategory(int categoryID) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM dbo.Products WHERE categoryID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("price"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setShortdesc(rs.getString("detail"));
                product.setDescription(rs.getString("desc"));
                product.setStock(rs.getString("stock")); 
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
}
