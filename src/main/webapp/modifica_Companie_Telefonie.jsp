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
    	<br/>
        <h1 align="center"> TABELA COMPANII TELEFONIE:</h1>
        <br/>
        <p align="center"><a href="nou_Companie_Telefonie.jsp" class = "button2"><b>Adauga companie telefonie</b></a> <a href="index.html" class = "button2"><b>Home</b></a></p>
        <form action="m1_Companie_Telefonie.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <th class = "checkbox"><b>Mark</b></th>
                    <th class = "id"><b>IdCompanieTelefonie</b></th>
                    <th><b>Nume</b></th>
                    <th><b>Adresa sediu</b></th>
                    <th><b>Telefon</b></th>
                    <th><b>E-mail</b></th>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("companie_telefonie");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idCompanieTelefonie");
                %>
                <tr>
                    <td class = "checkbox"><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td class = "id"><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("adresaSediu")%></td>
                    <td><%= rs.getString("telefonContact")%></td>
                    <td><%= rs.getString("emailContact")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia" class = "button">
            </p>
        </form>
        <%
    		jb.disconnect();
    	%>
    </body>
</html>
