<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../styles/mainstyles.css" rel="stylesheet" type="text/css">
<title>RGMS - Reports</title>
<SCRIPT LANGUAGE="JavaScript">
function popup(URL, width, height) {
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width="+width+",height="+ height +",left = 490,top = 200');");
}
</script>
</head>
<body>
<img src="../media/banner.jpg" /><br/><br/>
<p>Seleccione qu&eacute; operaci&oacute;n desea realizar:</p>
<table>
  <tr>
  <td colspan="2">Administraci&oacute;n de sucursales</td>
  </tr>
  <tr>
    <td rowspan="4" width="20px"></td>
    <td><a href="javascript:popup('newbranch.jsp', 410, 300);" >Agregar nueva sucursal</a></td>
  </tr>
  <tr>
    <td><a href="javascript:popup('editbranch.jsp', 410, 350);">Editar informaci&oacute;n de sucursales</a></td>
  </tr>
  <tr>
    <td><a href="javascript:popup('deletebranch.jsp', 450, 350);">Borrar una sucursal</a></td>
  </tr>
  <tr>
    <td><a href="javascript:popup('searchbranch.jsp', 410, 350);">Buscar sucursales por &aacute;rea</a></td>
  </tr>
  <tr>
  <td colspan="2">Reportes</td>
  </tr>
  <tr>
    <td rowspan="4"></td>
    <td><a href="clientstats.jsp">Actividad de clientes por sucursal</a></td>
  </tr>
  <tr>
    <td><a href="gamesperemployee.jsp">Resultado de mesas de juego por empleado</a></td>
  </tr>
  <tr>
    <td><a href="branchresults.jsp">Resultados a nivel sucursal</a></td>
  </tr>
  <tr>
    <td><a href="totalresults.jsp">Resultados a nivel cadena</a></td>
  </tr>
  <tr>
  <td colspan="2"><a href="../login.jsp">Cerrar sesi&oacute;n</a></td>
  </tr>
</table>
</body>
</html>