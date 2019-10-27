<%-- 
    Document   : CadastroAlunoInserir
    Created on : 27/10/2019, 10:17:05
    Author     : Jucemar Dimon <jucemar.dimon@gmail.com>
--%>

<%@page import="java.util.Set"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Inserção de dados</h1>

        <form name="formCadastro" action="ControleAluno" method="POST">
            <label>Código do Aluno</label>
            <input type="text" name="txtCodigoAluno" value="" />

            <label>Nome do Aluno</label>
            <input type="text" name="txtNomeAluno" value="" />

            <label>Avaliação 01</label>
            <input type="text" name="txtAvaliacao1" value="" />

            <label>Avaliação 02</label>
            <input type="text" name="txtAvaliacao2" value="" />

            <input type="submit" value="Inserir" name="btnOperacao" />  
        </form>
        <h2>Lista de alunos</h2>
        <%
            Hashtable<Integer, Aluno> tabela = null;
            tabela = (Hashtable<Integer, Aluno>) getServletContext().getAttribute("tabela");
            if (tabela != null) {
                Set<Integer> listaCodigosAlunos = tabela.keySet();
                out.println("<div>");
                out.println("<span>Código</span>");
                out.println("<span>Nome</span>");
                out.println("<span>Avaliação 01</span>");
                out.println("<span>Avaliação 02</span>");
                out.println("<span>Média</span>");
                out.println("<span>Ações</span>");
                out.println("<span>Código aluno</span>");
                out.println("<span>Código aluno</span>");
                out.println("</div>");
                for (Integer cod : listaCodigosAlunos) {
                    Aluno aluno = tabela.get(cod);
                    aluno.avaliacao1 = aluno.avaliacao1 == null ? aluno.avaliacao1 = 0.0f : aluno.avaliacao1;
                    aluno.avaliacao2 = aluno.avaliacao2 == null ? aluno.avaliacao2 = 0.0f : aluno.avaliacao2;
                    Float media = null;
                    if (aluno.avaliacao1 > 0 || aluno.avaliacao2 > 0) {
                        media = (aluno.avaliacao1 + aluno.avaliacao2) / 1;
                    } else {
                        media = 0.0f;
                    }
                    out.println("<div>");
                    out.println("<span>" + aluno.codAluno + "</span>");
                    out.println("<span>" + aluno.nomeAluno + "</span>");
                    out.println("<span>" + aluno.avaliacao1 + "</span>");
                    out.println("<span>" + aluno.avaliacao2 + "</span>");
                    out.println("<span>" + media + "</span>");                  
                    out.println("<span>" + media + "</span>");                  
                    out.println("<a href=CadastroAlunoAlterar.jsp?codAluno="+aluno.codAluno+">Alterar</a>");                  
                    out.println("<a href=CadastroAlunoExcluir.jsp?codAluno="+aluno.codAluno+">Excluir</a>");                  
                    out.println("</div>");
                }

            }
        %>
    </body>
</html>
