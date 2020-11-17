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
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER (ORDER BY productID DESC) rownum, productID, productName, price, img, stock FROM dbo.Products) SELECT * FROM r WHERE r.rownum >= (? - 1) * ? + 1 AND r.rownum <= ? * ?";
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
                product.setStock(rs.getString("stock"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }   
    
    public void removeProduct(int id) {
        try {
            String sql = "DELETE FROM dbo.Image WHERE productID = ?\n" +
                         "DELETE FROM dbo.Products WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean updateProduct(Product p) {
        boolean isUpdated = false;
        try {
            String sql = "UPDATE dbo.Products SET productName = ?, price = ?, categoryID = ?, detail = ?, stock = ?, img = ? WHERE productID = ?\n" +
                    "UPDATE dbo.Image SET imgsrc = ? WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, p.getPrice());
            st.setInt(3, p.getCategoryID());
            st.setString(4, p.getShortdesc());
            st.setString(5, p.getStock());
            st.setString(6, p.getImage());
            st.setInt(7, p.getId());
            st.setString(8, p.getImage());
            st.setInt(9, p.getId());
            isUpdated = st.executeUpdate() > 0;
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isUpdated;
    }
    
    public boolean createProduct(Product p) {
        boolean isCreated = false;
        try {
            String sql = "INSERT INTO dbo.Products (productID, productName, price, categoryID, detail, stock, img) VALUES (?, ?, ?, ?, ?, ?, ?)\n" + 
                         "INSERT INTO dbo.Image (imgsrc, productID) VALUES (?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getId());
            st.setString(2, p.getName());
            st.setInt(3, p.getPrice());
            st.setInt(4, p.getCategoryID());
            st.setString(5, p.getShortdesc());
            st.setString(6, p.getStock());
            st.setString(7, p.getImage());
            st.setString(8, p.getImage());
            st.setInt(9, p.getId());
            isCreated = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isCreated;
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

    public ArrayList<Product> getLatestProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP 6 * FROM Products ORDER BY productID DESC";
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
                p.setStock(rs.getString("stock"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    
}
