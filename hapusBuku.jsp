<%-- 
    Document   : hapusBuku.jsp
    Created on : Jul 11, 2023, 12:12:28 AM
    Author     : cndra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    
    try {
     String URLdb = "jdbc:mysql://localhost/weblanjut";
     String usernameDB = "root";
     String passwordDB = "";
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection(URLdb, usernameDB, passwordDB);
     Statement statement = connection.createStatement();
     
     String query = "DELETE FROM perpustakaan WHERE id=" + id;
     statement.executeUpdate(query);
     response.sendRedirect("index.jsp");
     
    } catch (Exception e) {
     out.println(e.getMessage());
    }
    %>