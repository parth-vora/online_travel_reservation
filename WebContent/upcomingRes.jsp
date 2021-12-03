<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<body>
<%
	try{
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		
		String pattern = "dd/MM/yyyy";
		Date today =  new Date();
		String dateInString = new SimpleDateFormat(pattern).format(new Date());
		
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the index.jsp
		String entity = request.getParameter("id");
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM ticket WHERE customerId = '" + entity + "'";
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
			
			Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(result.getString("departureDate"));
			
			if (date1.after(today)|| date1.equals(today)) { //changed smth here
				
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

		}
		out.print("</table>");

		%> <form  action="cancelTicket.jsp">	
		<br>
		<br>
		<br>
		Pick using ID value, the entry would you like to cancel. 
		<br>
		<br>
		ID: <br>
		<input type="text" name="ID"> <br>
		<br>
		<input type="submit" value="Submit Changes" />
		</form>
		
		<%
		
		con.close();
	
	} catch (Exception e) {
		out.print(e);
	}
%>
</body>
</html>
