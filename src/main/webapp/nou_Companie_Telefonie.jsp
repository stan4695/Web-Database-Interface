<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Companie Telefonie</title>
        <link rel="stylesheet" href="nouTabelaAbonatiCompanii.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String nume = request.getParameter("nume");
            String adresaSediu = request.getParameter("adresaSediu");
            String telefonContact = request.getParameter("telefonContact");
            String emailContact = request.getParameter("emailContact");
            if (nume != null) {
                jb.connect();
                jb.adaugaCompanieTelefonie(nume, adresaSediu, telefonContact, emailContact);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <div class = "form-container">
        <h1>Completeaza datele companiei de telefonie:</h1>
        <form action="nou_Companie_Telefonie.jsp" method="post">
            <table>
            	<tr>
            		<td>Nume companie telefonie:</td>
            	</tr>
                <tr>
                    
                    <td> <input type="text" name="nume" placeholder = "Denumire companie" /></td>
                </tr>
                <tr>
                	<td>Adresa sediu companie telefonie:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="adresaSediu" placeholder = "Adresa sediu" /></td>
                </tr>
                <tr>
                	<td>Telefon contact companie telefonie:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="telefonContact" placeholder = "Telefon" /></td>
                </tr>
                <tr>
                	<td>E-mail contact companie telefonie:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="emailContact" placeholder = "E-mail" /></td>
                </tr>
            </table>
            <br/>
            <div class = "center-button">
            	<input type="submit" value="Adauga compania" class = "button"/>
        	</div>
        </form>
        <%
            }
        %>
        <br/>
        <div class = "center-button">
        	<a href="index.html" class = button><b>Home</b></a>
        </div>
        <br/>
        </div>
    </body>
</html>
