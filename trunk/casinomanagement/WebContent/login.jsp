<%
String u = (String)request.getParameter("username");
String p = (String)request.getParameter("password");
if( u != null && p != null ){
	out.println(u);
	out.println(p);
	response.sendRedirect("reports/index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Random Games Management System</title>
<link href="styles/mainstyles.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
	</div>
	<div id="menu">
		<ul id="main">
			<li class="current_page_item"><a href="index.jsp">Inicio</a></li>
			<li><a href="juegos.jsp">Juegos</a></li>
			<li><a href="contacto.jsp">Contacto</a></li>
			<li><a href="login.jsp">Login</a></li>
		</ul>
	</div>
</div>
<!-- end header -->
<div id="wrapper">
	<!-- start page -->
	<div id="page">
		<!-- start content -->
		<div id="content">
			<div class="post">
				<h1 class="title">Login</h1>
				<div class="entry">
					<form method="post" action="">
					<p>Usuario: <input type="text" name="username"/></p> 
					<p>Contraseña: <input type="password" name="password"/></p>
					<input type="submit" value="login">
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
</html>>