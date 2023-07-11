<%-- 
    Document   : tambahBuku
    Created on : Jul 11, 2023, 12:07:28 AM
    Author     : cndra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perpustakaan</title>
        <style>
            body{
                @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&family=Poppins:wght@300;400;500;700&display=swap');
                font-family: 'Montserrat', sans-serif;
                font-family: 'Poppins', sans-serif;
                background-color: 	#F0F8FF;
            }
        </style>
    </head>
    <body>
        <h1>Perpustakaan</h1>
        <div>
            <h3>
                Tambah Buku
            </h3>
            <div>
                <form action="" method="post">
                <div class="spacer">
                    <label>
                        Judul Buku <br>
                        <input type="text" name="title" id="title" />
                    </label> <br>
                    <label>
                        Penulis <br>
                        <input type="text" name="author" id="author" />
                    </label> <br>
                    <label>
                        Jumlah Halaman <br>
                        <input type="number" name="pages" id="pages" />
                    </label> <br>
                    <input type="submit" name="tambahBuku">
                </div>
                </form>
            </div>
        </div>
    </body>
    <%@page import="java.sql.*" %>
    <%@page import="javax.swing.*" %>
    <% 
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String pages = request.getParameter("pages");
        
        if (title != null && author != null && pages != null){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/weblanjut",
                "root",
                ""
                );
                String query ="INSERT INTO perpustakaan VALUES(?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(query);
                
                int randomNum = (int) (Math.random() * (99-1) + 1);
                
                statement.setInt(1, randomNum   );
                statement.setString(2, title);
                statement.setString(3, author);
                statement.setString(4, pages);
                int updatedQuery = statement.executeUpdate();
                if (updatedQuery != 0) { response.sendRedirect("index.jsp"); };
               
        } catch (Exception e) {
                out.println(e.getMessage());
        }
        }
        %>
</html>
