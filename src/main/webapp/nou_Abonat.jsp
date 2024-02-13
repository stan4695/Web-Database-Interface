<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga abonat</title>
        <link rel="stylesheet" href="nouTabelaAbonatiCompanii.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String cnp = request.getParameter("cnp");
            String adresa = request.getParameter("adresa");
            if (nume != null) {
                jb.connect();
                jb.adaugaAbonat(nume, prenume, cnp, adresa);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <div class = "form-container">
        <h1>Completeaza datele abonatului:</h1>
        <form action="nou_Abonat.jsp" method="post">
            <table>
            	<tr>
            		<td>Nume abonat:</td>
            	</tr>
                <tr>
                    <td> <input type="text" name="nume" placeholder="Nume abonat" /></td>
                </tr>
                <tr>
            		<td>Prenume abonat:</td>
            	</tr>
                <tr>
                    <td> <input type="text" name="prenume" placeholder="Prenume abonat" /></td>
                </tr>
                <tr>
            		<td>CNP abonat:</td>
            	</tr>
                <tr>
                    <td> <input type="text" name="cnp" placeholder="CNP" /></td>
                </tr>
                <tr>
            		<td>Adresa abonat:</td>
            	</tr>
                <tr>
                    <td> <input type="text" name="adresa" placeholder="Adresa abonat" /></td>
                </tr>
            </table>
            <br/>
            <div class = "center-button">
            <input type="submit" value="Adauga abonatul" class = "button" />
        	</div>
        </form>
        <%
            }
        %>
        <br/>
        <div class = "center-button">
        <a href="index.html" class = "button">Home</a>
        </div>
        </div>
        <br/>
    </body>
</html>
