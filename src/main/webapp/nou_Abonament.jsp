<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga abonament</title>
        <link rel="stylesheet" href="nouTabela.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idAbonat, idCompanieTelefonie;
            String id1, id2, NumeAbonat, PrenumeAbonat, CNP, AdresaAbonat, NumeCompanieTelefonie, AdresaSediu, telefonCompanie, emailCompanie;
            id1 = request.getParameter("idAbonat");
            id2 = request.getParameter("idCompanieTelefonie");
            if (id1 != null) {
                jb.connect();
                jb.adaugaAbonament(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2));
                jb.disconnect();
        %>
        	<p>Datele au fost adaugate.</p><%
        } else {
	        jb.connect();
	        ResultSet rs1 = jb.vedeTabela("abonati");
	        ResultSet rs2 = jb.vedeTabela("companie_telefonie");
        %>
        <div class = "form-container">
        <br/>
        <h1> Suntem in tabela abonamente</h1>
        <br/>
        <form action="nou_Abonament.jsp" method="post">
            <table>
                <tr>
                    <td class = "box"> 
                        Selectati abonatul:
            <div>            
			<SELECT NAME="idAbonat">
                                <%
                                    while(rs1.next()){
                                        idAbonat= rs1.getInt("idAbonat");
                                        NumeAbonat = rs1.getString("nume");
                                        PrenumeAbonat = rs1.getString("prenume");
                                        CNP = rs1.getString("cnp");
                                        AdresaAbonat = rs1.getString("adresa");
                                %>
                                    <OPTION VALUE="<%= idAbonat%>"><%= idAbonat%>,<%= NumeAbonat%>,<%= PrenumeAbonat%>,<%= CNP%>,<%= AdresaAbonat%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
            </div>   
                    </td>
                </tr>
                <tr>
                    
                    <td class = "box"> 
                        Selectati compania de telefonie:
            <div >
			<SELECT NAME="idCompanieTelefonie">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idCompanieTelefonie = rs2.getInt("idCompanieTelefonie");
                                        NumeCompanieTelefonie = rs2.getString("nume");
                                        AdresaSediu = rs2.getString("adresaSediu");
                                        telefonCompanie = rs2.getString("telefonContact");
                                        emailCompanie = rs2.getString("emailContact");
                                %>
                                    <OPTION VALUE="<%= idCompanieTelefonie%>"><%= idCompanieTelefonie%>,<%= NumeCompanieTelefonie%>,<%= AdresaSediu%>,<%= telefonCompanie%>,<%= emailCompanie%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
			</div>
                   </td>  
            </table><br/>
            <input type="submit" value="Adauga abonamentul" class = "button"/>
        </form>
        <%
            }
        %>
        <br/>
        <p align="center"><a href="index.html" class = "button"><b>Home</b></a></p>
        <br/>
        </div>
    </body>
</html>
