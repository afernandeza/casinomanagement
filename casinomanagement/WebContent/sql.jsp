<%@ page import = "java.sql.*;"%>
<html>
<head><title>prueba</title></head>
<body>
<p>resultados:</p>
<%
try {
			Class.forName("org.postgresql.Driver").newInstance();
			String url = "jdbc:postgresql://localhost:5432/mydb?user=root&password=genorexfly";
			Connection con = DriverManager.getConnection(url);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM test");
			while (rs.next()){
				out.println(rs.getString(1) + " " + rs.getString(2));
			}
		}
		catch (Exception e){e.printStackTrace();}
%>

</body>
</html>