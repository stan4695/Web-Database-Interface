<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Abonat</title>
        <link rel="stylesheet" href="vedeTabela.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idAbonat"));
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String cnp = request.getParameter("cnp");
            String adresa = request.getParameter("adresa");

            String[] valori = {nume, prenume, cnp, adresa};
            String[] campuri = {"nume", "prenume", "cnp", "adresa"};
            jb.modificaTabela("abonati", "idAbonat", aux, campuri, valori);
            jb.disconnect();
        %>
        <br/>
        <h1 align="center">
        	<br/>
	        Modificarile au fost efectuate cu succes!
	        <br/> <br/>
	        <a class = "button" href="index.html"><b>Home</b></a>
        </h1>
    </body>
</html>
