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

	
	String b = request.getParameter("idVal");
	String c = request.getParameter("first");
	String d = request.getParameter("last");
	String k = request.getParameter("class");
	String a = request.getParameter("depflightId");
	String e = request.getParameter("depFrom");
	String f = request.getParameter("depTo");
	String g = request.getParameter("depFlightNum");
	String h = request.getParameter("depDate");
	String i = request.getParameter("depTime");
	String j = request.getParameter("depPrice");
	
	String l = request.getParameter("retflightId");
	String m = request.getParameter("retFrom");
	String n = request.getParameter("retTo");
	String o = request.getParameter("retFlightNum");
	String p = request.getParameter("retDate");
	String q = request.getParameter("retTime");
	String r = request.getParameter("retPrice");
	
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	String insert = "INSERT INTO ticket(ticketId, fromAirport, toAirport,seatNumber,totalFare,flight_flightId,class,flightNumber,departureDate,departureTime,firstName,lastName,dateBooked,timeBooked,customerId,monthBooked)"
			+ "VALUES (?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
		String pattern = "dd-MM-yyyy";
		String dateInString =new SimpleDateFormat(pattern).format(new Date());
		
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("KKmm");
		String timeInString = format.format(date);
		

		String month = dateInString.substring(3,5);
		
		Random rand= new Random();
		
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
		
		String insert2 = "INSERT INTO ticket(ticketId, fromAirport, toAirport,seatNumber,totalFare,flight_flightId,class,flightNumber,departureDate,departureTime,firstName,lastName,dateBooked,timeBooked,customerId,monthBooked)"
				+ "VALUES (?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps2 = con.prepareStatement(insert);
			
			String pattern2 = "dd/MM/yyyy";
			String dateInString2 =new SimpleDateFormat(pattern2).format(new Date());
			
			Date date2 = new Date();
			DateFormat format2 = new SimpleDateFormat("KKmm");
			String timeInString2 = format.format(date);
			String month2 = dateInString2.substring(3,5);
			
			Random rand2= new Random();
			
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps2.setNull(1, Types.NULL);
			ps2.setString(2, m);
			ps2.setString(3, n);
			ps2.setString(4, Integer.toString(rand2.nextInt(50)));
			ps2.setString(5, Integer.toString(Integer.parseInt(r)+2));
			ps2.setString(6, l);
			ps2.setString(7, k);
			ps2.setString(8, o);
			ps2.setString(9, p);
			ps2.setString(10, q);
			ps2.setString(11, c);
			ps2.setString(12, d);
			ps2.setString(13, dateInString2 );
			ps2.setString(14, timeInString2);
			ps2.setString(15, b);
			ps2.setString(16, month2);
			//Run the query against the DB
			ps2.executeUpdate();
		
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
		
		ApplicationDB db3 = new ApplicationDB();	
		Connection con3 = db3.getConnection();	
		
		//Create a SQL statement
		Statement stmt3 = con3.createStatement();
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str3 = "UPDATE flight SET numberOfSeatsAvailable = numberOfSeatsAvailable -1 WHERE flightId = '" + l + "'";
		//Run the query against the database.
		stmt3.executeUpdate(str3);
		con2.close();
		con.close();
		con3.close();
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>
