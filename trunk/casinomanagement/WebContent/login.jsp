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
<link href="styles/mainstyles.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="800">
  <tr>
    <td><img src="media/banner.jpg" width="300" height="70" alt="rgms"></td>
  </tr>
  <tr>
    <td><table border="0">
  <tr>
    <td><a href="/casinomngmt/index.jsp"><img src="media/inicio.png" width="100" height="25" alt="Inicio"></a></td>
    <td><a href="juegos.jsp"><img src="media/juegos.png" width="100" height="25" alt="Juegos"></a></td>
    <td><a href="contacto.jsp"><img src="media/contacto.png" width="100" height="25" alt="contacto"></a></td>
    <td><a href="login.jsp"><img src="media/login.png" width="100" height="25" alt="Login"></a></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td>
    <form method="post" action="">
<table border="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>Usuario:</td>
    <td><input type="text" name="username"/></td>
  </tr>
  <tr>
    <td>Contrase&ntilde;a:</td>
    <td><input type="password" name="password" /></td>
  </tr>
  <tr>
  	<td class="center" colspan="2"><input type="submit" value="Entrar"/></td>
  </tr>
</table>
</form>
    </td>
  </tr>
  <tr>
  <td class="copyright">&nbsp;&nbsp;&copy;2008 RGMS S.A. de C.V.
  </td>
  </tr>
</table>
</body>
</html>