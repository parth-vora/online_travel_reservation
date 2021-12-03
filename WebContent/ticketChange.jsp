<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<body>
<%
	try{
	
	ApplicationDB db2 = new ApplicationDB();	
	
	Connection con2 = db2.getConnection();	
	
	//Create a SQL statement
	Statement stmt2 = con2.createStatement();
	//Get the combobox from the index.jsp
	String id = request.getParameter("ID");
	String field = request.getParameter("Field");
	String change = request.getParameter("Change");
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	String str2 = "UPDATE ticket SET " + field + " = '" + change + "' WHERE ticketId = '" + id + "'";
	//Run the query against the database.
	stmt2.executeUpdate(str2);
	out.print("Aircraft changed");
	con2.close();
	
	} catch (Exception e) {
		out.print(e);
	}
%>
</body>
</html>
