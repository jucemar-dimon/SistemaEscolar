<%-- 
    Document   : CadastroAlunoExcluir
    Created on : 27/10/2019, 10:18:05
    Author     : Jucemar Dimon <jucemar.dimon@gmail.com>
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="modelo.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String parametroCodigoAluno = request.getParameter("codAluno");
    Integer idAluno = Integer.parseInt(parametroCodigoAluno);
    Hashtable<Integer, Aluno> tabela = null;
    tabela = (Hashtable<Integer, Aluno>) getServletContext().getAttribute("tabela");
    Aluno aluno = tabela.get(idAluno);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Fontawesome -->
        <script src="https://kit.fontawesome.com/37771f91aa.js" crossorigin="anonymous"></script>
        <!-- CSS -->
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <title>Sistema Escolar</title>
    </head>
    <body>


        <header>
            <nav class="navbar navbar-light bg-light mb-3">
                <div class="container">
                    <a class="navbar-brand" href="#">
                        <i class="brand fa fa-graduation-cap d-inline-block align-top"></i>
                        <span class="h3">Sistema Escolar</span>
                    </a>
                </div>
            </nav>
        </header>


        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="CadastroAlunoInserir.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="CadastroAlunoInserir.jsp">Alunos</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><%=aluno.nomeAluno%></li>
                </ol>
            </nav>

            <div class="jumbotron p-3">
                <section>
                    <article>
                        <header>
                            <h5>Cadastro de alunos <small class="text-muted">Exclusão</small></h5>
                            <hr class="my-1 mb-3">
                        </header>


                        <form name="formCadastro" action="ControleAluno" method="POST">

                            <div class="form-row">
                                <div class="form-group col-md-1">
                                    <label>Código</label>
                                    <input class="form-control" type="text" readonly="readonly" name="txtCodigoAluno" value="<%=aluno.codAluno%>" />
                                </div>

                                <div class="form-group col-md-11">
                                    <label>Nome do Aluno</label>
                                    <input class="form-control" type="text" readonly="readonly" name="txtNomeAluno" value="<%=aluno.nomeAluno%>" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Avaliação 01</label>
                                    <input class="form-control" type="text" readonly="readonly" name="txtAvaliacao1" value="<%=aluno.avaliacao1%>" />
                                </div>
                                <div class="form-group col-md-6">                                    
                                    <label>Avaliação 02</label>
                                    <input class="form-control" type="text" readonly="readonly" name="txtAvaliacao2" value="<%=aluno.avaliacao2%>" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 d-flex flex-row justify-content-end">
                                    <input class="btn btn-danger" type="submit" value="Cancelar" name="btnOperacao" />  
                                    <input class="btn btn-primary ml-3" type="submit" value="Excluir" name="btnOperacao" />  
                                </div>
                            </div>
                        </form>
                    </article>
                </section>
            </div>

    </body>
</html>
