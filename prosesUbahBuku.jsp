<%-- 
    Document   : processUpdateLab
    Created on : Jul 10, 2023, 9:36:00 PM
    Author     : cndra
--%>

<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String pages = request.getParameter("pages");
    
    if (id != null){
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/weblanjut",
                "root",
                ""
                );
                
                String query = "UPDATE perpustakaan SET id=?, title=?, author=?, pages=? WHERE id=" + id + "";
                PreparedStatement statement = connection.prepareStatement(query);
                
                statement.setString(1, id);
                statement.setString(2, title);
                statement.setString(3, author);
                statement.setString(4, pages);
                
                int i = statement.executeUpdate();
                if (i != 0) { response.sendRedirect("index.jsp");
                 }
    } catch (Exception e) {
        out.println(e.getMessage());
    }
    }
    %>