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
						<li><a href="addIP.jsp">Agregar direccion IP</a></li>
						<li><a href="editIP.jsp">Editar direccion IP</a></li>
						<li><a href="deleteIP.jsp">Borrar direccion IP</a></li>
						<li><a href="adminAdd.jsp">Agregar Administrador</a></li>
						<li><a href="adminUpdate.jsp">Editar Contrase&ntilde;a de Administrador</a></li>
						<li><a href="adminDelete.jsp">Borrar Administrador</a></li>
					</ul>
				</li>
				<li>
					<h2>Reportes</h2>
					<ul>
						<li><a href="clientstats.jsp">Clientes por sucursal</a></li>
						<li><a href="mesasInfo.jsp">Informaci&oacute;n de Mesas de juego</a></li>
						<li><a href="gamesperemployee.jsp">Ganancias de Mesas</a></li>
						<li><a href="branchemployees.jsp">Empleados por sucursal</a></li>
						<li><a href="branchresults.jsp">Ganancias a nivel sucursal</a></li>
					</ul>
				</li>
				<li>
					<h2>Opciones de usuario</h2>
					<ul>
						<li><a href="sync.jsp">Sincronizar usuarios</a></li>
						<li><a href="logout.jsp">Cerrar Sesi&oacute;n</a></li>
					</ul>
				</li>
		</div>
		<!-- start content -->
		<div id="content">
			<div class="post">
				<h1 class="title">Editar sucursal</h1>
				<div class="entry">
					<form action="updateAdmin.jsp" method="post">
					<table border="0">
					  <tr>
					    <td>Contrase&ntilde;a:</td>
					    <td><input type="password" name="pass" id="pass" /></td>
					  </tr>
					   <tr>
					    <td>Repita Contrase&ntilde;a:</td>
					    <td><input type="password" name="pass2" id="pass2" /></td>
					    <input type="hidden" name="id" value="<%out.print(id);%>" />
					  </tr>
					  
					  <tr>
					  <td colspan="2" class="left"><input name="newIP" type="submit" value="Continuar"></td>
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