<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<script type="text/javascript">
var xmlhttp = false;
try {
	xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
	try {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
		xmlhttp = false;
		}
}

if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
		xmlhttp = new XMLHttpRequest();
}


function makerequest(serverPage, objID) {
	var obj = document.getElementById(objID);
	xmlhttp.open("GET", serverPage);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			obj.innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.send(null);
}
//-->
</script>
<link href="../styles/mainstyles.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body onload="makerequest ('inicio.html','content')">>
<!-- start header -->
<div id="header">
	<div id="logo">
	</div>
	<div id="menu">
		<ul id="main">
			<li class="current_page_item"><a href="index.jsp">Sistema de administraci&oacute;n</a></li>
			<li><a href="../login.jsp">Cerrar sesi&oacute;n</a></li>
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
						<li><a href="#" onclick="makerequest('newbranch.jsp','content'); return false;">Agregar nueva sucursal</a></li>
						<li><a href="#" onclick="makerequest('editbranch.jsp','content'); return false;">Editar informaci&oacute;n de sucursales</a></li>
						<li><a href="#" onclick="makerequest('deletebranch.jsp','content'); return false;">Borrar una sucursal</a></li>
						<li><a href="#" onclick="makerequest('searchbranch.jsp','content'); return false;">Buscar sucursales por &aacute;rea</a></li>
					</ul>
				</li>
				<li>
					<h2>Reportes</h2>
					<ul>
						<li><a href="#" onclick="makerequest('clientstats.jsp','content'); return false;">Actividad de clientes por sucursal</a></li>
						<li><a href="#" onclick="makerequest('gamesperemployee.jsp','content'); return false;">Resultado de mesas de juego por empleado</a></li>
						<li><a href="#" onclick="makerequest('branchresults.jsp','content'); return false;">Resultados a nivel sucursal</a></li>
						<li><a href="#" onclick="makerequest('totalresults.jsp','content'); return false;">Resultados a nivel cadena</a></li>
					</ul>
				</li>
				<li>
					<h2>Opciones de usuario</h2>
					<ul>
						<li><a href="../login.jsp">Cerrar Sesi&oacute;n</a></li>
					</ul>
				</li>
		</div>
		<!-- start content -->
		<div id="content">
			
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