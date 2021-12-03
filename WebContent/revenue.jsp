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
			
			ApplicationDB db2 = new ApplicationDB();	
			Connection con2 = db2.getConnection();	
			Statement stmt2 = con2.createStatement();
			
			//Get the combobox from the index.jsp
			String entity = request.getParameter("role");
			String entity2 = request.getParameter("val");
			String str = "";
			String str2 = "";
			if (entity.equals("flightNumber")) {
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			str = "SELECT ticketId,totalFare FROM ticket WHERE " + entity +  " = '" + entity2 + "'";
			str2 = "SELECT SUM(totalFare)  AS 'sumTotal'  FROM ticket WHERE " + entity +  " = '" + entity2 + "'";
			//Run the query against the database.
			} else if(entity.equals("airline")){
				str = "SELECT t.ticketId  AS 'ticketId',t.totalFare AS 'totalFare' FROM ticket t, flight f, airline a WHERE f.flightNumber = t.flightNumber and f.airline_airportId = a.airlineId and a.airlineAbbr = '" + entity2 + "'";
				str2 = "SELECT SUM(t.totalFare)  AS 'sumTotal' FROM ticket t, flight f, airline a WHERE f.flightNumber = t.flightNumber and f.airline_airportId = a.airlineId and a.airlineAbbr = '" + entity2 + "'";
			}else {
				str = "SELECT ticketId,totalFare FROM ticket WHERE firstName = '" + entity2.split(" ")[0] + "' and lastName = '" + entity2.split(" ")[1] +"'";
				str2 = "SELECT sum(totalFare) AS 'sumTotal' FROM ticket WHERE firstName = '" + entity2.split(" ")[0] + "' and lastName = '" + entity2.split(" ")[1] +"'";
				//Run the query against the database.
			}
			ResultSet result = stmt.executeQuery(str);
			ResultSet result2 = stmt2.executeQuery(str2);
			out.print("<table>");

			
			out.print("<tr>");
			
			out.print("<td>");
			out.print("ticketId");
			out.print("</td>");
			
			out.print("<td>");
			out.print("totalFare");
			out.print("</td>");
			
			
			out.print("</tr>");

			while (result.next()) {
				
				out.print("<tr>");
				
				out.print("<td>");
				out.print(result.getString("ticketId"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("totalFare"));
				out.print("</td>");
				
				out.print("</tr>");
				
				}
			
		
			out.print("</table>");
			
				String sumTotal = ""; 
				while (result2.next()) {
				
				sumTotal = result2.getString("sumTotal");
				break;
				}
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				out.print("Total revenue generated = " + sumTotal);

			//close the connection.
			con.close();
			con2.close();
			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>