<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Abonati</title>
        <link rel="stylesheet" href="vedeTabela.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    	<br/>
        <h1 align="center"> TABELA ABONATI:</h1>
        <br/>
        <p align="center" class="button-group"><a href="nou_Abonat.jsp" class="button2"><b>Adauga abonat</b></a> <a href="index.html" class="button2"><b>Home</b></a></p>
        <form action="sterge_Abonat.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <th class="checkbox"><b>Mark</b></th>
                    <th class = "id"><b>IdAbonat</b></th>
                    <th><b>Nume</b></th>
                    <th><b>Prenume</b></th>
                    <th><b>CNP</b></th>
					<th><b>Adresa</b></th>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("abonati");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idAbonat");
                %>
                <tr>
                    <td class="checkbox"><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td class = "id"><%= x%></td>
                    <td><%= rs.getString("nume"/*Numele atributelor exact ca in tabela*/)%></td>
                    <td><%= rs.getString("prenume")%></td>
                    <td><%= rs.getString("cnp")%></td>
                    <td><%= rs.getString("adresa")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate" class="button">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        
    </body>
</html>
