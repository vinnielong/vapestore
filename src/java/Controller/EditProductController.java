/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnie Long
 */
public class EditProductController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = dao.getProductByID(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int category = Integer.parseInt(request.getParameter("category"));
        String detail = request.getParameter("detail");
        String stock = request.getParameter("stock");
        String image = request.getParameter("img");
        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setPrice(price);
        p.setCategoryID(category);
        p.setShortdesc(detail);
        p.setStock(stock);
        p.setImage(image);
        boolean isUpdated = dao.updateProduct(p);
        if (isUpdated) {
            response.sendRedirect("manage");
        }
    }

}
