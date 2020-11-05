/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import Model.Account;
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
public class RegisterController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        String password = request.getParameter("pass");
        String repassword = request.getParameter("repass");
        ArrayList<Account> accounts = dao.getAllAccounts();
        boolean usernameExisted = false;
        boolean emailExisted = false;
        for (Account a : accounts) {
            if (username.equals(a.getUsername())) {
                usernameExisted = true;
            } else if(email.equals(a.getEmail())) {
                emailExisted = true;
            }
        }
        if (!password.equals(repassword)) {
            request.setAttribute("errorMsg", "Password and Repassword not match!");
            doGet(request, response);
        } else {
            if (usernameExisted) {
                request.setAttribute("errorMsg", "Username existed!");
                doGet(request, response);
            } else if(emailExisted) {
                request.setAttribute("errorMsg", "Email existed!");
                doGet(request, response);
            } else {
                Account acc = new Account(username, password, fullname, email, phonenumber, address);
                dao.register(acc);
                response.sendRedirect("login");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
