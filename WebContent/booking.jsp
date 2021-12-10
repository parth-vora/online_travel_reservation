<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();
	
		String entity = "";
		String entity1 = "";
		String entity2 = "";
		String entity3 = "";
		String entity4 = "";
		String entity5 = "";
		String entity6 = "";
		String entity7 = "";
		String entity8 = "";
		String entity9 = "";
		String entity10 = "";
		String entity11 = "";
		
		String id = request.getParameter("id");
		
		try{
			
			

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			entity = request.getParameter("trip");
			entity2 = request.getParameter("depart");
			entity3 = request.getParameter("return");
			entity4 = request.getParameter("departday");
			entity5 = request.getParameter("returnday");
			
			entity6 = request.getParameter("filterprice");
			entity7 = request.getParameter("filterstops");
			entity8 = request.getParameter("filterairline");
			entity9 = request.getParameter("filtertakeoff");
			entity10 = request.getParameter("filterland");
			entity11 = request.getParameter("sort");
			
			
			if (entity.equals("one")){
				
				String str = "";
				if (entity6!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and f.price" + entity6;
				} else if (entity7!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and f.numStops" + entity7 ;
				} else if (entity11!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' ORDER BY f." + entity11;
				} else if (entity8!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir,a.airlineFullName FROM flight f, airline a WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and a.airlineFullName != '" + entity8;
				} else if (entity9!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and f.departureTime" + entity9 ;
				} else if (entity10!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and f.arrivalTime" + entity10;
				} else {
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"'";
				}
				
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
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				
				
				if (X == 0){
					out.print("No Results Found");
				} else {
					out.print(X + " Results Found");
				}
					
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");

				out.print("<a href='customerHome.jsp'>Back to Home Page</a>");
				
			} else if (entity.equals("oneflex")) {
				String date = entity4;
				ArrayList<String> dates_flex = new ArrayList<String>();
				
				String day = date.substring(0,2);
				if (day.equals("28")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("29"+date.substring(2));
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+(String.format("%02d", (Integer.parseInt(date.substring(3,5))+1)))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					} else{
						dates_flex.add("29"+date.substring(2));
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					}
				} else if (day.equals("29")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add("02/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					} else {
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("02/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					}	
				}else if (day.equals("30")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("03/"+"01"+date.substring(5));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add("02/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					} else{
						dates_flex.add("03/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("01/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("02/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					}
					
				}else if (day.equals("01")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("28/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add(String.format("%02d", ((Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add(String.format("%02d", (Integer.parseInt(day)+2))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}else {
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("28/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}
				} else if (day.equals("02")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}else {
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}
				} else if (day.equals("03")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("02"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}else {
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("02"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}
				}else{
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
				}
				dates_flex.add(entity4);
				
				out.print("Search results on following days:");
				for (int i=0;i<dates_flex.size();i++){
					out.print(dates_flex.get(i) + ",");
				}
				out.print("<br>");
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
				for (int i =0;i<(dates_flex.size());i++){
					entity4=dates_flex.get(i);
					String str = "";
					if (entity6!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and f.price" + entity6;
					} else if (entity11!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' ORDER BY f." + entity11;
					} else if (entity7!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and f.numStops" + entity7 ;
					} else if (entity8!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir,a.airlineFullName FROM flight f, airline a WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and a.airlineFullName != '" + entity8;
					} else if (entity9!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and f.departureTime" + entity9 ;
					} else if (entity10!=null){
							str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and f.arrivalTime" + entity10;
					} else {
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"'";
					}
				//Run the query against the database.
					ResultSet result = stmt.executeQuery(str);
	
					while (result.next()) {
						X+=1;
						//make a row
						out.print("<tr>");
						//make a column
						out.print("<td>");
						//Print out current bar name:
						out.print(X);
						out.print("</td>");
						out.print("<td>");
						//Print out current bar name:
						out.print(result.getString("flightID"));
						out.print("</td>");
						out.print("<td>");
						//Print out current beer name:
						out.print(result.getString("flightNumber"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("destinationAirport"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureAirport"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("numStops"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureDate"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("arrivalDate"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureTime"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("arrivalTime"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("timeInAir"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("price"));
						out.print("</td>");
						out.print("</tr>");
					
				}
					
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				
				}
				
				out.print("</table>");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				
				if (X == 0){
					out.print("No Results Found");
				} else {
					out.print(X + " Results Found");
				}
					
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");

				out.print("<a href='customerHome.jsp'>Back to Home Page</a>");
				
			} else if (entity.equals("round")){
				out.print("Departure Flights");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				String str = "";
				if (entity6!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and f.price" + entity6;
				} else if (entity11!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' ORDER BY f." + entity11;
				} else if (entity7!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and f.numStops" + entity7 ;
				} else if (entity8!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir,a.airlineFullName FROM flight f, airline a WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and a.airlineFullName != '" + entity8;
				} else if (entity9!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and f.departureTime" + entity9 ;
				} else if (entity10!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"' and f.departureTime" + entity10;
				} else {
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
							+ "' and f.destinationAirport = '" + entity3 
							+ "' and f.departureDate = '" + entity4
							+"'";
				}
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
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current bar name:
					out.print(X);
					out.print("</td>");
					out.print("<td>");
					//Print out current bar name:
					out.print(result.getString("flightID"));
					out.print("</td>");
					out.print("<td>");
					//Print out current beer name:
					out.print(result.getString("flightNumber"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("destinationAirport"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("departureAirport"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("numStops"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("departureDate"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("arrivalDate"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("departureTime"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("arrivalTime"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("timeInAir"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("price"));
					out.print("</td>");
					out.print("</tr>");
				
				
				}
				out.print("</table>");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				
				
				if (X == 0){
					out.print("No Results Found");
				} else {
					out.print(X + " Results Found");
				}
					
				
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				out.print("Return Flights");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				str = "";
				if (entity6!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
							+ "' and f.destinationAirport = '" + entity2
							+ "' and f.departureDate = '" + entity5
							+"' and f.price" + entity6;
				} else if (entity11!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
							+ "' and f.destinationAirport = '" + entity2
							+ "' and f.departureDate = '" + entity5
							+"' ORDER  BY f." + entity11;
				} else if (entity7!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
							+ "' and f.destinationAirport = '" + entity2 
							+ "' and f.departureDate = '" + entity5
							+"' and f.numStops" + entity7 ;
				} else if (entity8!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir,a.airlineFullName FROM flight f, airline a WHERE f.departureAirport = '" + entity3
							+ "' and f.destinationAirport = '" + entity2 
							+ "' and f.departureDate = '" + entity5
							+"' and a.airlineFullName != '" + entity8;
				} else if (entity9!=null){
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
							+ "' and f.destinationAirport = '" + entity2 
							+ "' and f.departureDate = '" + entity5
							+"' and f.departureTime" + entity9 ;
				} else if (entity10!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
							+ "' and f.destinationAirport = '" + entity2 
							+ "' and f.departureDate = '" + entity5
							+"' and f.departureTime" + entity10;
				} else {
					str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
							+ "' and f.destinationAirport = '" + entity2 
							+ "' and f.departureDate = '" + entity5
							+"'";
				}
				//Run the query against the database.
				result = stmt.executeQuery(str);

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
				int a=0;
				while (result.next()) {
					X+=1;
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current bar name:
					out.print(X);
					out.print("</td>");
					out.print("<td>");
					//Print out current bar name:
					out.print(result.getString("flightID"));
					out.print("</td>");
					out.print("<td>");
					//Print out current beer name:
					out.print(result.getString("flightNumber"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("destinationAirport"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("departureAirport"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("numStops"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("departureDate"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("arrivalDate"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("departureTime"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("arrivalTime"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("timeInAir"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("price"));
					out.print("</td>");
					out.print("</tr>");
				
				
				}
				
				out.print("</table>");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				
				
				
				if (a == 0){
					out.print("No Results Found");
				} else {
					out.print(a + " Results Found");
				}
					
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");

				out.print("<a href='customerHome.jsp'>Back to Home Page</a>");
			} else if (entity.equals("roundflex")){
				
				String date = entity4;
				ArrayList<String> dates_flex = new ArrayList<String>();
				
				String day = date.substring(0,2);
				if (day.equals("28")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("29"+date.substring(2));
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+(String.format("%02d", (Integer.parseInt(date.substring(3,5))+1)))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					} else{
						dates_flex.add("29"+date.substring(2));
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					}
				} else if (day.equals("29")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add("02/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					} else {
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("02/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					}	
				}else if (day.equals("30")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("03/"+"01"+date.substring(5));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add("02/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					} else{
						dates_flex.add("03/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("01/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("02/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
					}
					
				}else if (day.equals("01")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("28/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add(String.format("%02d", ((Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add(String.format("%02d", (Integer.parseInt(day)+2))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}else {
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("28/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}
				} else if (day.equals("02")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}else {
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}
				} else if (day.equals("03")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("02"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}else {
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("02"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					}
				}else{
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)+1)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)+2)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)+3)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)-1)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)-2)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day)-3)))+date.substring(2));
				}
				dates_flex.add(entity4);
				
				out.print("Search results on following days:");
				for (int i=0;i<dates_flex.size();i++){
					out.print(dates_flex.get(i) + ",");
				}
				out.print("<br>");
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
				
				out.print("</tr>");;

				//parse out the results
				int X=0;
				for (int i =0;i<(dates_flex.size());i++){
					entity4=dates_flex.get(i);
					String str = "";
					if (entity6!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and f.price" + entity6;
					} else if (entity11!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' ORDER BY f." + entity11;
					} else if (entity7!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and f.numStops" + entity7 ;
					} else if (entity8!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir,a.airlineFullName FROM flight f, airline a WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and a.airlineFullName != '" + entity8;
					} else if (entity9!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and f.departureTime" + entity9 ;
					} else if (entity10!=null){
							str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"' and f.departureTime" + entity10;
					} else {
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity2
								+ "' and f.destinationAirport = '" + entity3 
								+ "' and f.departureDate = '" + entity4
								+"'";
					}
				//Run the query against the database.
					ResultSet result = stmt.executeQuery(str);
					while (result.next()) {
						X+=1;
						//make a row
						out.print("<tr>");
						//make a column
						out.print("<td>");
						//Print out current bar name:
						out.print(X);
						out.print("</td>");
						out.print("<td>");
						//Print out current bar name:
						out.print(result.getString("flightID"));
						out.print("</td>");
						out.print("<td>");
						//Print out current beer name:
						out.print(result.getString("flightNumber"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("destinationAirport"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureAirport"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("numStops"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureDate"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("arrivalDate"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureTime"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("arrivalTime"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("timeInAir"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("price"));
						out.print("</td>");
						out.print("</tr>");
					
					}
				}
					out.print("</table>");
					out.print("<br>");
					out.print("<br>");
					out.print("<br>");
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				
				
				if (X == 0){
					out.print("No Results Found");
				} else {
					out.print(X + " Results Found");
				}
					
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				out.print("Return Flight");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				
				date = entity5;
				dates_flex = new ArrayList<String>();
				
				String day2 = date.substring(0,2);
				if (day2.equals("28")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("29"+date.substring(2));
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+(String.format("%02d", (Integer.parseInt(date.substring(3,5))+1)))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-3)))+date.substring(2));
					} else{
						dates_flex.add("29"+date.substring(2));
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-3)))+date.substring(2));
					}
				} else if (day2.equals("29")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add("02/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-3)))+date.substring(2));
					} else {
						dates_flex.add("30"+date.substring(2));
						dates_flex.add("01/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("02/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-3)))+date.substring(2));
					}	
				}else if (day2.equals("30")){
					if(date.substring(3,5).equals("12")){
						dates_flex.add("03/"+"01"+date.substring(5));
						dates_flex.add("01/"+"01"+date.substring(5));
						dates_flex.add("02/"+"01"+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-3)))+date.substring(2));
					} else{
						dates_flex.add("03/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("01/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add("02/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))+1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-3)))+date.substring(2));
					}
					
				}else if (day2.equals("01")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("28/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add(String.format("%02d", ((Integer.parseInt(day2)+1)))+date.substring(2));
						dates_flex.add(String.format("%02d", (Integer.parseInt(day2)+2))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+3)))+date.substring(2));
					}else {
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("28/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+3)))+date.substring(2));
					}
				} else if (day2.equals("02")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+3)))+date.substring(2));
					}else {
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add("29/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+3)))+date.substring(2));
					}
				} else if (day2.equals("03")){
					if(date.substring(3,5) == "01"){
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("02"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt("12"))))+date.substring(5)));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+3)))+date.substring(2));
					}else {
						dates_flex.add("01"+date.substring(2));
						dates_flex.add("02"+date.substring(2));
						dates_flex.add("30/"+((String.format("%02d", (Integer.parseInt(date.substring(3,5))-1))))+date.substring(5));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+1)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+2)))+date.substring(2));
						dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+3)))+date.substring(2));
					}
				}else{
					dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+1)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+2)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day2)+3)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-1)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-2)))+date.substring(2));
					dates_flex.add((String.format("%02d", (Integer.parseInt(day2)-3)))+date.substring(2));
				}
				dates_flex.add(entity5);
				
				out.print("Search results on following days:");
				for (int i=0;i<dates_flex.size();i++){
					out.print(dates_flex.get(i) + ",");
				}
				out.print("<br>");
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
				X =0;
				for ( int i =0;i<(dates_flex.size());i++){
					entity4=dates_flex.get(i);
					String str = "";
					if (entity6!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
								+ "' and f.destinationAirport = '" + entity2 
								+ "' and f.departureDate = '" + entity4
								+"' and f.price" + entity6;
					} else if (entity7!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
								+ "' and f.destinationAirport = '" + entity2 
								+ "' and f.departureDate = '" + entity4
								+"' and f.numStops" + entity7 ;
					} else if (entity11!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
								+ "' and f.destinationAirport = '" + entity2
								+ "' and f.departureDate = '" + entity4
								+"' ORDER BY f." + entity11;
					} else if (entity8!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir,a.airlineFullName FROM flight f, airline a WHERE f.departureAirport = '" + entity3
								+ "' and f.destinationAirport = '" + entity2 
								+ "' and f.departureDate = '" + entity4
								+"' and a.airlineFullName != '" + entity8;
					} else if (entity9!=null){
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
								+ "' and f.destinationAirport = '" + entity2 
								+ "' and f.departureDate = '" + entity4
								+"' and f.departureTime" + entity9 ;
					} else if (entity10!=null){
							str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
								+ "' and f.destinationAirport = '" + entity2 
								+ "' and f.departureDate = '" + entity4
								+"' and f.departureTime" + entity10;
					} else {
						str = "SELECT f.price,f.flightID,f.flightNumber,f.destinationAirport,f.departureAirport,f.numStops,f.departureDate,f.arrivalDate,f.departureTime,f.arrivalTime,f.timeInAir FROM flight f WHERE f.departureAirport = '" + entity3
								+ "' and f.destinationAirport = '" + entity2
								+ "' and f.departureDate = '" + entity4
								+"'";
					}
				//Run the query against the database.
					ResultSet result = stmt.executeQuery(str);
	
					while (result.next()) {
						X+=1;
						//make a row
						out.print("<tr>");
						//make a column
						out.print("<td>");
						//Print out current bar name:
						out.print(X);
						out.print("</td>");
						out.print("<td>");
						//Print out current bar name:
						out.print(result.getString("flightID"));
						out.print("</td>");
						out.print("<td>");
						//Print out current beer name:
						out.print(result.getString("flightNumber"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("destinationAirport"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureAirport"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("numStops"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureDate"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("arrivalDate"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("departureTime"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("arrivalTime"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("timeInAir"));
						out.print("</td>");
						
						out.print("<td>");
						//Print out current price
						out.print(result.getString("price"));
						out.print("</td>");
						out.print("</tr>");
	
					}
					
				}
				out.print("</table>");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				
				
				if (X == 0){
					out.print("No Results Found");
				} else {
					out.print(X + " Results Found");
				}
					
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				out.print("<a href='customerHome.jsp'>Back to Home Page</a>");
			}
			
			//close the connection.
			con.close();
			
			
		} catch (Exception e) {
			 out.print(e);
	         e.printStackTrace();
		}
	%>
	<br>
	<br>
	<hr>
	SORT flights by one of the following:
	<br>
	<br>
	<form method="post" action="booking.jsp" >
			  Sort by <br/>
			  <input type="hidden" name="trip" value=<%=request.getParameter("trip") %>>
			  <input type="hidden" name="depart" value=<%= request.getParameter("depart") %>>
			  <input type="hidden" name="return" value=<%=request.getParameter("return") %>>
			  <input type="hidden" name="departday" value=<%=request.getParameter("departday") %>>
			  <input type="hidden" name="returnday" value=<%=request.getParameter("returnday") %>>
			  <select name="sort" id="category">
			    <option value="price">Price</option>
			    <option value="timeInAir">Flight Duration</option>
			    <option value="departureTime">Take-off Time</option>
			    <option value="arrivalTime">Landing Time</option>
		  </select>
		  <br><br>
		  <input type="submit" value="Submit">
	</form>
	
	<br>
	<br>
	<hr>
	FILTER flights by one of the following:
	<br>
	<br>
	<form method="post" action="booking.jsp" >
			  Filter by Price <br/>
			  <input type="hidden" name="trip" value=<%=request.getParameter("trip") %>>
			  <input type="hidden" name="depart" value=<%= request.getParameter("depart") %>>
			  <input type="hidden" name="return" value=<%=request.getParameter("return") %>>
			  <input type="hidden" name="departday" value=<%=request.getParameter("departday") %>>
			  <input type="hidden" name="returnday" value=<%=request.getParameter("returnday") %>>
			  <select name="filterprice" id="category">
			  	<option value=""></option>
			    <option value=" <= 100">Less Than $100</option>
			    <option value=" > 100 and f.price <=400 ">$100 - $400</option>
			    <option value=" >400">Greater Than $400</option>
		  </select>
		  <br><br>
		  <input type="submit" value="Submit">
	</form>
	<br>
	<br>
	<form method="post" action="booking.jsp" >
			  Filter by Number of Stops <br/>
			  <input type="hidden" name="trip" value=<%=request.getParameter("trip") %>>
			  <input type="hidden" name="depart" value=<%= request.getParameter("depart") %>>
			  <input type="hidden" name="return" value=<%=request.getParameter("return") %>>
			  <input type="hidden" name="departday" value=<%=request.getParameter("departday") %>>
			  <input type="hidden" name="returnday" value=<%=request.getParameter("returnday") %>>
			  <select name="filterstops" id="category">
			  	<option value=""></option>
			    <option value=" =0">None</option>
			    <option value=" =1 or f.numStops =2">1-2</option>
			    <option value=" >2">More than 2</option>
		  </select>
		  <br><br>
		  <input type="submit" value="Submit">
	</form>
	<br>
	<br>
	<form method="post" action="booking.jsp" >
			  Filter by Airline <br/>
			  <input type="hidden" name="trip" value=<%=request.getParameter("trip") %>>
			  <input type="hidden" name="depart" value=<%= request.getParameter("depart") %>>
			  <input type="hidden" name="return" value=<%=request.getParameter("return") %>>
			  <input type="hidden" name="departday" value=<%=request.getParameter("departday") %>>
			  <input type="hidden" name="returnday" value=<%=request.getParameter("returnday") %>>
			  <input name="filterairline" type="text">
		  <br><br>
		  <input type="submit" value="Submit">
	</form>
	<br>
	<br>
	<form method="post" action="booking.jsp" >
			  Filter by Take off Time <br/>
		      <input type="hidden" name="trip" value=<%=request.getParameter("trip") %>>
			  <input type="hidden" name="depart" value=<%= request.getParameter("depart") %>>
			  <input type="hidden" name="return" value=<%=request.getParameter("return") %>>
			  <input type="hidden" name="departday" value=<%=request.getParameter("departday") %>>
			  <input type="hidden" name="returnday" value=<%=request.getParameter("returnday") %>>
			  <select name="filtertakeoff" id="category">
			  	<option value=""></option>
			    <option value=" <= 1200">Morning</option>
			    <option value=" >1200 and f.departureTime <= 1700">Afternoon</option>
			    <option value=" >1700">Night</option>
		  </select>
		  <br><br>
		  <input type="submit" value="Submit">
	</form>
	<br>
	<br>
	<form method="post" action="booking.jsp" >
			  Filter by Landing Time <br/>
			  <input type="hidden" name="trip" value=<%=request.getParameter("trip") %>>
			  <input type="hidden" name="depart" value=<%= request.getParameter("depart") %>>
			  <input type="hidden" name="return" value=<%=request.getParameter("return") %>>
			  <input type="hidden" name="departday" value=<%=request.getParameter("departday") %>>
			  <input type="hidden" name="returnday" value=<%=request.getParameter("returnday") %>>
			  <select name="filterland" id="category">
			  	<option value=""></option>
			    <option value=" <=1200">Morning</option>
			    <option value=" >1200 and f.arrivalTime <= 1700">Afternoon</option>
			    <option value=" >1700">Night</option>
		  </select>
		  <br><br>
		  <input type="submit" value="Submit">
	</form>
	
	<br>
	<br>
	<br>
	<br>
	<form method="post" action="confirmation.jsp">
	
	<input type="hidden" name="id" value=<%=id%>>
	Want to Book? Insert DEPARTURE Flight Selection Number Below. If no results were found, go back to home page.
	<br>
	<br>
	<input type="text" name="departure" >
	<br>
	<br>
	Want to Book? Insert RETURN Flight Selection Number Below (ROUND TRIP FLIGHTS ONLY). If no results were found, go back to home page.
	<br>
	<br>
	<input type="text" name="return">
	<br>
	<br>
	<input type="submit">
	</form>		 
	<br>
	<br>
	<br>
	<a href='customerHome.jsp'>Back to Home Page</a>
	<br>
	<br>
	<br>
</body>
</html>