<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<body>
<%
try {
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the combobox from the index.jsp
	String role = request.getParameter("type");
	String id = request.getParameter("ID");
	String field = request.getParameter("Field");
	String change = request.getParameter("Change");
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	String str = "UPDATE " + role + " SET " + field + " = '" + change + "' WHERE " + role +"id " +" = '" + id + "'";
	//Run the query against the database.
	stmt.executeUpdate(str);
	out.print("User changed");
	con.close();
	
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>
