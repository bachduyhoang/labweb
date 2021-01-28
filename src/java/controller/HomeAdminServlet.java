/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.QuestionDAO;
import dtos.QuestionDTO;
import dtos.SubjectDTO;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "HomeAdminServlet", urlPatterns = {"/HomeAdminServlet"})
public class HomeAdminServlet extends HttpServlet {

    private static final String ERROR = "invalid.html";
    private static final String SUCCESS = "adminpage.jsp";

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
            QuestionDAO dao = new QuestionDAO();
            HttpSession ss = request.getSession();
            List<SubjectDTO> listSub = null;
            List<QuestionDTO> listQues = null;
            int maxPage = 1;

            String index = (String) request.getParameter("index");
            String txtSearchName = request.getParameter("txtSearchName");
            String txtSearchSubject = request.getParameter("txtSearchSubject");
            String txtSearchStatus = request.getParameter("txtSearchStatus");

            if (txtSearchName == null) {
                txtSearchName = "";
            }
            if (txtSearchSubject == null) {
                txtSearchSubject = "";
            }
            if (txtSearchStatus == null) {
                txtSearchStatus = "";
            }
            if (index == null) {
                index = "1";
            }

            listSub = dao.getListSubject();
            listQues = dao.getListPagingAdmin(txtSearchName, txtSearchSubject, txtSearchStatus, Integer.parseInt(index));
            maxPage = dao.countPage(txtSearchName, txtSearchSubject, txtSearchStatus);
            
            ss.setAttribute("listSubject", listSub);
            ss.setAttribute("listQuestion", listQues);
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("txtSearchName", txtSearchName);
            request.setAttribute("txtSearchSubject", txtSearchSubject);
            request.setAttribute("txtSearchStatus", txtSearchStatus);
            url = SUCCESS;
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
