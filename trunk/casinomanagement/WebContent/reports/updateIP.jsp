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

String ip = (String)request.getParameter("ip");


boolean error = false;
int id=-1;
try {
	id = Integer.parseInt((String)request.getParameter("id"));
}catch(Exception numEx){numEx.printStackTrace(); error=true;}
finally { if (error){response.sendRedirect("error.jsp");} }


if (id==-1){error=true;}
if (ip==null || ip.equals("")){error=true;}

if (!error){
	CallableStatement cs=null;
	Connection con=null;
	boolean success=false;
	try {
		Class.forName("org.postgresql.Driver").newInstance();
		String url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
		con = DriverManager.getConnection(url);
		
		String INSERT = "{? = call updateIP(?, ?)}";
		cs = con.prepareCall(INSERT);
	    cs.registerOutParameter(1, Types.BOOLEAN);
	    cs.setInt(2, id);
	    cs.setString(3, ip);
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
