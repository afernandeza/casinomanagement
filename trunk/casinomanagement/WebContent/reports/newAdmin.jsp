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

String name = (String)request.getParameter("name");
String pat = (String)request.getParameter("pat");
String mat = (String)request.getParameter("mat");
String user = (String)request.getParameter("user");
String pass = (String)request.getParameter("pass");
String pass2 = (String)request.getParameter("pass2");
String errorMSG = "";

boolean error = false;
if (name==null || name.equals("")){error = true;}
if (user==null || user.equals("")){error = true;}
if (pat==null || pat.equals("")){error = true;}
if (mat==null || mat.equals("")){error = true;}
if (pass==null || pass.equals("")){error = true;}
if (pass2==null || pass2.equals("")){error = true;}
if(!pass.equals(pass2)){error = true; errorMSG += "Contraseñas no iguales ";}


CallableStatement cs1=null;
Connection con1=null;
boolean exists=false;
try {
	Class.forName("org.postgresql.Driver").newInstance();
	String url1 = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
	con1 = DriverManager.getConnection(url1);
	
	String AUTH = "{ ? = call adminCheck( ? ) }";
	cs1 = con1.prepareCall(AUTH);
    cs1.registerOutParameter(1, Types.BOOLEAN);
    cs1.setString(2, user);

    cs1.execute();
    exists = cs1.getBoolean(1);
    if (exists){errorMSG +=" El usuario ya existe"; error=true;}
}
catch (Exception e){e.printStackTrace();}
finally{
	if (cs1!=null){cs1.close();}
	if (con1!=null){con1.close();}
}

if (!error){
	CallableStatement cs=null;
	Connection con=null;
	boolean success=false;
	try {
		Class.forName("org.postgresql.Driver").newInstance();
		String url = "jdbc:postgresql://localhost:5432/casino?user=postgres&password=";
		con = DriverManager.getConnection(url);
		
		String INSERT = "{? = call insertadmin(?, ?, ?, ?, ?)}";
		cs = con.prepareCall(INSERT);
	    cs.registerOutParameter(1, Types.BOOLEAN);
	    cs.setString(2, name);
	    cs.setString(3, pat);
	    cs.setString(4, mat);
	    cs.setString(5, user);
	    cs.setString(6, pass);
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
	response.sendRedirect("error.jsp?error="+errorMSG);
}
%>