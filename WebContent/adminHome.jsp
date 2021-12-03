<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrator Landing</title>
</head>
<body>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
Incorrect email or password. Please try again.<br/>
<a href="index.jsp">Sign in</a>
<%} else {
	%>
	Administrator's Homepage<br/>
	Welcome <%=session.getAttribute("email")%>!<br/>
	<br/>
	<br/>
	
	Information Editor<br/>
	<form method="post" action="infoEditor.jsp">
			  <input type="radio" name="role" value="customer"/>Edit Customer Info
			  <br>
			  <input type="radio" name="role" value="customerrep"/>Edit Customer Rep. Info
			  <br>
			  Type Email Address of User
			  <input type="text" name="val" placeholder="Enter Email of User..">
			  <input type="submit" value="submit" />
			  
	</form>
	<br/>
	<br/>
	<br/>
	<form action="salesReport.jsp">
		  <label for="cars">Obtain a sales report for a given month</label>
		  <select name="month" id="month">
			    <option value="01">January</option>
			    <option value="02">February</option>
			    <option value="03">March</option>
			    <option value="04">April</option>
			    <option value="05">May</option>
			    <option value="06">June</option>
			    <option value="07">July</option>
			    <option value="08">August</option>
			    <option value="09">September</option>
			    <option value="10">October</option>
			    <option value="11">November</option>
			    <option value="12">December</option>
		  </select>
		  <br><br>
		  <input type="submit" value="Submit">
	</form>
	<br/>
	<br/>
	Reservations List: Select either flight number or customer name.<br/>
	<form method="post" action="listReservations.jsp">
			  <input type="radio" name="role" value="flightNumber"/>Flight Number
			  <br>
			  <input type="radio" name="role" value="customer"/>Customer Full Name
			  <br>
			  Enter selected value
			  <input type="text" name="val" >
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	Summary of Revenue Generated<br/>
	<form method="post" action="revenue.jsp">
			  <input type="radio" name="role" value="flightNumber"/>Flight Number
			  <br>
			  <input type="radio" name="role" value="airline"/>Airline
			  <br>
			  <input type="radio" name="role" value="customer"/>Customer Full Name
			  <br>
			  Enter selected value
			  <input type="text" name="val">
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	<br/>
	<form method="post" action="mostRevenue.jsp">
			  Click Submit Below to See Customer Who Generated Most Revenue<br/>
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	<br/>
	<form method="post" action="mostActive.jsp">
			  Click Submit Below to See List  of Most Active Flights<br/>
			  <input type="submit" value="submit" />
	</form>
<a href='logout.jsp'>Sign out</a>
<% }
%>
</body>
</html>
