<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Abonamente</title>
        <link rel="stylesheet" href="vedeTabela.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idAbonament"));
            String idAbonat = request.getParameter("idAbonat");
            String idCompanieTelefonie = request.getParameter("idCompanieTelefonie");
            String[] valori = {idAbonat, idCompanieTelefonie};
            String[] campuri = {"idAbonat", "idCompanieTelefonie"};
            jb.modificaTabela("abonamente", "idAbonament", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">
        	<br/>
            Modificarile au fost efectuate cu succes!
            <br/> <br/>
            <a class = "button" href="index.html"><b>Home</b></a>
    	</h1>
    </body>
</html>
