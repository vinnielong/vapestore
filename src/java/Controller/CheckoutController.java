/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import DAO.CheckoutDAO;
import Model.Account;
import Model.Checkout;
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
public class CheckoutController extends BaseAuthController {

    AccountDAO dao = new AccountDAO();

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        Account account = dao.getAccountByID(username);
        request.setAttribute("account", account);
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {     
        CheckoutDAO cdao = new CheckoutDAO();
        String order = String.valueOf(request.getParameter("order"));
        String fullname = request.getParameter("name");
        String number = request.getParameter("number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String postcode = request.getParameter("zip");
        String message = request.getParameter("message");
        int total = Integer.parseInt(request.getParameter("total"));
        Checkout c = new Checkout();
        c.setFullname(fullname);
        c.setPhonenumber(number);
        c.setEmail(email);
        c.setCountry(country);
        c.setAddress(address);
        c.setCity(city);
        c.setPostcode(fullname);
        c.setMessage(email);
        c.setOrders(order);
        c.setTotal(total);
        boolean isOrdered = cdao.createOrder(c);
        if (isOrdered) {
            response.sendRedirect("home");
        } else {
            response.getWriter().println("fail");
        }
    }

}
