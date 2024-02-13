<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Modifica abonament</title>
		<link rel="stylesheet" href="nouTabela.css">
	</head>
	<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
	<jsp:setProperty name="jb" property="*" />
	<body>
		<%
       	String s = request.getParameter("primarykey");
       	if (s != null) {
        	jb.connect();
        	String NumeAbonat, PrenumeAbonat, CNP, AdresaAbonat, NumeCompanieTelefonie, AdresaSediu, telefonCompanie, emailCompanie;				
            int aux = java.lang.Integer.parseInt(s);
            ResultSet rs = jb.intoarceConsultatieId(aux);
            rs.first();
            int id1 = rs.getInt("idAbonat_abonament");
            int id2 = rs.getInt("idCompanieTelefonie_abonament");

            NumeAbonat = rs.getString("NumeAbonat");
            PrenumeAbonat = rs.getString("PrenumeAbonat");
            CNP = rs.getString("CNP");
            AdresaAbonat = rs.getString("AdresaAbonat");
            NumeCompanieTelefonie = rs.getString("NumeCompanieTelefonie");
            AdresaSediu = rs.getString("AdresaSediu");
            telefonCompanie = rs.getString("telefonCompanie");
            emailCompanie = rs.getString("emailCompanie");            

            ResultSet rs1 = jb.vedeTabela("abonati");
            ResultSet rs2 = jb.vedeTabela("companie_telefonie");
            int idAbonat, idCompanieTelefonie;
		%>
			<div class="form-container">
				<br />
				<h1 align="center">TABELA ABONAMENTE</h1>
				<br />
				<form action="m2_Abonament.jsp" method="post">
					<table align="center">
						<tr>
							<td>ID abonament</td>
						</tr>
						<tr>
							<td><input type="text" name="idAbonament" class = "input-box" value="<%= aux%>" readonly /></td>
						</tr>
						<tr>
							<td>Selectati abonatul:</td>
						</tr>
						<tr>
							<td class="box">
								<div>
									<SELECT NAME="idAbonat">
										<%
		                                while (rs1.next()) {
		                                    idAbonat = rs1.getInt("idAbonat");
		                                    NumeAbonat = rs1.getString("nume");
		                                    PrenumeAbonat = rs1.getString("prenume");
		                                    CNP = rs1.getString("cnp");
		                                    AdresaAbonat = rs1.getString("adresa");
		                                    	if (idAbonat != id1) {
		                            	%>
													<OPTION VALUE="<%= idAbonat%>"><%= idAbonat%>,
														<%= NumeAbonat%>,
														<%= PrenumeAbonat%>,
														<%= CNP%> ,<%= AdresaAbonat%></OPTION>
										<%
		                                        } else {
		                                %>
													<OPTION selected="yes" VALUE="<%= idAbonat%>"><%= idAbonat%>,
														<%= NumeAbonat%>,
														<%= PrenumeAbonat%>,
														<%= CNP%>,
														<%= AdresaAbonat%></OPTION>
										<%
		                                      	}
		                              	}
		                                %>
									</SELECT>
								</div>
							</td>
						</tr>
						<tr>
							<td>Selectati compania de telefonie:</td>
						</tr>
						<tr>
							<td class="box">
								<div>
									<SELECT NAME="idCompanieTelefonie">
										<%
		                                while (rs2.next()) {
		                                    idCompanieTelefonie = rs2.getInt("idCompanieTelefonie");
		                                    NumeCompanieTelefonie = rs2.getString("nume");
		                                    AdresaSediu = rs2.getString("adresaSediu");
		                                    telefonCompanie = rs2.getString("telefonContact");
		                                    emailCompanie = rs2.getString("emailContact");
		                            if (idCompanieTelefonie != id2) {
		                            %>
										<OPTION VALUE="<%= idCompanieTelefonie%>"><%= idCompanieTelefonie%>,
											<%= NumeCompanieTelefonie%>,
											<%= AdresaSediu%>,
											<%= telefonCompanie%>,
											<%= emailCompanie%></OPTION>
										<%
		                                        } else {
		                                %>
										<OPTION selected="yes" VALUE="<%= idCompanieTelefonie%>"><%= idCompanieTelefonie%>,
											<%= NumeCompanieTelefonie%>,
											<%= AdresaSediu%>,
											<%= telefonCompanie%>,
											<%= emailCompanie%></OPTION>
										<%
		                                        }
		                                    }
		                                %>
									</SELECT>
								</div>
							</td>
						</tr>
					</table>
					<br/>
					<div class="center-button">
						<input type="submit" value="Modifica linia" class="button" />
					</div>
				</form>
			</div>
		<br/>
		<p align="center">
			<a href="index.html" class="button"><b>Home</b></a>
		</p>
		<%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
		%>
		<%}else{%>
			<h1 align="center">
				<br/>
				Nu s-a putut efectua modificarea! Selectează un abonament!
				<br/> <br/>
				<a class = "button" href="index.html"><b>Home</b></a>
			</h1>
		<%}%>
		<br/>
	</body>
</html>
