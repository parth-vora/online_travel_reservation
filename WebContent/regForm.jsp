<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<form method="post" action="regSubmit.jsp">
        <table>
            <thead>
            <tr>
                <th colspan="2">Enter information here</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>First Name</td>
                <td><input type="text" name="fname" value="" /></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><input type="text" name="lname" value="" /></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" value="" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pass" value="" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit" /></td>
                <td><input type="reset" value="Reset" /></td>
            </tr>
            <tr>
                <td colspan="2">Already registered? <a href="index.jsp">Sign in</a></td>
            </tr>
            </tbody>
        </table>
</form>
</body>
</html>
