<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<body>
<%
try {
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();

	String a = request.getParameter("depflightId");
	String b = request.getParameter("idVal");
	String c = request.getParameter("first");
	String d = request.getParameter("last");
	String e = request.getParameter("depFrom");
	String f = request.getParameter("depTo");
	String g = request.getParameter("depFlightNum");
	String h = request.getParameter("depDate");
	String i = request.getParameter("depTime");
	String j = request.getParameter("depPrice");
	String k = request.getParameter("class");
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	String insert = "INSERT INTO ticket(ticketId, fromAirport, toAirport,seatNumber,totalFare,flight_flightId,class,flightNumber,departureDate,departureTime,firstName,lastName,dateBooked,timeBooked,customerId,monthBooked)"
			+ "VALUES (?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
		String pattern = "dd/MM/yyyy";
		String dateInString =new SimpleDateFormat(pattern).format(new Date());
		
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("KKmm");
		String timeInString = format.format(date);
		
		Random rand= new Random();

		String month = dateInString.substring(3,5);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setNull(1, Types.NULL);
		ps.setString(2, e);
		ps.setString(3, f);
		ps.setString(4, Integer.toString(rand.nextInt(50)));
		ps.setString(5, Integer.toString(Integer.parseInt(j)+2));
		ps.setString(6, a);
		ps.setString(7, k);
		ps.setString(8, g);
		ps.setString(9, h);
		ps.setString(10, i);
		ps.setString(11, c);
		ps.setString(12, d);
		ps.setString(13, dateInString );
		ps.setString(14, timeInString);
		ps.setString(15, b);
		ps.setString(16, month);
		//Run the query against the DB
		ps.executeUpdate();
		
		//stmt.executeUpdate(str);
		
		out.print("New Ticket Booked.");
		
		ApplicationDB db2 = new ApplicationDB();	
		Connection con2 = db2.getConnection();	
		
		//Create a SQL statement
		Statement stmt2 = con2.createStatement();
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str2 = "UPDATE flight SET numberOfSeatsAvailable = numberOfSeatsAvailable -1 WHERE flightId = '" + a + "'";
		//Run the query against the database.
		stmt2.executeUpdate(str2);
		con2.close();
		
		con.close();
	
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>
