<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    try {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        //Get the database connection
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        //Invoke an insert statement into the users table in MYSQL.
        //The purpose is to create a new row so a new userId (auto incremented in MYSQL)
        //will be made. This userId will be captured and inserted into the primary key
        //column of the new customer's table in MYSQL.

        String increment ="INSERT INTO users(userId) VALUES (?)";
        PreparedStatement pstmt;
        pstmt = con.prepareStatement(increment, Statement.RETURN_GENERATED_KEYS);

        //Injects a null value into the userId row. The VALUES ? above will = NULL
        //This is because the users table only has one column that's auto incremented.
        //An inserted number is not needed.
        pstmt.setNull(1, Types.NULL);
        pstmt.executeUpdate();

        //Sets up an int variable
        //This variable will contain the newly created userId primary key.
        int insertedID = 0;
        ResultSet rs = pstmt.getGeneratedKeys();
        if(rs.next()){
            insertedID = rs.getInt(1); 
        }
        
        //Create a SQL statement
        Statement stmt;
        stmt = con.createStatement();

            int i = stmt.executeUpdate("insert into customer(customerId, email, password, firstName, lastName) values ('" + insertedID + "','" + email + "','" + pass + "','" + fname + "','" + lname + "')");
            if (i > 0) {
                //session.setAttribute("user", fname); // first name will be stored in the session
                session.setAttribute("email", email); // email will be stored in the session. user will be referred to as email
                out.println("welcome " + email);
                out.println("<a href='logout.jsp'>Sign out</a>");
                response.sendRedirect("customerHome.jsp");
                //response.sendRedirect("welcome.jsp");
                //out.print("Registration Successful!"+"<a href='index.jsp'>Sign in</a>");
            } else {
                out.println("Invalid email or password. <a href='index.jsp'>Please try again.</a>");
                //response.sendRedirect("index.jsp");
            }

            con.close();

    } catch (Exception ex) {
        out.print(ex);
        out.print("insert failed");
    }
%>