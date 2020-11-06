/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import Model.Account;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnie Long
 */
public class DeleteController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = dao.getProductByID(id);
        Account account = (Account) request.getSession().getAttribute("account");
        ArrayList<Product> products = account.getProducts();
        for (Product p : products) {
            if (p.getId() == id) {
                products.remove(p);
                break;
            }
        }
        processGet(request, response);
    }

    
}
