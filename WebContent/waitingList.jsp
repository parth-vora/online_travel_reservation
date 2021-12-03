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
	String departure = request.getParameter("depFlightId");
	String returning = request.getParameter("retFlightId");
	String customerId = request.getParameter("idVal");
	
	if (returning==null && departure!=null){
		
		String insert = "INSERT INTO waiting(customerId,flightId)"
				+ "VALUES (?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, customerId);
		ps.setString(2, departure);
		
		//Run the query against the DB
		ps.executeUpdate();
		
		//stmt.executeUpdate(str);
		
	} else if (returning !=null && departure!=null){
		String insert = "INSERT INTO waiting(customerId,flightId)"
				+ "VALUES (?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, customerId);
		ps.setString(2, returning);
		
		//Run the query against the DB
		ps.executeUpdate();
	}
	
	out.print("Flight(s) added to waiting list");
	con.close();
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>
