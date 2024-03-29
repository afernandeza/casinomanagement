<%@
page import="java.io.*,
			 java.awt.Color,
			 com.lowagie.text.*,
			 com.lowagie.text.pdf.*,
			 java.sql.*;"
%><%

String sucursal = request.getParameter("sucursales");
String date1 = request.getParameter("date1");
String date2 = request.getParameter("date2");
String ipaddr="";
String errorMSG="";
boolean error = false;

if (sucursal==null || sucursal.equals("")){ error = true; }
if (date1==null || date1.equals("")){ error = true; }
if (date2==null || date2.equals("")){ error = true; }


String query="SELECT ip FROM ipaddr WHERE sucursalid = '"+sucursal+"'";
Connection con=null;
ResultSet rs=null;
try {
	Class.forName("org.postgresql.Driver").newInstance();
	String url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
	con = DriverManager.getConnection(url);
	rs=  con.createStatement().executeQuery(query);
	if (rs.next()){
		ipaddr=rs.getString("ip");
	}
	else{
		error=true;
		errorMSG += "No hay direccion ip para la sucursal";
	}
}
catch (Exception e){e.printStackTrace(); error=true;}
finally{
	if (rs!=null){rs.close();}
	if (con!=null){con.close();}
}

if (!error){
	response.setContentType( "application/pdf" );
	
	
	Document document = new Document(PageSize.A4, 50, 50, 100, 72);
	
	
	ByteArrayOutputStream buffer = new ByteArrayOutputStream();
	PdfWriter.getInstance( document, buffer );
	
	document.open();
	
	Image logo = Image.getInstance("webapps/WebContent/media/random games logo.jpg");;
	PdfPTable table = new PdfPTable(2);
	table.getDefaultCell().setBorderWidth(0);
	table.addCell(logo);
	Paragraph p = new Paragraph ("Sistema de reportes");
	table.addCell(p);
	
	document.add(table);
	
	document.add(new Paragraph("Reporte de ganancias para la sucursal: "+ sucursal+"\n"));
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("Total de ganancias de la fecha: "+ date1+" al "+date2+":", FontFactory.getFont(FontFactory.HELVETICA, 14)));


	
	
	query="SELECT * FROM repsesiones('"+date1+"', '"+date2+"')";
	Connection con2=null;
	ResultSet rs2=null;
	try {
		Class.forName("org.postgresql.Driver").newInstance();
		String url = "jdbc:postgresql://"+ipaddr+":5432/casinolocal?user=casinomngmtapp&password=casinomngmtapp";
		con2 = DriverManager.getConnection(url);
		rs2=  con2.createStatement().executeQuery(query);
		while (rs2.next()){
			document.add(new Paragraph("$"+String.valueOf(rs2.getInt(1)), FontFactory.getFont(FontFactory.HELVETICA, 14)));
		}
	}
	catch (Exception e){e.printStackTrace();}
	finally{
		if (rs2!=null){rs2.close();}
		if (con2!=null){con2.close();}
	}
	document.close();
	
	DataOutput output = new DataOutputStream( response.getOutputStream() );
	byte[] bytes = buffer.toByteArray();
	response.setContentLength(bytes.length);
	for( int i = 0; i < bytes.length; i++ ) { output.writeByte( bytes[i] ); }
}
else {
	response.sendRedirect("error.jsp?error="+errorMSG);
}
%>