/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Hashtable;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;

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
     * @throws java.text.ParseException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            String codigoAluno = request.getParameter("txtCodigoAluno");
            String avaliacao1 = request.getParameter("txtAvaliacao1");
            String avaliacao2 = request.getParameter("txtAvaliacao2");
            String nomeAluno = request.getParameter("txtNomeAluno");
            String operacao = request.getParameter("btnOperacao");

            Integer codAluno = null;
            Float aval1 = null;
            Float aval2 = null;

            RequestDispatcher redirecionadorPaginaInicial = request.getRequestDispatcher("CadastroAlunoInserir.jsp");

            if (codigoAluno != null && !codigoAluno.isEmpty()) {

                codAluno = Integer.parseInt(codigoAluno);

            }

            if (avaliacao1 != null && !avaliacao1.isEmpty()) {
                aval1 = Float.parseFloat(avaliacao1);
            }

            if (avaliacao2 != null && !avaliacao2.isEmpty()) {
                aval2 = Float.parseFloat(avaliacao2);
            }

            if (operacao != null && !operacao.isEmpty()) {
                switch (operacao) {
                    case "Inserir":
                        out.println("Operação inserir");
                        Aluno aluno = new Aluno();
                        aluno.codAluno = codAluno;
                        aluno.nomeAluno = nomeAluno;
                        aluno.avaliacao1 = aval1;
                        aluno.avaliacao2 = aval2;
                        Hashtable<Integer, Aluno> tabela = null;
                        tabela = (Hashtable<Integer, Aluno>) getServletContext().getAttribute("tabela");
                        if (tabela == null) {
                            tabela = new Hashtable<Integer, Aluno>();
                        }
                        tabela.put(codAluno, aluno);
                        getServletContext().setAttribute("tabela", tabela);

                        redirecionadorPaginaInicial.forward(request, response);

                        break;

                    case "Alterar":
                        Aluno alunoAlterar = new Aluno();
                        alunoAlterar.codAluno = codAluno;
                        alunoAlterar.nomeAluno = nomeAluno;
                        alunoAlterar.avaliacao1 = aval1;
                        alunoAlterar.avaliacao2 = aval2;
                        out.println("Operação Alterar");
                        Hashtable<Integer, Aluno> tabelaAlterar = null;
                        tabelaAlterar = (Hashtable<Integer, Aluno>) getServletContext().getAttribute("tabela");
                        tabelaAlterar.replace(codAluno, alunoAlterar);
                        redirecionadorPaginaInicial.forward(request, response);

                        break;

                    case "Excluir":
                        out.println("Operação Excluir");
                        break;

                    case "Cancelar":
                        out.println("Operação Cancelar");
                        break;

                }
            }

        }
    }
}
