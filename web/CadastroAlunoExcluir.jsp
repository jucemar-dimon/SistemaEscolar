<%-- 
    Document   : CadastroAlunoExcluir
    Created on : 27/10/2019, 10:18:05
    Author     : Jucemar Dimon <jucemar.dimon@gmail.com>
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="modelo.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Excusão de dados</h1>
        <form name="formCadastro" action="ControleAluno" method="POST">
            <%
                String parametroCodigoAluno = request.getParameter("codAluno");
                Integer idAluno = Integer.parseInt(parametroCodigoAluno);
                Hashtable<Integer, Aluno> tabela = null;
                tabela = (Hashtable<Integer, Aluno>) getServletContext().getAttribute("tabela");
                Aluno aluno = tabela.get(idAluno);
            %>
            <label>Código do Aluno</label>
            <input type="text" readonly="readonly" name="txtCodigoAluno" value="<%=aluno.codAluno%>" />

            <label>Nome do Aluno</label>
            <input type="text" readonly="readonly" name="txtNomeAluno" value="<%=aluno.nomeAluno%>" />

            <label>Avaliação 01</label>
            <input type="text" readonly="readonly" name="txtAvaliacao1" value="<%=aluno.avaliacao1%>" />

            <label>Avaliação 02</label>
            <input type="text" readonly="readonly" name="txtAvaliacao2" value="<%=aluno.avaliacao2%>" />

            <input type="submit" value="Cancelar" name="btnOperacao" />  
            <input type="submit" value="Excluir" name="btnOperacao" />  
        </form>
    </body>
</html>
