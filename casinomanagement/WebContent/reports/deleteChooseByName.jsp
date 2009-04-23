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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RGMS - Reports</title>
    <SCRIPT LANGUAGE="JavaScript" SRC="calendar.js"></SCRIPT>
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
				<h1 class="title">Borrar sucursal.</h1>
				<div class="entry">
					Seleccione La sucursal a borrar:
					<br><br>
					<form name="form1" method="post" action="deleteBranchDB.jsp">
					<table border="1">
					  <tr>
					    <td>&nbsp;</td>
					    <td><b>Sucursal</b></td>
					    <td><b>Direcci&oacute;n</b></td>
					  </tr>
					  <%
					  String nombre = request.getParameter("nombre");
					  if (nombre==null){nombre="";}
					  String Query = "select * FROM searchBranchByName(?)";
					  PreparedStatement pstmt = null;
						Connection con=null;
						ResultSet rs = null;
						int cont=0;
						try {
							Class.forName("org.postgresql.Driver").newInstance();
							String url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
							con = DriverManager.getConnection(url);
							pstmt = con.prepareCall(Query);
					        pstmt.setString(1, "%"+nombre+"%");
					        rs = pstmt.executeQuery();
					        while (rs.next()){
					        	out.println("<tr><td> <input type=\"radio\" name=\"selected\" value=\""+rs.getInt("sucursalid")+"\"></td>");
					        	out.println("<td>"+rs.getString("nombre")+"</td>");
					        	out.println("<td>"+rs.getString("callenum")+" "+rs.getString("colonia")+" "+rs.getString("codigopostal")+
					        				"<br>"+rs.getString("municipio")+", "+rs.getString("estado")+", "+rs.getString("pais")+"</td>");
					        }
						}
						catch (Exception e){e.printStackTrace();}
						finally{
							if (pstmt!=null){pstmt.close();}
							if (con!=null){con.close();}
							if (rs!=null){rs.close();}
						}
						%>
					</table>
					<input name="continue" type="submit" value="Continuar">
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
			