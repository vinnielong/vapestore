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
public class UpdateController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        String[] pid = request.getParameterValues("pid");
        String[] pquantity = request.getParameterValues("quantity");
        if (pid != null && pquantity != null) {
            int[] id = new int[pid.length];
            int[] quantity = new int[pquantity.length];
            Account account = (Account) request.getSession().getAttribute("account");
            ArrayList<Product> products = account.getProducts();
            for (int i = 0; i < pid.length; i++) {
                id[i] = Integer.parseInt(pid[i]);
            }
            for (int i = 0; i < pquantity.length; i++) {
                quantity[i] = Integer.parseInt(pquantity[i]);
            }
            for (int i = 0; i < id.length; i++) {
                for (Product p : products) {
                    if (p.getId() == id[i]) {
                        p.setQuantity(quantity[i]);
                    }

                }
            }
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
