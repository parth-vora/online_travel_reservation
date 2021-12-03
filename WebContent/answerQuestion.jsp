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
	String id = request.getParameter("ID");
	String field = request.getParameter("Field");
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	String str = "UPDATE question SET reply = '" + field + "', answered = 'Yes' WHERE questionId = '" + id + "'";
	//Run the query against the database.
	stmt.executeUpdate(str);
	out.print("Replied to message");
	con.close();
	
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>
