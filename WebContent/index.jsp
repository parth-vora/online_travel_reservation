<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FlightBooking - Sign in or sign up</title>
</head>
<body>
<form method="post" action="login.jsp">
        <table>
            <thead>
            <tr>
                <th colspan="2">Sign in here</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Email Address</td>
                <td><input type="text" name="email" value="" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pass" value="" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Login" /></td>
                <td><input type="reset" value="Reset" /></td>
            </tr>
            <tr>
                <td colspan="2">Need to Register? <a href="regForm.jsp"> Sign up</a></td>
            </tr>
            <tr>
                <td colspan="2">Employee? <a href="employeeIndex.jsp"> Sign in</a></td>
            </tr>
            </tbody>
        </table>
</form>
</body>
</html>