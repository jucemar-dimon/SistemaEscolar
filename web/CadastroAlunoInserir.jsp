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

            <div class="jumbotron p-3">
                <section>
                    <article>
                        <header>
                            <h5>Cadastro de alunos</h5>
                            <hr class="my-1 mb-3">
                        </header>
                        <form  name="formCadastro" action="ControleAluno" method="POST">
                            <div class="form-row">
                                <div class="col-md-1">
                                    <label>Código</label>
                                    <input   class="form-control" type="text" name="txtCodigoAluno" value="" />
                                </div>
                                <div class="col-md-6 ">
                                    <label>Nome</label>
                                    <input class="form-control" type="text" name="txtNomeAluno" value="" />
                                </div>

                                <div class="col-md-2">
                                    <label>Avaliação 01</label>
                                    <input class="form-control" type="text" name="txtAvaliacao1" value="" />
                                </div>

                                <div class="col-md-2">
                                    <label>Avaliação 02</label>
                                    <input class="form-control" type="text" name="txtAvaliacao2" value="" />
                                </div>   
                                <div class="col-md-1 ">
                                    <label>&nbsp</label>
                                    <label>&nbsp</label>
                                    <input class="btn btn-primary" type="submit" value="Inserir" name="btnOperacao" />  
                                </div>
                            </div>
                        </form>
                    </article>
            </div>
            <article>
                <header>
                    <h5>Lista de alunos</h5>
                </header>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width:5%;" scope="col">Código</th>
                            <th style="width:30%;" scope="col">Nome</th>
                            <th style="width:15%;" scope="col">Avaliação 01</th>
                            <th style="width:15%;" scope="col">Avaliação 02</th>
                            <th style="width:10%;" scope="col">Média</th>
                            <th style="width:20%;" class="text-center" scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            Hashtable<Integer, Aluno> tabela = null;
                            tabela = (Hashtable<Integer, Aluno>) getServletContext().getAttribute("tabela");
                            if (tabela != null) {
                                Set<Integer> listaCodigosAlunos = tabela.keySet();
                                for (Integer cod : listaCodigosAlunos) {
                                    Aluno aluno = tabela.get(cod);
                                    aluno.avaliacao1 = aluno.avaliacao1 == null ? aluno.avaliacao1 = 0.0f : aluno.avaliacao1;
                                    aluno.avaliacao2 = aluno.avaliacao2 == null ? aluno.avaliacao2 = 0.0f : aluno.avaliacao2;
                                    Float media = null;
                                    if (aluno.avaliacao1 > 0 || aluno.avaliacao2 > 0) {
                                        media = (aluno.avaliacao1 + aluno.avaliacao2) / 2;
                                    } else {
                                        media = 0.0f;
                                    }

                                    out.println("<tr>");
                                    out.println("<th class='align-middle' scope='row'>" + aluno.codAluno + "</td>");
                                    out.println("<td class='align-middle'>" + aluno.nomeAluno + "</td>");
                                    out.println("<td class='align-middle'>" + aluno.avaliacao1 + "</td>");
                                    out.println("<td class='align-middle'>" + aluno.avaliacao2 + "</td>");
                                    out.println("<td class='align-middle'>" + media + "</td>");
                                    out.println("<td class='align-middle btnacoes' ><a class='btn btn-warning' href=CadastroAlunoAlterar.jsp?codAluno=" + aluno.codAluno + ">Alterar</a>");
                                    out.print("<a class='btn btn-danger ml-1' href=CadastroAlunoExcluir.jsp?codAluno=" + aluno.codAluno + ">Excluir</a></td>");
                                    out.println("</tr>");

                                }

                            }
                        %>
                    </tbody>
                </table>
            </article>
        </section>
    </div>



</body>
</html>
