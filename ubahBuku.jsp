<%-- 
    Document   : tambahBuku
    Created on : Jul 11, 2023, 12:07:28 AM
    Author     : cndra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
            }
        </style>
    </head>
    <body>
        <h1>Perpustakaan</h1>
        <div>
            <h3>
                Ubah Buku
            </h3>
            <div>
                
        <%
            String id = request.getParameter("id");
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/weblanjut",
                "root",
                ""
                );
                
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM perpustakaan WHERE id=" + id + "";
                ResultSet result = statement.executeQuery(query);
                
                while(result.next()){
            %>
                <form action="prosesUbahBuku.jsp" method="post">
                <div class="spacer">
                    <input type="hidden" name="id" id="id" value="<% out.println(result.getString("id")); %>" />
                    <label>
                        Judul Buku <br>
                        <input type="text" name="title" id="title" value="<% out.println(result.getString("title")); %>" />
                    </label> <br>
                    <label>
                        Penulis <br>
                        <input type="text" name="author" id="author" value="<% out.println(result.getString("author")); %>" />
                    </label> <br>
                    <label>
                        Jumlah Halaman <br>
                        <input type="number" name="pages" id="pages" value=<% out.println(result.getString("pages")); %> />
                    </label> <br>
                    <input type="submit" name="ubahBuku">
                    </form>
                </div>
                </form>
            <%
            }
            } catch (Exception e){
            out.println(e.getMessage());
            };
                %>
            </div>
        </div>
    </body>
</html>
