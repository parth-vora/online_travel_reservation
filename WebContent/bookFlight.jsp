<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Landing</title>
</head>
<body>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
Incorrect email or password. Please try again.<br/>
<a href="index.jsp">Sign in</a>
<%} else {
%>
Customer's Homepage<br/>
Welcome <%=session.getAttribute("email")%>!<br/>
<br/>
<br/>
<br/>
<form method="post" action="booking.jsp">
			<input type="hidden" name="id" value=<%=request.getParameter("id")%>>
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
			  <input type="text" name="depart" placeholder="Enter Full Name to Search for User..">
			  
			  Arrival Airport Code
			  <input type="text" name="return" placeholder="Enter Full Name to Search for User..">
			  <br>
			  <br>
			  <br>
			  Input Dates in Format (dd/mm/yyyy)
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