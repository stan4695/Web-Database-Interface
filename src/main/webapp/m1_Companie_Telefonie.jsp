<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Companii Telefonie</title>
        <link rel="stylesheet" href="nouTabelaAbonatiCompanii.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
       	String s = request.getParameter("primarykey");
       	if (s != null) {
            jb.connect();
            int aux = java.lang.Integer.parseInt(s);
            ResultSet rs = jb.intoarceLinieDupaId("companie_telefonie", "idCompanieTelefonie", aux);
            rs.first();
            String nume = rs.getString("nume");
            String adresaSediu = rs.getString("adresaSediu");
            String telefonContact = rs.getString("telefonContact");
            String emailContact = rs.getString("emailContact");
            rs.close();
            jb.disconnect();
        %>
	        <div class = "form-container">
		        <h1 align="center">TABELA COMPANIE TELEFONIE</h1>
		        <form action="m2_Companie_Telefonie.jsp" method="post">
		            <table align="center">
		            	<tr>
		            		<td>ID companie telefonie:</td>
		            	</tr>
		                <tr>                    
		                    <td> <input type="text" name="idCompanieTelefonie" value="<%= aux%>" readonly/></td>
		                </tr>
		                <tr>
		                	<td>Nume companie telefonie:</td>
		                </tr>
		                <tr>
		                    
		                    <td> <input type="text" name="nume" placeholder = "Denumire companie" value="<%= nume%>"/></td>
		                </tr>
		                <tr>
		                 	<td>Adresa sediu companie telefonie:</td>
		                </tr>
		                <tr>                   
		                    <td> <input type="text" name="adresaSediu" placeholder = "Adresa sediu" value="<%= adresaSediu%>"/></td>
		                </tr>
		                <tr>
		                	<td>Telefon contact companie telefonie:</td>
		                </tr>
		                <tr>                    
		                    <td> <input type="text" name="telefonContact" placeholder = "Telefon" value="<%= telefonContact%>"/></td>
		                </tr>
		                <tr>
		                	<td>E-mail contact companie telefonie:</td>
		                </tr>
		                <tr>                    
		                    <td> <input type="text" name="emailContact" placeholder = "E-mail" value="<%= emailContact%>"/></td>
		                </tr>
		            </table>
		            <br/>
		            <div class = "center-button">
		                <input type="submit" value="Modifica linia" class = "button">
		            </div>
		        </form>
	        	<br/>
	        	<div class = "center-button">
	            	<a href="index.html" class = "button"><b>Home</b></a>
	     		</div>
	        </div>    
        <%}else{%>
        	<br/>
        	<h1>
        		Nu s-a putut efectua modificarea! Selectează o companie!
        	</h1>
        	<br/> <br/>
        	<div class = "center-button">
            	<a href="index.html" class = "button"><b>Home</b></a>
            </div>
     	<%}%>
    </body>
</html>
