<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
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
			String a = request.getParameter("flightID");
			String b = request.getParameter("flightNum");
			String c = request.getParameter("destinationAirport");
			String d = request.getParameter("deperatureAirport");
			String e= request.getParameter("numStops");
			String f = request.getParameter("numberOfSeats");
			String g= request.getParameter("departureDate");
			String h = request.getParameter("arrivalDate");
			String i= request.getParameter("departureTime");
			String j = request.getParameter("arrivalTime");
			String k = request.getParameter("timeInAir");
			String l = request.getParameter("airlineID");
			String m = request.getParameter("airportID");
			String n = request.getParameter("aircraftID");
			String o = request.getParameter("month");
			String p = request.getParameter("year");
			String q = request.getParameter("price");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		
			String insert = "INSERT INTO flight(flightId, flightNumber, destinationAirport, departureAirport, numStops, numberOfSeatsAvailable, departureDate, arrivalDate,departureTime,arrivalTime,timeInAir,airline_airportId,airport_airportId,aircraft_aircraftId,month,year, price)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, a);
			ps.setString(2, b);
			ps.setString(3, c);
			ps.setString(4, d);
			ps.setString(5, e);
			ps.setInt(6, Integer.parseInt(f));
			ps.setString(7, g);
			ps.setString(8, h);
			ps.setString(9, i);
			ps.setString(10, j);
			ps.setString(11, k);
			ps.setInt(12, Integer.parseInt(l));
			ps.setInt(13, Integer.parseInt(m));
			ps.setInt(14, Integer.parseInt(n));
			ps.setString(15, o);
			ps.setString(16, p);
			ps.setInt(17, Integer.parseInt(q));
			ps.executeUpdate();
			out.print("New Flight Added.");
						//close the connection.
			con.close();

		} catch (Exception e) {
			out.print(e);
			out.print("Insert failed :()");
		}
	%>

</body>
</html>