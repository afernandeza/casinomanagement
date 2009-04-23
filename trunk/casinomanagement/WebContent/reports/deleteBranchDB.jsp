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
int id = Integer.parseInt((String)request.getParameter("selected"));

CallableStatement cs=null;
Connection con=null;
boolean success=false;
try {
	Class.forName("org.postgresql.Driver").newInstance();
	String url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
	con = DriverManager.getConnection(url);
	
	String INSERT = "{? = call deleteBranch(?)}";
	cs = con.prepareCall(INSERT);
    cs.registerOutParameter(1, Types.BOOLEAN);
    cs.setInt(2, id);
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
