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
			String a = request.getParameter("airportID");
			String b = request.getParameter("airportAbbr");
			String c = request.getParameter("airportFullName");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			//String str = "INSERT INTO airport VALUES ( "+ a +"," + b+"," +c+")";
			//Run the query against the database.
			
			
			String insert = "INSERT INTO airport(airportID, airportAbbr, airportFullName)"
				+ "VALUES (?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setInt(1, Integer.parseInt(a));
			ps.setString(2, b);
			ps.setString(3, c);
			//Run the query against the DB
			ps.executeUpdate();
			
			//stmt.executeUpdate(str);
			
			out.print("New Airport Added.");
			con.close();

		} catch (Exception e) {
			out.print(e);
			out.print("Insert failed :()");
		}
	%>

</body>
</html>