/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jucemar Dimon <jucemar.dimon@gmail.com>
 */
@WebServlet(name = "ControleAluno", urlPatterns = {"/ControleAluno"})
public class ControleAluno extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            out.println("teste");

            String codigoAluno = request.getParameter("txtCidgoAluno");
            String avaliacao1 = request.getParameter("txtAvaliacao1");
            String avaliacao2 = request.getParameter("txtAvaliacao2");
            String nomeAluno = request.getParameter("txtNomeAluno");
            String operacao = request.getParameter("btnOperacao");
            
            Integer codAluno = null;
            Float aval1 = null;
            Float aval2 = null;

            
        }catch(Error e){
            
        }
    }
}