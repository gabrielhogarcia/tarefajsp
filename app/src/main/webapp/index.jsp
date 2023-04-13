<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import= "java.util.Hashtable"%>

<%
    Hashtable tarefas;
    //tarefas.put(1, "Exemplo");
    //tarefas.put(2, "Teste");

    if(session.getAttribute("tarefas") instanceof Hashtable){
        tarefas = (Hashtable) session.getAttribute("tarefas");
    } else{
        tarefas = new Hashtable<Integer , String>();
    }

    if(request.getMethod().equals("POST")){
        tarefas.put(tarefas.size() + 1, request.getParameter("tarefa"));
    }

    session.setAttribute("tarefas" , tarefas);
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Bem Vindo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
    <body>
        <h1>Form</h1>
        <form action="index.jsp" method="post">
            <input class="form_control" type="text" name="tarefa" />
            <button class="btn btn_primary" type="submit">Salvar</button>
        </form>
        <hr>
        <ul>
            <c:forEach var="t" items="${tarefas}">
                <li>${t.value}</li>
            </c:forEach>
        </ul>
    </body>
</html>