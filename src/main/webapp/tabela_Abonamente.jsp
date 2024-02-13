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
    	<br/>
        <h1 align="center">TABELA ABONAMENTE:</h1>
        <br/>
        <p align="center"><a href="nou_Abonament.jsp" class = "button2"><b>Adauga abonament</b></a> <a href="index.html" class = "button2"><b>Home</b></a></p>
        <form action="sterge_Abonament.jsp" method="post">
            <table align="center">
                <tr>
                    <th class = "checkbox"><b>Mark</b></th>
                    <th class = "id"><b>IdAbonament</b></th>
                    <th class = "id"><b>IdAbonat</b></th>
                    <th><b>NumeAbonat</b></th>
                    <th><b>PrenumeAbonat</b></th>
                    <th><b>CNP</b></th>
                    <th><b>AdresaAbonat</b></th>
                    <th class = "id"><b>IdCompanieTelefonie</b></th>
                    <th><b>NumeCompanieTelefonie</b></th>
                    <th><b>AdresaSediu</b></th>
                    <th><b>telefonCompanie</b></th>
                    <th><b>emailCompanie</b></th>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeAbonamente();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idAbonament");
                %>
                <tr>
                    <td class = "checkbox"><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td class = "id"><%= x%></td>
                    <td class = "id"><%= rs.getInt("idAbonat_abonament")%></td>
                    <td><%= rs.getString("NumeAbonat")%></td>
                    <td><%= rs.getString("PrenumeAbonat")%></td>
                    <td><%= rs.getString("CNP")%></td>
                    <td><%= rs.getString("AdresaAbonat")%></td>
                    <td class = "id"><%= rs.getInt("idCompanieTelefonie_abonament")%></td>
                    <td><%= rs.getString("NumeCompanieTelefonie")%></td>
                    <td><%= rs.getString("AdresaSediu")%></td>
                    <td><%= rs.getString("telefonCompanie")%></td>
                    <td><%= rs.getString("emailCompanie")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate" class = "button">
            </p>
        </form>
        <%
        	rs.close();
            jb.disconnect();
        %>
    </body>
</html>
