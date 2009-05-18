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

String pass = (String)request.getParameter("pass");
String pass2 = (String)request.getParameter("pass2");

boolean error = false;
int id =-1;
try {
	id = Integer.parseInt((String)request.getParameter("id"));
}
catch (Exception e){e.printStackTrace(); error=true;}





if (id==-1){error=true;}
if (pass==null || pass.equals("")){error=true;}
if (pass2==null || pass2.equals("")){error=true;}
if (!pass.equals(pass2)){error=true;}




if (!error){
	CallableStatement cs=null;
	Connection con=null;
	boolean success=false;
	try {
		Class.forName("org.postgresql.Driver").newInstance();
		String url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
		con = DriverManager.getConnection(url);
		String query= "select sync from adminuser where usuarioid='"+id+"'";
		ResultSet rs=  con.createStatement().executeQuery(query);
		rs.next();
		String sync= rs.getString("sync");
		String change="n";
		if (sync.equals("n")){
			change="n";
		}
		else if (sync.equals("e")){
			change="e";
		}
		else if (sync.equals("c")){
			change="e";
		}
		else if (sync.equals("b")){
			change="b";
		}
		else {
			change="e";
		}
		String INSERT = "{? = call updateadmin(?, ?, ?)}";
		cs = con.prepareCall(INSERT);
	    cs.registerOutParameter(1, Types.BOOLEAN);
	    cs.setInt(2, id);
	    cs.setString(3, pass);
	    cs.setString(4, change);
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
