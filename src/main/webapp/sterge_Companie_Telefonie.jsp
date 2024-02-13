<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Companii Telefonie</title>
        <link rel="stylesheet" href="vedeTabela.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String[] s = request.getParameterValues("primarykey");
            if (s != null) {	
        		jb.connect();
            	jb.stergeDateTabela(s, "companie_telefonie", "idCompanieTelefonie");
            	jb.disconnect();
        %>
	        <h1 align = "center">
	            <br/>
	            Compania de telefonie a fost stearsa!
	            <br/> <br/>
	            <a class = "button" href="index.html"><b>Home</b></a>
	        </h1>
        <%}else{%>
        	<h1 align = "center">
        		<br/>
        		Nu s-a putut efectua stergerea! Selecteaza o companie!
        		<br/> <br/>
	            <a class = "button" href="index.html"><b>Home</b></a>
	        </h1>
	 	<%}%>
    </body>
</html>
