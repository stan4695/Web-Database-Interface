<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica abonat</title>
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
	            ResultSet rs = jb.intoarceLinieDupaId("abonati", "idAbonat", aux);
	            rs.first();
	            String nume = rs.getString("nume");
	            String prenume = rs.getString("prenume");
	            String cnp = rs.getString("cnp");
	            String adresa = rs.getString("adresa");
	            rs.close();
	            jb.disconnect();
	        %>
		        <div class = "form-container">
		        	<h1 align="center">Tabela Abonati:</h1>
		        	<form action="m2_Abonat.jsp" method="post">
			            <table align="center">
			            	<tr>
			            		<td>ID abonat:</td>
			            	</tr>
			                <tr>
			                    <td> <input type="text" name="idAbonat" value="<%= aux%>" readonly/></td>
			                </tr>
			                <tr>
			                	<td>Nume abonat:</td>
			                </tr>
			                <tr>
			                    <td> <input type="text" name="nume" placeholder = "Nume abonat" value="<%= nume%>"/></td>
			                </tr>
			                <tr>
			                	<td>Prenume abonat:</td>
			                </tr>
			                <tr>
			                    <td> <input type="text" name="prenume" placeholder = "Prenume abonat" value="<%= prenume%>"/></td>
			                </tr>
			                <tr>
			                	<td>CNP abonat:</td>
			                </tr>
			                <tr>
			                    <td> <input type="text" name="cnp" placeholder = "CNP abonat" value="<%= cnp%>"/></td>
			                </tr>
			                <tr>
			                	<td>Adresa abonat:</td>
			                </tr>
			                <tr>
			                    <td> <input type="text" name="adresa" placeholder = "Adresa abonat" value="<%= adresa%>"/></td>
			                </tr>
			            </table>
		            	<br/>
		            	<div class = "center-button">
		                	<input type="submit" value="Modifica linia" class = "button" />
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
        			Nu s-a putut efectua modificarea! Selectează un abonat!
        		</h1>
        		<br/> <br/>
        		<div class = "center-button">
            		<a href="index.html" class = "button"><b>Home</b></a>
            	</div>
            <%}%>    
    </body>
</html>
