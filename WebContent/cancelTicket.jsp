<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<body>
<%
	try{
	
		//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();	
				
				//Create a SQL statement
				Statement stmt = con.createStatement();
				//Get the combobox from the index.jsp
				String entity = request.getParameter("ID");
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				String str = "DELETE FROM ticket WHERE ticketId = '" + entity + "' and class != 'economy' ";
				//Run the query against the database.
				stmt.execute(str);
				
				ApplicationDB db2 = new ApplicationDB();	
				Connection con2 = db2.getConnection();	
				
				//Create a SQL statement
				Statement stmt2 = con2.createStatement();
				String str2 = "UPDATE ticket SET totalFare = '30', class='deleted' WHERE ticketId = '" + entity + "' and class = 'economy'";
				stmt2.executeUpdate(str2);
				
				
				con2.close();
				
				ApplicationDB db4 = new ApplicationDB();	
				Connection con4 = db4.getConnection();	
				
				//Create a SQL statement
				Statement stmt4 = con4.createStatement();
				String str4 = "SELECT flight_flightId from ticket WHERE ticketId = '" + entity + "'";
				ResultSet result = stmt4.executeQuery(str4);
				
				
				String flightId = "";
				while (result.next()){
					flightId = result.getString("flight_flightId");
					break;
				}
				
		
		out.print("Value deleted!");
		
		ApplicationDB db3 = new ApplicationDB();	
		Connection con3 = db3.getConnection();	
		
		//Create a SQL statement
		Statement stmt3 = con3.createStatement();
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str3 = "UPDATE flight SET numberOfSeatsAvailable = numberOfSeatsAvailable +1 WHERE flightId = '" + flightId + "'";
		//Run the query against the database.
		stmt3.executeUpdate(str3);
		con4.close();
		con.close();
	
	} catch (Exception e) {
		out.print(e);
	}
%>
</body>
</html>
