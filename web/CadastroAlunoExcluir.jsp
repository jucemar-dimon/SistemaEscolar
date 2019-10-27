<%-- 
    Document   : CadastroAlunoExcluir
    Created on : 27/10/2019, 10:18:05
    Author     : Jucemar Dimon <jucemar.dimon@gmail.com>
--%>

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
               <form name="formCadastro" action="CadastroAlunoInserir.jsp" method="POST">
            <label>Código do Aluno</label>
            <input type="text" name="txtCodigoAluno" value="" />
            
            <label>Nome do Aluno</label>
             <input type="text" name="txtNomeAluno" value="" />
             
             <label>Avaliação 01</label>
             <input type="text" name="txtAvaliacao1" value="" />
             
             <label>Avaliação 02</label>
             <input type="text" name="txtAvaliacao2" value="" />
             
             <input type="submit" value="Excluir" name="btnOperacao" />  
        </form>
        </form>
    </body>
</html>
