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

int id = Integer.parseInt((String)request.getParameter("selected"));
String Query = "select * FROM getBranch(?)";
PreparedStatement pstmt = null;
Connection con=null;
ResultSet rs = null;
String name = "";
String street = "";
String number = "";
String suburb = "";
String CP = "";
String town = "";
String state = "";
String country = "";
String url = "";
try {
	Class.forName("org.postgresql.Driver").newInstance();
	url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
	con = DriverManager.getConnection(url);
	pstmt = con.prepareCall(Query);
    pstmt.setInt(1, id);
    rs = pstmt.executeQuery();
    if(!rs.next()){
    	response.sendRedirect("error.jsp");
    }
    name = rs.getString("nombre");
    street = rs.getString("callenum");
    number = rs.getString("numint");
    suburb = rs.getString("colonia");
    CP = rs.getString("codigopostal");
    town = rs.getString("municipio");
    state = rs.getString("estado");
    country = rs.getString("pais");
}
catch (Exception e){e.printStackTrace();}
finally{
	if (pstmt!=null){pstmt.close();}
	if (con!=null){con.close();}
	if (rs!=null){rs.close();}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RGMS - Reports</title>
    <SCRIPT LANGUAGE="JavaScript" SRC="calendar.js"></SCRIPT>
    <SCRIPT LANGUAGE="JavaScript">
		var cal = new CalendarPopup("testdiv1");
		cal.showNavigationDropdowns();
    </SCRIPT>
    <SCRIPT LANGUAGE="JavaScript">document.write(getCalendarStyles());</SCRIPT>
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
				<h1 class="title">Editar sucursal</h1>
				<div class="entry">
					<form action="updatebranch.jsp" method="post">
					<table border="0">
					  <tr>
					    <td>Nombre de sucursal:</td>
					    <td><input type="text" name="branchname" id="branchname" <%out.print( "value=\""+name+"\"");%>/></td>
					  </tr>
					  <tr>
					    <td>Calle y n&uacute;mero:</td>
					    <td><input type="text" name="street" id="street" <%out.print( "value=\""+street+"\"");%>/></td>
					  </tr>
					  <tr>
					    <td>N&uacute;mero interior:</td>
					    <td><input type="text" name="numint" id="numint" <%out.print( "value=\""+number+"\"");%>/></td>
					  </tr>
					  <tr>
					    <td>Colonia:</td>
					    <td><input type="text" name="colonia" id="colonia" <%out.print( "value=\""+suburb+"\"");%>/></td>
					  </tr>
					    <tr>
					    <td>C&oacute;digo postal:</td>
					    <td><input type="text" name="CP" id="CP"  <%out.print( "value=\""+CP+"\"");%>/></td>
					  </tr>
					  <tr>
					    <td>Municipio o delegaci&oacute;n:</td>
					    <td><input type="text" name="municipio" id="municipio" <%out.print( "value=\""+town+"\"");%>/></td>
					  </tr>
					  <tr>
					    <td>Estado:</td>
					    <td><input type="text" name="estado" id="estado" <%out.print( "value=\""+state+"\"");%> /></td>
					  </tr>
					  <tr>
					    <td>Pa&iacute;s:</td>
					    <td><select name="country">
					<option value="">Seleccionar...</option>
					<%
					        Query="SELECT * FROM country;";
							con=null;
							rs=null;
							try {
								Class.forName("org.postgresql.Driver").newInstance();
								url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
								con = DriverManager.getConnection(url);
								rs=  con.createStatement().executeQuery(Query);
								String iso,qcountry;
								while (rs.next()){
									iso = rs.getString(1);
									qcountry = rs.getString(3);
									if (iso.equals(country)){
										iso = iso + "\" selected=\"selected";
									}
									out.println("<option value=\""+iso+"\">"+qcountry+"</option>");
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
					  <td colspan="2" class="left"><input name="newbranch" type="submit" value="Agregar sucursal"></td>
					  </tr>
					</table>
					<input type="hidden" name="id" value="<%out.print(id);%>"/>
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