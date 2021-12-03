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
			String entity = request.getParameter("month");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM ticket WHERE monthBooked = '" + entity + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

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

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>