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
String id = (String)request.getParameter("id");
boolean error = false;




if (id==null || id.equals("")){error=true;}
if (name==null || name.equals("")){error=true;}
if (street==null || street.equals("")){error=true;}
if (numint==null || numint.equals("")){error=true;}
if (colonia==null || colonia.equals("")){error=true;}
if (CP==null || CP.equals("")){error=true;}
if (municipio==null || municipio.equals("")){error=true;}
if (estado==null || estado.equals("")){error=true;}
if (pais==null || pais.equals("")){error=true;}

if (!error){
	CallableStatement cs=null;
	Connection con=null;
	boolean success=false;
	try {
		Class.forName("org.postgresql.Driver").newInstance();
		String url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
		con = DriverManager.getConnection(url);
		
		String INSERT = "{? = call updateBranch(?, ?, ?, ?, ?, ?, ?, ?,?)}";
		cs = con.prepareCall(INSERT);
	    cs.registerOutParameter(1, Types.BOOLEAN);
	    cs.setString(2, id);
	    cs.setString(3, name);
	    cs.setString(4, street);
	    cs.setString(5, numint);
	    cs.setString(6, colonia);
	    cs.setString(7, municipio);
	    cs.setString(8, CP);
	    cs.setString(9, estado);
	    cs.setString(10, pais);
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
}
else {
	response.sendRedirect("error.jsp");
}
%>
