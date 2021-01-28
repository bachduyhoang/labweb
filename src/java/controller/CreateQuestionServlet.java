/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.QuestionDAO;
import dtos.QuestionDTO;
import dtos.QuestionError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateQuestionServlet", urlPatterns = {"/CreateQuestionServlet"})
public class CreateQuestionServlet extends HttpServlet {

    private static final String ERROR = "createQuestion.jsp";
    private static final String SUCCESS = "HomeAdminServlet";

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
            QuestionError error = new QuestionError();
            boolean checkValid = true;
            QuestionDAO dao = new QuestionDAO();

            String txtContent = request.getParameter("txtContent");
            String txtAns1 = request.getParameter("txtAns1");
            String txtAns2 = request.getParameter("txtAns2");
            String txtAns3 = request.getParameter("txtAns3");
            String txtAns4 = request.getParameter("txtAns4");
            String txtSubject = request.getParameter("txtSubject");
            String txtCorrectAns = request.getParameter("txtCorrectAns");

            if (txtContent.isEmpty()) {
                error.setContent("Content is not null");
                checkValid = false;
            }
            if (txtAns1.isEmpty()) {
                error.setAns1("Answer1 is not null");
                checkValid = false;

            }
            if (txtAns2.isEmpty()) {
                error.setAns2("Answer2 is not null");
                checkValid = false;

            }
            if (txtAns3.isEmpty()) {
                error.setAns3("Answer3 is not null");
                checkValid = false;

            }
            if (txtAns4.isEmpty()) {
                error.setAns4("Answer4 is not null");
                checkValid = false;
            }

            if (checkValid) {
                url = SUCCESS;
                switch (txtCorrectAns) {
                    case "1":
                        txtCorrectAns = txtAns1;
                        break;
                    case "2":
                        txtCorrectAns = txtAns2;
                        break;
                    case "3":
                        txtCorrectAns = txtAns3;
                        break;
                    case "4":
                        txtCorrectAns = txtAns4;
                        break;
                }
                QuestionDTO question = new QuestionDTO(null, txtContent, txtAns1, txtAns2, txtAns3, txtAns4, txtCorrectAns, txtSubject, null, true);
                dao.createQuestion(question);
            }

            request.setAttribute("QUESTION_ERROR", error);
            request.setAttribute("txtContent", txtContent);
            request.setAttribute("txtAns1", txtAns1);
            request.setAttribute("txtAns2", txtAns2);
            request.setAttribute("txtAns3", txtAns3);
            request.setAttribute("txtAns4", txtAns4);
            request.setAttribute("txtSubject", txtSubject);
            request.setAttribute("txtCorrectAns", txtCorrectAns);

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
