<%@ page import = "java.sql.*;"%>
<%
session = request.getSession(false);
if (session==null){
	response.sendRedirect("../login.jsp");
}
String auth= (String)session.getAttribute("authenticated");
if (auth==null){
	response.sendRedirect("../login.jsp");
}
else{
	if (!auth.equals("true")){
		response.sendRedirect("../login.jsp");
	}
}

boolean enable_state = false;
boolean enable_town = false;
boolean enable_suburb = false;
String query=null;
Connection con=null;
ResultSet rs=null;
String url=null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RGMS - Reports</title>
    <SCRIPT LANGUAGE="JavaScript" SRC="calendar.js"></SCRIPT>
    <SCRIPT LANGUAGE="JavaScript">
		function change_country(country){
			window.location = "searchbranch.jsp?country="+country;
		}
		function change_state(state){
			window.location = "searchbranch.jsp?country="+document.forma_edicion.country.options[document.forma_edicion.country.selectedIndex].value+"&state="+state;
		}
		function change_town(town){
			window.location = "searchbranch.jsp?country="+document.forma_edicion.country.options[document.forma_edicion.country.selectedIndex].value+"&state="+document.forma_edicion.state.options[document.forma_edicion.state.selectedIndex].value+"&town="+town;
		}
    </SCRIPT>
<link href="../styles/mainstyles.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
	</div>
	<div id="menu">
		<ul id="main">
			<li class="current_page_item"><a href="index.jsp">Sistema de administraci&oacute;n</a></li>
			<li><a href="logout.jsp">Cerrar sesi&oacute;n</a></li>
		</ul>
	</div>
</div>
<!-- end header -->
<div id="wrapper">
	<!-- start page -->
	<div id="page">
		<div id="sidebar1" class="sidebar">
			<ul>
				<li>
					<h2>Administraci&oacute;n</h2>
					<ul>
						<li><a href="newbranch.jsp">Agregar nueva sucursal</a></li>
						<li><a href="editbranch.jsp">Editar informaci&oacute;n de sucursales</a></li>
						<li><a href="deletebranch.jsp">Borrar una sucursal</a></li>
						<li><a href="searchbranch.jsp">Buscar sucursales por &aacute;rea</a></li>
					</ul>
				</li>
				<li>
					<h2>Reportes</h2>
					<ul>
						<li><a href="clientstats.jsp">Actividad de clientes por sucursal</a></li>
						<li><a href="gamesperemployee.jsp">Resultado de mesas de juego por empleado</a></li>
						<li><a href="branchresults.jsp">Resultados a nivel sucursal</a></li>
						<li><a href="totalresults.jsp">Resultados a nivel cadena</a></li>
					</ul>
				</li>
				<li>
					<h2>Opciones de usuario</h2>
					<ul>
						<li><a href="logout.jsp">Cerrar Sesi&oacute;n</a></li>
					</ul>
				</li>
		</div>
		<!-- start content -->
		<div id="content">
			<div class="post">
				<h1 class="title">Buscar sucursal.</h1>
				<div class="entry">
					Seleccione una regi&oacute;n en donde se buscar&aacute;n sucursales:
					<br><br>
					<form name="forma_edicion" action="searchChoose.jsp" method="post">
					<table border="0">
					  <tr>
					    <td>Pa&iacute;s:</td>
					    <td><select name="country" onchange="change_country(this.value)">
					      <option value="">Seleccionar...</option>
					      <%
					      
					      	String selected_country = (String)request.getParameter("country");
					      	if (selected_country==null||selected_country.trim().equals("")){
					      		selected_country=null;
					      	}
					      	else {
					      		enable_state=true;
					      	}
					      	query="SELECT * FROM country;";
							con=null;
							rs=null;
							try {
								Class.forName("org.postgresql.Driver").newInstance();
								url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
								con = DriverManager.getConnection(url);
								rs=  con.createStatement().executeQuery(query);
								String iso,country;
								while (rs.next()){
									iso = rs.getString(1);
									country = rs.getString(3);
									if (iso.equals(selected_country)){
										iso = iso + "\" selected=\"selected";
									}
									out.println("<option value=\""+iso+"\">"+country+"</option>");
								}
							}
							catch (Exception e){e.printStackTrace();}
							finally{
								if (rs!=null){rs.close();}
								if (con!=null){con.close();}
							}
						  %>
					    </select></td>
					  </tr>
					  <tr>
					    <td>Estado:</td>
					    <td><select type="text" name="state" id="state" <% if (!enable_state){ out.print("disabled=\"disabled\"");} %> onchange="change_state(this.value)">
					    	<option value="">Seleccionar...</option> 
					    		<%
					      
						      	String selected_state = (String)request.getParameter("state");
						      	if (selected_state==null||selected_state.trim().equals("")){
						      		selected_state=null;
						      	}
						      	else {
						      		enable_town=true;
						      	}
						      	if(enable_state){
							      	query="SELECT DISTINCT estado FROM direcciones WHERE pais = '"+selected_country+"';";
									con=null;
									rs=null;
									try {
										Class.forName("org.postgresql.Driver").newInstance();
										url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
										con = DriverManager.getConnection(url);
										rs=  con.createStatement().executeQuery(query);
										String state_value, state;
										while (rs.next()){
											state = rs.getString(1);
											state_value=state;
											if (state.equals(selected_state)){
												state_value = state + "\" selected=\"selected";
											}
											out.println("<option value=\""+state_value+"\">"+state+"</option>");
										}
									}
									catch (Exception e){e.printStackTrace();}
									finally{
										if (rs!=null){rs.close();}
										if (con!=null){con.close();}
									}
								}
							  %>
					    	</select></td>
					  </tr>
					  <tr>
					    <td>Municipio o delegaci&oacute;n:</td>
					    <td><select type="text" name="town" id="town" <% if (!enable_town){ out.print("disabled=\"disabled\"");} %> onchange="change_town(this.value)"> 
					    <option value="">Seleccionar...</option>
					    	<%
					      
						      	String selected_town = (String)request.getParameter("town");
						      	if (selected_town==null||selected_town.trim().equals("")){
						      		selected_town=null;
						      	}
						      	else {
						      		enable_suburb=true;
						      	}
						      	if(enable_town){
							      	query="SELECT DISTINCT municipio FROM direcciones WHERE pais='"+selected_country+"' AND estado ='"+selected_state+"';";
									con=null;
									rs=null;
									try {
										Class.forName("org.postgresql.Driver").newInstance();
										url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
										con = DriverManager.getConnection(url);
										rs=  con.createStatement().executeQuery(query);
										String town_value, town;
										while (rs.next()){
											town = rs.getString(1);
											town_value=town;
											if (town.equals(selected_town)){
												town_value = town + "\" selected=\"selected";
											}
											out.println("<option value=\""+town_value+"\">"+town+"</option>");
										}
									}
									catch (Exception e){e.printStackTrace();}
									finally{
										if (rs!=null){rs.close();}
										if (con!=null){con.close();}
									}
								}
							  %>
					    </select></td>
					  </tr>
					  <tr>
					    <td>Colonia:</td>
					    <td><select type="text" name="suburb" id="suburb" <% if (!enable_suburb){ out.print("disabled=\"disabled\"");} %>>
					    <option value="">Seleccionar...</option>
					    	<%
					      
						      	String selected_suburb = (String)request.getParameter("suburb");
						      	if (selected_suburb==null||selected_suburb.trim().equals("")){
						      		selected_suburb=null;
						      	}
						      	if(enable_suburb){
							      	query="SELECT DISTINCT colonia FROM direcciones WHERE pais='"+selected_country+"' AND estado ='"+selected_state+"' AND municipio ='"+selected_town+"';";
									con=null;
									rs=null;
									try {
										Class.forName("org.postgresql.Driver").newInstance();
										url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
										con = DriverManager.getConnection(url);
										rs=  con.createStatement().executeQuery(query);
										String suburb_value, suburb;
										while (rs.next()){
											suburb = rs.getString(1);
											suburb_value=suburb;
											if (suburb.equals(selected_suburb)){
												suburb_value = suburb + "\" selected=\"selected";
											}
											out.println("<option value=\""+suburb_value+"\">"+suburb+"</option>");
										}
									}
									catch (Exception e){e.printStackTrace();}
									finally{
										if (rs!=null){rs.close();}
										if (con!=null){con.close();}
									}
								}
							  %>
					    </select></td>
					  </tr>
					  <tr>
					    <td colspan="3" class="left"><input name="submit" type="submit" value="Buscar sucursales"></td>
					  </tr>
					</table>
					</form>
					<br><br>
					<h2>Buscar sucursal por nombre.</h2>
					<form name="byName" action="searchChooseByName.jsp" method="post">
						<input type="text" name="nombre">
						<input type="submit" value="Buscar">
					</form>
				</div>
			</div>
			</div>
		<!-- end content -->
				<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
<div id="footer">
	<p class="copyright">&nbsp;&nbsp;&copy;2008 RGMS S.A. de C.V.</p>
</div>
</body>
</html>
			