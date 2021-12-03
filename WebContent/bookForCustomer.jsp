<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
   <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
    <title>Customer Landing</title>
</head>
<body>
<%
	
    if ((request.getParameter("email") == null) || (request.getParameter("email") == "")) {
%>
Incorrect email. Please try again.<br/>
<a href="index.jsp">Sign in</a>
<%} else {
	
	String email2 = request.getParameter("email");
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	String str = "SELECT c.customerId FROM customer AS c WHERE c.email = '" + email2 +"'";
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str);
	String id = "";
	while(result.next()){
		id = result.getString("customerId");
		break;
	}
	
%>
Customer's Homepage<br/>
Booking for <%=request.getParameter("email")%>!<br/>
<br/>
<br/>
<br/>
<form method="post" action="booking.jsp">
			  <input type="hidden" name="id" value=<%=id%>>
			  <input type="radio" name="trip" value="one"/>One-Way
			  <br>
			  <input type="radio" name="trip" value="round"/>Round-Trip
			  <br>
			  <input type="radio" name="trip" value="oneflex"/>One-Way Flexible
			  <br>
			  <input type="radio" name="trip" value="roundflex"/>Round-Trip Flexible
			  <br>
			  <br>
			  <br>
			  Input Airport Codes (ex.EWR)
			  <br>
			  <br>
			  Departure Airport Code
			  <input type="text" name="depart" placeholder="Enter airport code">
			  
			  Arrival Airport Code
			  <input type="text" name="return" placeholder="Enter airport code">
			  <br>
			  <br>
			  <br>
			  Input Dates in Format (dd/mm/yyy)
			  <br>
			  <br>
			  <label for="departure">Departure Date:</label>
			  <input type="date" id="departure" name="departday" placeholder="dd/mm/yyyy" pattern="(^(((0[1-9]|1[0-9]|2[0-8])[\/](0[1-9]|1[012]))|((29|30|31)[\/](0[13578]|1[02]))|((29|30)[\/](0[4,6,9]|11)))[\/](19|[2-9][0-9])\d\d$)|(^29[\/]02[\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)" required>
			  <label for="return">Returning Date (ONLY ENTER IF BOOKING ROUND TRIP):</label>
			  <input type="date" id="return" name="returnday" placeholder="dd/mm/yyyy" pattern="(^(((0[1-9]|1[0-9]|2[0-8])[\/](0[1-9]|1[012]))|((29|30|31)[\/](0[13578]|1[02]))|((29|30)[\/](0[4,6,9]|11)))[\/](19|[2-9][0-9])\d\d$)|(^29[\/]02[\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)">
			  <br>
			  <br>
			  <input type="submit">
</form>



<a href='customerHome.jsp'>Back to Home Page</a>

<%
    }
%>
</body>
</html>