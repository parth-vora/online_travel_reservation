<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Representative Landing</title>
</head>
<body>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
Incorrect email or password. Please try again.<br/>
<a href="index.jsp">Sign in</a>
<%} else {
%>
Representative's Homepage<br/>
Welcome <%=session.getAttribute("email")%>!<br/>
<br/>
<br/>
<br/>
	Book for Customer<br/>
	<form method="post" action="bookForCustomer.jsp">
			  Type Email of User
			  <input type="text" name="email" placeholder="Enter email of user.">
			  <input type="submit" value="submit" />
			  
	</form>
	<br/>
	<br/>
	Edit Booking for Customer<br/>
	<form method="post" action="editForCustomer.jsp">
			  Type Email of User
			  <input type="text" name="email" placeholder="Enter Email of User..">
			  Type Ticket ID of User
			  <input type="text" name="ticketId" placeholder="Enter TicketId..">
			  <input type="submit" value="submit" />
			  
	</form>
	<br/>
	<br/>
	<br/>
	<form method="post" action="inbox.jsp">
			  Click Submit Below to See Inbox<br/>
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	Information Editor
	<br/>
	<br/>
	<form method="post" action="delete.jsp">
			  Delete Information for:
			  <br>
			  <input type="radio" name="del" value="aircraft"/>aircraft
			  <br>
			  <input type="radio" name="del" value="airport"/>airport
			  <br>
			  <input type="radio" name="del" value="flight"/>flight
			  <br>
			  Type Selected ID (ex. if you selected flight ID, enter 313 for Flight 313))
			  <input type="text" name="val" placeholder="Enter ID">
			  <input type="submit" value="submit" />
			  
	</form>
	<br/>
	<br/>
	<br/>
	<br/>
	<form method="post" action="repInfoEditor.jsp">
			  Edit Information for:
			  <br>
			  <input type="radio" name="edit" value="aircraft"/>aircraft
			  <br>
			  <input type="radio" name="edit" value="airport"/>airport
			  <br>
			  <input type="radio" name="edit" value="flight"/>flight
			  <br>
			  Type Selected ID (ex. if you selected flight ID, enter 313 for Flight 313))
			  <input type="text" name = val placeholder="Enter ID">
			  <input type="submit" value="submit" />
			  
	</form>
	<br/>
	<br/>
	Add New Values into Database
	<br/>
	<br/>
	<form method="post" action="confirmFlight.jsp">
	ADD FLIGHT
	<br>
				<input type="text" name = flightID placeholder="Flight ID Number">
				<input type="text" name = flightNum placeholder="Flight Number">
				<input type="text" name = deperatureAirport placeholder="Departure Airport">
				<input type="text" name = destinationAirport placeholder="Destination Airport">
				<input type="text" name = numStops placeholder= "Number of Stops">
				<input type="text" name = numberOfSeats placeholder="Number Of Seats">
				<input type="text" name = departureDate placeholder="Departure Date">
				<input type="text" name = arrivalDate placeholder="Arrival Date">
				<input type="text" name = departureTime placeholder="Depature Time">
				<input type="text" name = arrivalTime placeholder="Arrival Time">
				<input type="text" name = timeInAir placeholder="Time In Air">
				<input type="text" name = airlineID placeholder="Airline ID">
				<input type="text" name = airportID placeholder="Airport ID">
				<input type="text" name = aircraftID placeholder="Aircraft ID">
				<input type="text" name = month placeholder="Month">
				<input type="text" name = year placeholder="Year">
				<input type="text" name = price placeholder="Price">
			  <input type="submit" value="Click to Add New Flight" />
			  
	</form>
	<br/>
	<br/>
	<form method="post" action="confirmAircraft.jsp">
	ADD AIRCRAFT
	<br>
				<input type="text" name = aircraftID placeholder="Aircraft ID">
				<input type="text" name = aircraftName placeholder="Aircraft Name">
				<br> Type in days of week (comma-separated) <br>
				<input type="text" name = operationDays placeholder="Operation Days">
				<br>
				<input type="text" name = numSeats placeholder="Number Of Seats">
			  <input type="submit" value="Click to Add New Aircraft" />
			  
	</form>
	<br/>
	<br/>
	<form method="post" action="confirmAirport.jsp">
	ADD AIRPORT
	<br>
			  <input type="text" name = airportID placeholder="Airport ID">
			  <input type="text" name = airportAbbr placeholder="Airport Abbreviation">
			  <input type="text" name = airportFullName placeholder="Airport Full Name">
			  <input type="submit" value="Click to Add New Airport" />
			  
	</form>
	<br/>
	<br/>
	Waiting List for a Flight<br/>
	<form method="post" action="viewWaitingList.jsp">
			  Enter flight number
			  <input type="text" name="flightNum">
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	<br/>
	A list of flights for airport<br/>
	<form method="post" action="viewFlights.jsp">
			  Enter airport
			  <input type="text" name ="airportCode">
			  <input type="submit" value="submit" />
	</form>


<a href='logout.jsp'>Sign out</a>
<%
    }
%>
</body>
</html>
