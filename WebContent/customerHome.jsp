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
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
Incorrect email or password. Please try again.<br/>
<a href="index.jsp">Sign in</a>
<%} else {
	
	String email2 = session.getAttribute("email").toString();
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
	con.close();

%>
Customer's Homepage<br/>
Welcome <%=session.getAttribute("email")%>!<br/>
<br/>
<br/>
<br/>

	<form method="post" action="bookFlight.jsp">
			  <input type="hidden" name="id" value=<%=id%>>
			  Click Submit Below to Book a Flight<br/>
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	<br/>
	<form method="post" action="pastRes.jsp">
			  <input type="hidden" name="id" value=<%=id%>>
			  Click Submit Below View Past Reservations<br/>
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	<br/>
	<form method="post" action="upcomingRes.jsp">
			  <input type="hidden" name="id" value=<%=id%>>
			  Click Submit Below View Upcoming Reservations<br/>
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	<br/>
	<form method="post" action="viewInbox.jsp">
		      <input type="hidden" name="id" value = <%=id%>>
			  Click Submit Below to View Any Incoming Messages<br/>
			  <input type="submit" value="submit" />
	</form>
	<br/>
	<br/>
	<br/>
	<form method="post" action="confirmQuestion.jsp">
			
			  Enter Message to Send to Customer Service<br/>
			  <input type="hidden" name="id" value = <%=id%>>
			  <input type="text" name="message" placeholder="Message">
			  <input type="submit" value="submit" />
			
	</form>
	<br/>
	<br/>
	<br/>
	<form method="post" action="qna.jsp">
			  <input type="hidden" name="id" value = <%=id%>>
			  Search for Question/Answer by Entering Keyword<br/>
			  <input type="text" name ="keyword" placeholder="Keyword">
			  <input type="submit" value="submit" />
	</form>

<a href='logout.jsp'>Sign out</a>

<%
    }
%>
</body>
</html>
