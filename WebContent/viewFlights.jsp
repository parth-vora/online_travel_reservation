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
			String entity = request.getParameter("airportCode");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM flight WHERE destinationAirport = '" + entity + "' or  departureAirport = '" + entity +"'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print("Flight Selection Number");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Flight ID");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Flight Number");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Destination Airport");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Departure Airport");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Number of Stops");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Departure Date");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Arrival Date");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Departure Time");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Arrival Time");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Time In Air");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Price");
				out.print("</td>");
				
				out.print("</tr>");

				//parse out the results
				int X=0;
				while (result.next()) {
					X+=1;
					
					out.print("<tr>");
					
					out.print("<td>");
					out.print(X);
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("flightID"));
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
					out.print(result.getString("price"));
					out.print("</td>");
					
					out.print("</tr>");
				}	
				out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>