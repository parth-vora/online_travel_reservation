<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String entity = request.getParameter("email");
			String entity2 = request.getParameter("ticketId");
			
			ApplicationDB db2 = new ApplicationDB();	
			Connection con2 = db2.getConnection();	
			
			//Create a SQL statement
			Statement stmt2 = con2.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str2 = "SELECT c.customerId FROM customer AS c WHERE c.email = '" + entity +"'";
			//Run the query against the database.
			ResultSet result2 = stmt2.executeQuery(str2);
			String id = "";
			while(result2.next()){
				id = result2.getString("customerId");
				break;
			}
			
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM ticket WHERE customerId = '" + id + "' and ticketId = '" +entity2 +"'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			
			out.print("<tr>");
			
			out.print("<td>");
			out.print("ticketId");
			out.print("</td>");
			
			out.print("<td>");
			out.print("fromAirport");
			out.print("</td>");
			
			out.print("<td>");
			out.print("toAirport");
			out.print("</td>");
			
			out.print("<td>");
			out.print("seatNumber");
			out.print("</td>");
			
			out.print("<td>");
			out.print("totalFare");
			out.print("</td>");
			
			out.print("<td>");
			out.print("flight ID");
			out.print("</td>");
			
			out.print("<td>");
			out.print("class");
			out.print("</td>");
			
			out.print("<td>");
			out.print("flightNumber");
			out.print("</td>");
			
			out.print("<td>");
			out.print("departureDate");
			out.print("</td>");
			
			out.print("<td>");
			out.print("departureTime");
			out.print("</td>");
			
			out.print("<td>");
			out.print("firstName");
			out.print("</td>");
			
			out.print("<td>");
			out.print("lastName");
			out.print("</td>");
			
			out.print("<td>");
			out.print("dateBooked");
			out.print("</td>");
			
			out.print("<td>");
			out.print("timeBooked");
			out.print("</td>");
			
			out.print("<td>");
			out.print("customerId");
			out.print("</td>");
			
			out.print("</tr>");

			while (result.next()) {
				
				out.print("<tr>");
				
				out.print("<td>");
				out.print(result.getString("ticketId"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("fromAirport"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("toAirport"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("seatNumber"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("totalFare"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("flight_flightId"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("class"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("flightNumber"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("departureDate"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("departureTime"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("firstName"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("lastName"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("dateBooked"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("timeBooked"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("customerId"));
				out.print("</td>");
				
				out.print("</tr>");
				
				}
			
			out.print("</table>");
			
				%> <form  action="ticketChange.jsp">	
				<br>
				<br>
				<br>
				Pick using ID value, the entry would you like to edit. 
				<br>
				Enter ID, field name (exactly as written above) and value you would like to change it to.
				<br>
				<br>
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
			

			//close the connection.
			con.close();
			con2.close();

		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>