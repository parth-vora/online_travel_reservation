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
		String id = request.getParameter("id");
		String keyword = request.getParameter("keyword");
	
	    //Get the database connection
	    ApplicationDB db = new ApplicationDB();
	    Connection con = db.getConnection();
	
	    //Create a SQL statement
	    Statement stmt = con.createStatement();
	    ResultSet rs;
		int counter = 0;
	    	rs = stmt.executeQuery("select * from question where message like '%" + keyword + "%' or reply like '%" + keyword + "%' and alert = 'No'");
	        
	    	out.print("<table>");
	
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("questionId");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("message");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("reply");
			out.print("</td>");
			out.print("</tr>");
			
	    	while (rs.next()) {
	    		counter+=1;
	        	//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out q id:
				out.print(rs.getString("questionId"));
				out.print("</td>");
				out.print("<td>");
				//Print out q message
				out.print(rs.getString("message"));
				out.print("</td>");
				out.print("<td>");
				//Print out q reply 
				out.print(rs.getString("reply"));
				out.print("</td>");
				out.print("<td>");
				
	        }
	    	
	    	out.print("</table>");
	    	
	    	if (counter == 0) {
	            out.println("No questions or answers match the keyword");
	        }
	    	
			//close the connection.
			con.close();
	
		} catch (Exception e) {
		}
	%>

</body>
</html>
