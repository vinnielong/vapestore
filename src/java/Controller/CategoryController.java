/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import Model.Category;
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
public class CategoryController extends HttpServlet {

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
        ProductDAO dao = new ProductDAO();
        ArrayList<Category> category = dao.getCategory();
        int catID = Integer.parseInt(request.getParameter("catID"));
        String page = request.getParameter("page");
        if (page == null || page.trim().isEmpty()) {
            page = "1";
        }
        int pageIndex = Integer.parseInt(page);
        int pageSize = 6;
        if (catID == 0) {
            int totalRecords = dao.getTotalProducts();
            int totalPages = totalRecords % pageSize == 0 ? totalRecords / pageSize : totalRecords / pageSize + 1;
            ArrayList<Product> products = dao.getAllProducts(pageIndex, pageSize);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("products", products);           
            request.setAttribute("pageIndex", pageIndex);            
            request.setAttribute("catID", catID);          
            request.setAttribute("category", category);            
            request.getRequestDispatcher("Products.jsp").forward(request, response);
        } else {
            int totalRecords = dao.getTotalProductsByCatID(catID);
            int totalPages = totalRecords % pageSize == 0 ? totalRecords / pageSize : totalRecords / pageSize + 1;
            ArrayList<Product> products = dao.getProductsByCategory(catID, pageIndex, pageSize);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("catID", catID);
            request.setAttribute("products", products);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("category", category);
            request.getRequestDispatcher("Products.jsp").forward(request, response);
        }
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
