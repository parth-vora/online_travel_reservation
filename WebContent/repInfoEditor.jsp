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
			String entity = request.getParameter("edit");
			String entity2 = request.getParameter("val");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM " +entity+ " WHERE " + entity + "Id = " + entity2;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			if (entity.equals("flight")){
			//Make an HTML table to show the results in:
			out.print("<table>");

			out.print("<tr>");
			
			out.print("<td>");
			out.print("flightId");
			out.print("</td>");
			
			out.print("<td>");
			out.print("flightNumber");
			out.print("</td>");
			
			out.print("<td>");
			out.print("destinationAirport");
			out.print("</td>");
			
			out.print("<td>");
			out.print("departureAirport");
			out.print("</td>");
			
			out.print("<td>");
			out.print("numStops");
			out.print("</td>");
			
			out.print("<td>");
			out.print("numberOfSeatsAvaliable");
			out.print("</td>");
			
			out.print("<td>");
			out.print("departureDate");
			out.print("</td>");
			
			out.print("<td>");
			out.print("arrivalDate");
			out.print("</td>");
			
			out.print("<td>");
			out.print("departureTime");
			out.print("</td>");
			
			out.print("<td>");
			out.print("arrivalTime");
			out.print("</td>");
			
			out.print("<td>");
			out.print("timeInAir");
			out.print("</td>");
			
			out.print("<td>");
			out.print("airline_airportId");
			out.print("</td>");
			
			out.print("<td>");
			out.print("airport_airportId");
			out.print("</td>");
			
			out.print("<td>");
			out.print("aircraft_aircraftId");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				out.print("<tr>");
				
				
				out.print("<td>");
				out.print(result.getString("flightId"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("flightNumber"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("destinationAirport"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("departureAirport"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("numStops"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("numberOfSeatsAvailable"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("departureDate"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("arrivalDate"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("departureTime"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("arrivalTime"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("timeInAir"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("airline_airportId"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("airport_airportId"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("aircraft_aircraftId"));
				out.print("</td>");
				
				
				out.print("</tr>");

			}
			out.print("</table>");
			
		
					%> <form action="flightChange.jsp" >	
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
				<input type="submit" value="Submit Changes"  />
				</form>
				
				<%
			
			
			
			} else if (entity.equals("airport")) {
				out.print("<table>");

				out.print("<tr>");
				
				out.print("<td>");
				out.print("airportID");
				out.print("</td>");
				
				out.print("<td>");
				out.print("airportAbbr");
				out.print("</td>");
				
				out.print("<td>");
				out.print("airportFullName");
				out.print("</td>");
				
				out.print("</tr>");

				//parse out the results
				while (result.next()) {
					
					out.print("<tr>");
					
					out.print("<td>");
					out.print(result.getString("airportID"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("airportAbbr"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("airportFullName"));
					out.print("</td>");
					out.print("</tr>");

				}
				out.print("</table>");
				
				%> <form action="airportChange.jsp">	
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
				<input type="submit" value="Submit Changes"  />
				
				</form>
				
				<%
				
				
				
				
			} else if (entity.equals("aircraft")) {
				out.print("<table>");

				out.print("<tr>");
				
				out.print("<td>");
				out.print("aircraftId");
				out.print("</td>");
				
				out.print("<td>");
				out.print("aircraftName");
				out.print("</td>");
				
				out.print("<td>");
				out.print("operationDays");
				out.print("</td>");
				
				out.print("<td>");
				out.print("numOfSeats");
				out.print("</td>");
				
				out.print("</tr>");

				//parse out the results
				while (result.next()) {
					
					out.print("<tr>");
					
					out.print("<td>");
					out.print(result.getString("aircraftId"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("aircraftName"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("operationDays"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("numOfSeats"));
					out.print("</td>");
					
					out.print("</tr>");

				}
				out.print("</table>");
				
				
				%> <form  action="aircraftChange.jsp">	
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
				
				
				
			}

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print(e);
			out.print("Insert failed :()");
		}
	%>

</body>
</html>