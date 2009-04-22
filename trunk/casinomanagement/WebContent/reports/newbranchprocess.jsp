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

String name = (String)request.getParameter("branchname");
String street = (String)request.getParameter("street");
String numint = (String)request.getParameter("numint");
String colonia = (String)request.getParameter("colonia");
String CP = (String)request.getParameter("CP");
String municipio = (String)request.getParameter("municipio");
String estado = (String)request.getParameter("estado");
String pais = (String)request.getParameter("country");

CallableStatement cs=null;
Connection con=null;
boolean success=false;
try {
	Class.forName("org.postgresql.Driver").newInstance();
	String url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
	con = DriverManager.getConnection(url);
	
	String INSERT = "{? = call insertbranch(?, ?, ?, ?, ?, ?, ?,?)}";
	cs = con.prepareCall(INSERT);
    cs.registerOutParameter(1, Types.BOOLEAN);
    cs.setString(2, name);
    cs.setString(3, street);
    cs.setString(4, numint);
    cs.setString(5, colonia);
    cs.setString(6, municipio);
    cs.setString(7, CP);
    cs.setString(8, estado);
    cs.setString(9, pais);
    cs.execute();
    success = cs.getBoolean(1);
}
catch (Exception e){e.printStackTrace();}
finally{
	if (cs!=null){cs.close();}
	if (con!=null){con.close();}
	if(!success){response.sendRedirect("error.jsp");}
}
if (success){
	response.sendRedirect("success.jsp");
}

%>
