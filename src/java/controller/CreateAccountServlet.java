/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.UserDTO;
import dtos.UserErrorDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateAccountServlet", urlPatterns = {"/CreateAccountServlet"})
public class CreateAccountServlet extends HttpServlet {
    private static final String ERROR = "createNewAccount.jsp";
    private static final String SUCCESS = "login.html";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        try {
            String txtEmail = request.getParameter("txtEmail");
            String txtName = request.getParameter("txtFullName");
            String txtPassword = request.getParameter("txtPassword");
            String txtConfirm = request.getParameter("txtConfirm");
            
            UserErrorDTO error = new UserErrorDTO();
            UserDAO dao = new UserDAO();
            boolean check = true;
            
            if(txtEmail.isEmpty()){
                error.setUserID("Email is not empty");
                check = false;
            }else if(dao.checkAccountExist(txtEmail)){
                error.setUserID("Email existed !");
                check = false;
            }
            
            
            if(txtName.isEmpty()){
                error.setName("Name is not empty");
                check = false;
            }
            if(txtPassword.isEmpty()){
                error.setPassword("Password is not empty");
                check = false;
            }
            if(txtConfirm.isEmpty()){
                error.setConfirm("Confirm is not empty");
                check = false;
            }
            
            if(!txtPassword.equals(txtConfirm)){
                error.setConfirm("Password and confirm don't match");
                check = false;
            }
            
            if(check){
                dao.createAccount(new UserDTO(txtEmail, txtName, txtPassword, "us"));
                url = SUCCESS;
            }else{
                request.setAttribute("USER_ERROR", error);
                request.setAttribute("txtEmail", txtEmail);
                request.setAttribute("txtFullName", txtName);
                request.setAttribute("txtPassword", txtPassword);
                request.setAttribute("txtConfirm", txtConfirm);
            }
        } catch (Exception e) {
            log("Error at Severlet :" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
