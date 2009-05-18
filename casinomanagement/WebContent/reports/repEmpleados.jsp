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
boolean error = false;
if (sucursal==null || sucursal.equals("")){ error = true; }
if (date1==null || date1.equals("")){ error = true; }
if (date2==null || date2.equals("")){ error = true; }

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
	
	document.add(new Paragraph("Reporte de clientes para la sucursal: "+ sucursal +"\nPeriodo entre:" + date1 + " y " + date2+"\n\n"));
	PdfPTable table2 = new PdfPTable(3);
	table2.getDefaultCell().setBorderWidth(1);
	table2.addCell(new Paragraph("ID"));
	table2.addCell(new Paragraph("Nombre"));
	table2.addCell(new Paragraph("Cantidad"));
	
	
	String query="SELECT * FROM repempleados";
	Connection con=null;
	ResultSet rs=null;
	try {
		Class.forName("org.postgresql.Driver").newInstance();
		String url = "jdbc:postgresql://10.0.1.58:5432/casinolocal?user=casinomngmtapp&password=casinomngmtapp";
		con = DriverManager.getConnection(url);
		rs=  con.createStatement().executeQuery(query);
		String nombre, fecha_reg;
		int credito;
		while (rs.next()){
			table2.addCell(new Paragraph(rs.getString(1)));
			table2.addCell(new Paragraph(rs.getString(2)+" " +rs.getString(3)+" "+rs.getString(4)));
			table2.addCell(new Paragraph(String.valueOf(rs.getInt(5))));
		}
	}
	catch (Exception e){e.printStackTrace();}
	finally{
		if (rs!=null){rs.close();}
		if (con!=null){con.close();}
	}
	
	
	document.add(table2);
	document.close();
	
	DataOutput output = new DataOutputStream( response.getOutputStream() );
	byte[] bytes = buffer.toByteArray();
	response.setContentLength(bytes.length);
	for( int i = 0; i < bytes.length; i++ ) { output.writeByte( bytes[i] ); }
}
else {
	response.sendRedirect("error.jsp");
}
%>