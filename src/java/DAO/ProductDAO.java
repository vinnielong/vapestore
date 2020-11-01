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

    public ArrayList<Product> getProduct() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM dbo.Products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getFloat("price"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setDetail(rs.getString("detail"));
                product.setImage(rs.getString("image"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public Product getProductByID() {
        Product product = null;
        try {
            String sql = "SELECT * FROM dbo.Products WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {   
                product = new Product();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getFloat("price"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setDetail(rs.getString("detail"));
                product.setImage(rs.getString("image"));                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
}
