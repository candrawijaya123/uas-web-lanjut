<%-- 
    Document   : index
    Created on : Jul 10, 2023, 11:52:55 PM
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
                font-family: 'Montserrat', monospace;
                font-family: 'Poppins', monospace;
                text-align: center;
                background-image: url("perpustakaan.jpg");
                color:white;
        
                
          
    
            }
            .table{
                width: 100%;
                text-align:justify;
                
           
     
    
            }
            
        </style>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <h1>Perpustakaan</h1>
        <% 
            try {
                String URLdb = "jdbc:mysql://localhost/weblanjut";
                String usernameDB = "root";
                String passwordDB = "";
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(URLdb, usernameDB, passwordDB);
                Statement statement = connection.createStatement();
                
                String query = "SELECT * FROM perpustakaan";
                ResultSet result = statement.executeQuery(query);
                %>
                <table class="table">
                <thead>
                    <tr>
                        <th>
                            Judul
                        </th>
                        <th>
                            Penulis
                        </th>
                        <th>
                            Jumlah Halaman
                        </th>
                        <th>
                            Ubah
                        </th>
                        <th>
                            Hapus
                        </th>
                    </tr>
                </thead>
                <tbody>
                <%
                while(result.next()){
                %>
                    <tr>
                        <td>
                            <% out.println(result.getString("title")); %>
                        </td>
                        <td>
                            <% out.println(result.getString("author")); %>
                        </td>
                        <td>
                            <% out.println(result.getInt("pages")); %>
                        </td>
                        <td>
                            <a href="ubahBuku.jsp?id=<% out.println(result.getString("id")); %>">
                                <button>
                                    Ubah
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="hapusBuku.jsp?id=<% out.println(result.getString("id")); %>">
                            <button>
                                Hapus
                            </button>
                            </a>
                        </td>
                    </tr>  
                <%
            }
                result.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        %>
                    </tbody> 
            </table>
                    <a href="tambahBuku.jsp">
                    <button>
                        Tambah Buku
                    </button>                 
                    </a>

    </body>
</html>
