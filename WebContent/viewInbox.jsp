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
			Statement stmt = con.createStatement();
			String entity = request.getParameter("id");
			
			ApplicationDB db2 = new ApplicationDB();	
			Connection con2 = db2.getConnection();	
			Statement stmt2 = con2.createStatement();
			String str2 = "SELECT f.flightNumber as a, f.departureAirport as b, f.destinationAirport as c, f.departureDate as d FROM waiting w, flight f WHERE w.customerId = '" + entity + "' and w.flightId = f.flightId and f.numberOfSeatsAvailable > 0";
			ResultSet result2 = stmt.executeQuery(str2);
			String combined = "";
			String a = "";
			String b = "";
			String c = "";
			String d = "";
			while (result2.next()) {
				
				a = result2.getString("a");
				b = result2.getString("b");
				c = result2.getString("c");
				d = result2.getString("d");
				
				combined = "ALERT: A seat is avaliable on Flight " + a + ", from" + b + " to " + c + " on " + d;
				break;

			}
			
			if (a != "" && b!="" && c!="" && d!=""){
				ApplicationDB db3 = new ApplicationDB();	
			Connection con3 = db3.getConnection();	
			
			//Create a SQL statement
			Statement stmt3 = con3.createStatement();
			
	        String increment ="INSERT INTO question(questionId,message,reply,customer_user_userId,answered,alert) VALUES (?,?,?,?,?,?)";
	        PreparedStatement ps;
	        ps = con3.prepareStatement(increment, Statement.RETURN_GENERATED_KEYS);
		
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query

		
			ps.setNull(1, Types.NULL);
			ps.setString(2, combined);
			ps.setString(3, "");
			ps.setInt(4, Integer.parseInt(entity)); 
			ps.setString(5, "");
			ps.setString(6, "No");
			ps.executeUpdate();
			con3.close();
			}
			
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM question WHERE customer_user_userID = '" + entity + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			out.print("<tr>");
			
			out.print("<td>");
			out.print("Question ID");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Message");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Reply (if any))");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				
				out.print("<tr>");
				
				out.print("<td>");
				out.print(result.getString("questionId"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("message"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("reply"));
				out.print("</td>");
				
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();
			con2.close();
			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>