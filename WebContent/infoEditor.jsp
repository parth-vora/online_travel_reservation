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
	String id = request.getParameter("role");
	String val = request.getParameter("val");
	out.print(id);
	if (id.equals("customer")){
		
		String str = "SELECT * FROM customer WHERE email = '" + val + "'";
		ResultSet result = stmt.executeQuery(str);
		
		//Make an HTML table to show the results in:
		out.print("<table>");

		out.print("<tr>");
		
		out.print("<td>");
		out.print("customerId");
		out.print("</td>");
		
		out.print("<td>");
		out.print("email");
		out.print("</td>");
		
		out.print("<td>");
		out.print("firstName");
		out.print("</td>");
		
		out.print("<td>");
		out.print("lastName");
		out.print("</td>");
		
		out.print("</tr>");

		while (result.next()) {
			out.print("<tr>");
			
			out.print("<td>");
			out.print(result.getString("customerId"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("email"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("firstName"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("lastName"));
			out.print("</td>");
			
			out.print("</tr>");

		}
		out.print("</table>");

	} else {
		
		String str = "SELECT * FROM customerrep WHERE email = '" + val + "'";
		ResultSet result = stmt.executeQuery(str);
		
		///Make an HTML table to show the results in:
		out.print("<table>");

		out.print("<tr>");
		
		out.print("<td>");
		out.print("customerRepId");
		out.print("</td>");
		
		out.print("<td>");
		out.print("email");
		out.print("</td>");
		
		out.print("<td>");
		out.print("firstName");
		out.print("</td>");
		
		out.print("<td>");
		out.print("lastName");
		out.print("</td>");
		
		out.print("</tr>");

		while (result.next()) {
			out.print("<tr>");
			
			out.print("<td>");
			out.print(result.getString("customerRepId"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("email"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("firstName"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("lastName"));
			out.print("</td>");
			
			out.print("</tr>");

		}
		out.print("</table>");
		
	}
	
	%> <form  action="userChange.jsp">	
	<br>
	<br>
	<br>
	Pick using ID value, the entry would you like to edit. 
	<br>
	Enter ID, field name (exactly as written above) and value you would like to change it to.
	<br>
	<br>
	<input type="hidden" name="type" value=<%=id%>>
	ID: <br>
	<input type="text" name="ID"> <br>
	<br>
	Field Name: <br>
	<input type="text" name="Field"> <br>
	<br>
	Value to change to: <br>
	<input type="text" name="Change"> <br>
	<br>
	<input type="submit" value="Submit Changes" />
	</form>
	
	<%
	
	
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>
