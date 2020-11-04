/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Account;
import Model.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnie Long
 */
public class CartController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("account");
        ArrayList<Product> products = acc.getProducts();
        request.setAttribute("products", products);
        for (Product p : products) {
            response.getWriter().println(p.getImage() + p.getQuantity());
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    
    
}