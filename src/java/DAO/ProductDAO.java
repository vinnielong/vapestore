/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Category;
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

    public ArrayList<Product> getAllProducts(int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER (ORDER BY productID DESC) rownum, productID, productName, price, img FROM dbo.Products) SELECT * FROM r WHERE r.rownum >= (? - 1) * ? + 1 AND r.rownum <= ? * ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, pageSize);
            st.setInt(3, pageSize);
            st.setInt(4, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("price"));
                product.setImage(rs.getString("img"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getTotalProducts() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) total FROM dbo.Products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
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
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("img"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public ArrayList<Product> getProductsByCategory(int categoryID, int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER (ORDER BY productID DESC) rownum, productID, productName, price, img FROM dbo.Products WHERE categoryID = ?) SELECT * FROM r WHERE r.rownum >= (? - 1) * ? + 1 AND r.rownum <= ? * ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            st.setInt(2, pageIndex);
            st.setInt(3, pageSize);
            st.setInt(4, pageSize);
            st.setInt(5, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("price"));
                product.setImage(rs.getString("img"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<String> getProductImage(int id) {
        ArrayList<String> image = new ArrayList<>();
        try {
            String sql = "SELECT imgsrc FROM dbo.Image WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                image.add(rs.getString("imgsrc"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return image;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> category = new ArrayList<>();
        try {
            String sql = "SELECT * FROM dbo.Category";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                category.add(new Category(rs.getInt("categoryID"), rs.getString("categoryName")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    public int getTotalProductsByCatID(int id) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) total FROM dbo.Products WHERE categoryID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public ArrayList<Product> getLatestProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP 6 * FROM dbo.Products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("productID"));
                p.setName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setImage(rs.getString("img"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> search(String text) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM dbo.Products WHERE productName LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("productID"));
                p.setName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                p.setImage(rs.getString("img"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
}
