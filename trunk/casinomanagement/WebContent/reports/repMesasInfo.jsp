<%@
page import="java.io.*,
			 java.awt.Color,
			 com.lowagie.text.*,
			 com.lowagie.text.pdf.*,
			 java.sql.*;"
%><%

String sucursal = request.getParameter("sucursales");
String ipaddr="";
String errorMSG="";
boolean error = false;
if (sucursal==null || sucursal.equals("")){ error = true; }


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
	
	document.add(new Paragraph("Reporte de mesas de juego para la sucursal: "+ sucursal+"\n"));
	document.add(new Paragraph("\n"));
	PdfPTable table2 = new PdfPTable(2);
	table2.getDefaultCell().setBorderWidth(1);
	PdfPCell cell;
	cell = new PdfPCell(new Paragraph("ID de mesa", FontFactory.getFont(FontFactory.HELVETICA, 14)));
	cell.setGrayFill(0.75f);
	table2.addCell(cell);
	cell = new PdfPCell(new Paragraph("Tipo de Juego", FontFactory.getFont(FontFactory.HELVETICA, 14)));
	cell.setGrayFill(0.75f);
	table2.addCell(cell);

	
	
	query="SELECT * FROM mesasinfo";
	Connection con2=null;
	ResultSet rs2=null;
	try {
		Class.forName("org.postgresql.Driver").newInstance();
		String url = "jdbc:postgresql://"+ipaddr+":5432/casinolocal?user=casinomngmtapp&password=casinomngmtapp";
		con2 = DriverManager.getConnection(url);
		rs2=  con2.createStatement().executeQuery(query);
		while (rs2.next()){
			table2.addCell(new Paragraph(String.valueOf(rs2.getInt(1))));
			table2.addCell(new Paragraph(rs2.getString(2)));
		}
	}
	catch (Exception e){e.printStackTrace();}
	finally{
		if (rs2!=null){rs2.close();}
		if (con2!=null){con2.close();}
	}
	
	
	document.add(table2);
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