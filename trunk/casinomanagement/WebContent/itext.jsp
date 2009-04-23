<%@
page import="java.io.*,
			 java.awt.Color,
			 com.lowagie.text.*,
			 com.lowagie.text.pdf.*"
%><%
//
// Template JSP file for iText
// by Tal Liron
//

response.setContentType( "application/pdf" );

// step 1: creation of a document-object
Document document = new Document(PageSize.A4, 50, 50, 100, 72);

// step 2:
// we create a writer that listens to the document
// and directs a PDF-stream to a temporary buffer

ByteArrayOutputStream buffer = new ByteArrayOutputStream();
PdfWriter.getInstance( document, buffer );

// step 3: we open the document
document.open();

// step 4: we add a paragraph to the document
Image logo = Image.getInstance("webapps/WebContent/media/random games logo.jpg");;
PdfPTable table = new PdfPTable(2);
table.getDefaultCell().setBorderWidth(0);
table.addCell(logo);
Paragraph p = new Paragraph ("Reporte");
table.addCell(p);

document.add(table);

// step 5: we close the document
document.close();

// step 6: we output the writer as bytes to the response output
DataOutput output = new DataOutputStream( response.getOutputStream() );
byte[] bytes = buffer.toByteArray();
response.setContentLength(bytes.length);
for( int i = 0; i < bytes.length; i++ ) { output.writeByte( bytes[i] ); }
%>