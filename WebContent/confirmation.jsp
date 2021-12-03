<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<body>
<%
try {
	
	String id =  request.getParameter("id");
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp

	ApplicationDB db2 = new ApplicationDB();	
	Connection con2= db.getConnection();	
	
	//Create a SQL statement
	Statement stmt2 = con.createStatement();
	//Get the combobox from the index.jsp
	String departureId = request.getParameter("departure");
	String returnId = request.getParameter("return");
	

	String str3 = "SELECT * FROM flight WHERE flightId = '" + departureId + "'";
	ResultSet result2 = stmt.executeQuery(str3);
	int dep = 0;
	String depFrom = "";
	String depTo = "";
	String depFlightNum = "";
	String depDate = "";
	String depTime = "";
	String depPrice = "";
	
	while(result2.next()){
		dep = result2.getInt("numberOfSeatsAvailable");
		depFrom = result2.getString("departureAirport");
		depTo = result2.getString("destinationAirport");
		depFlightNum = result2.getString("flightNumber");
		depDate = result2.getString("departureDate");
		depTime = result2.getString("departureTime");
		depPrice = result2.getString("price");
		break;
	}
	String str5 = "SELECT * FROM customer WHERE customerId = '" + id + "'";
	ResultSet result3 = stmt.executeQuery(str5);
	String firstName = "";
	String lastName = "";
	while(result3.next()){
		firstName = result3.getString("firstName");
		lastName = result3.getString("lastName");
		break;
	}
	
	String str4 = "SELECT * FROM flight WHERE flightId = '" + returnId + "'";
	ResultSet result4 = stmt.executeQuery(str4);
	int ret = 0;
	String retFrom = "";
	String retTo = "";
	String retFlightNum = "";
	String retDate = "";
	String retTime = "";
	String retPrice = "";
	
	while(result4.next()){
		ret = result4.getInt("numberOfSeatsAvailable");
		retFrom = result4.getString("departureAirport");
		retTo = result4.getString("destinationAirport");
		retFlightNum = result4.getString("flightNumber");
		retDate = result4.getString("departureDate");
		retTime = result4.getString("departureTime");
		retPrice = result4.getString("price");
		break;
	}
	
	

	if (dep == 0){
		out.print("No avaliable seats for your departure flight. Would you like to join the waiting list?");
		%> 
		<form action="waitingList.jsp">
			<input type="hidden" name=depFlightId value=<%=departureId%>>
			<input type="hidden" name=idVal value=<%=id%>>
			<select name ="confirm">
				<option value="answer">Yes</option>
				<option value="answer">No</option>
			</select>
			<input type="submit" value="Submit">
		</form>
		
		<%
	} else if (dep != 0){
		%> 
		<form action="createOneTicket.jsp">
			<input type="hidden" name=depflightId value=<%=departureId%>>
			<input type="hidden" name=idVal value=<%=id%>>
			<input type="hidden" name=first value=<%=firstName%>>
			<input type="hidden" name=last value=<%=lastName%>>
			<input type="hidden" name=depFrom value=<%=depFrom%>>
			<input type="hidden" name=depTo value=<%=depTo%>>
			<input type="hidden" name=depFlightNum value=<%=depFlightNum%>>
			<input type="hidden" name=depDate value=<%=depDate%>>
			<input type="hidden" name=depTime value=<%=depTime%>>
			<input type="hidden" name=depPrice value=<%=depPrice%>>
			<select name ="class">
				<option value="economy">Book Economy</option>
				<option value="business">Book Business</option>
				<option value="first-class">Book First-Class</option>
			</select>
			<input type="submit" value="Book Ticket">
		</form>
		
		<%
		out.print(firstName);
		out.print(lastName);
	} else if (dep != 0 && (ret != 0)){
		
		%> 
		<form action="createRoundTicket.jsp">
			<input type="hidden" name=depflightId value=<%=departureId%>>
			<input type="hidden" name=idVal value=<%=id%>>
			<input type="hidden" name=first value=<%=firstName%>>
			<input type="hidden" name=last value=<%=lastName%>>
			<input type="hidden" name=depFrom value=<%=depFrom%>>
			<input type="hidden" name=depTo value=<%=depTo%>>
			<input type="hidden" name=depFlightNum value=<%=depFlightNum%>>
			<input type="hidden" name=depDate value=<%=depDate%>>
			<input type="hidden" name=depTime value=<%=depTime%>>
			<input type="hidden" name=depPrice value=<%=depPrice%>>
			<input type="hidden" name=retflightId value=<%=returnId%>>
			<input type="hidden" name=retFrom value=<%=retFrom%>>
			<input type="hidden" name=retTo value=<%=retTo%>>
			<input type="hidden" name=retFlightNum value=<%=retFlightNum%>>
			<input type="hidden" name=retDate value=<%=retDate%>>
			<input type="hidden" name=retTime value=<%=retTime%>>
			<input type="hidden" name=retPrice value=<%=retPrice%>>
			<select name ="class">
				<option value="economy">Book Economy</option>
				<option value="business">Book Business</option>
				<option value="first-class">Book First-Class</option>
			</select>
			<input type="submit" value="Book Ticket">
		</form>
		
		<%
	} else if (ret == 0) {
	
		out.print("No avaliable seats for this sequence of flights. Would you like to join the waiting list it?");
		out.print(firstName);
		out.print(lastName);
		%> 
		<form action="waitingList.jsp"> 
			<input type="hidden" name=depFlightId value=<%=departureId%>>
			<input type="hidden" name=idVal value=<%=id%>>
			<input type="hidden" name=retFlightId value=<%=returnId%>>
			<select name ="confirm">
				<option value="answer">Yes</option>
				<option value="answer">No</option>
			</select>
			<input type="submit" value="Submit">
		</form>
		
		<%
		
		con2.close();
		con.close();
	}
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>
