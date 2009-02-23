<html>
  <head>
    <title>Crear Reporte de Actividad de Clientes Por Sucursal</title>
      <SCRIPT LANGUAGE="JavaScript" SRC="calendar.js"></SCRIPT>
      <SCRIPT LANGUAGE="JavaScript">
	var cal = new CalendarPopup("testdiv1");
	cal.showNavigationDropdowns();
      </SCRIPT>
      <link href="../styles/mainstyles.css" rel="stylesheet" type="text/css">
      <SCRIPT LANGUAGE="JavaScript">document.write(getCalendarStyles());</SCRIPT>
  </head>

  <body>
    <h2>Actividad de Clientes Por Sucursal</h2>
    <p>Elija las siguientes opciones para generar el reporte: </p>
    <FORM NAME="opciones" action="" method="post">
      <p>Elegir Sucursal: 
      <select name="sucursales">

	<option value="1">Sucursal 1</option>
	<option value="2">Sucursal 2</option>
	<option value="3">Sucursal 3</option>
	<option value="4">Sucursal 4</option>
      </select>
      </p>
      <p> Fecha de inicio para el reporte: 
      <INPUT TYPE="text" NAME="date1" VALUE="" SIZE=25 readonly="readonly"></INPUT>

      <A HREF="#" onClick="cal.select(document.forms['opciones'].date1,'anchor1','MM/dd/yyyy'); return false;" NAME="anchor1" ID="anchor1"><img src="calendar.png" border="0" height="30" weight="30"></A>
      </p>

      <p> Fecha de t&eacute;rmino para el reporte: 
      <INPUT TYPE="text" NAME="date2" VALUE="" SIZE=25 readonly="readonly"></INPUT>
      <A HREF="#" onClick="cal.select(document.forms['opciones'].date2,'anchor2','MM/dd/yyyy'); return false;" NAME="anchor1" ID="anchor2"><img src="calendar.png" border="0" height="30" weight="30"></A>
      </p>
      <input type="submit" name="submit" value="Generar Reporte"></input>
</FORM>

<DIV ID="testdiv1" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>


  </body>
</html>