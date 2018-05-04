<%@taglib prefix ="sql" uri= "http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : display
    Created on : Mar 25, 2015, 4:26:01 PM
    Author     : Yilun
--%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");   %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>selecting specific data from a DB</title>
    </head>
    <body>
        <h1>Book information</h1>
    </body>
    <%!
    public class BookInfo{
        String URL = "jdbc:mysql://localhost:3306/bookstore";
        String USERNAME = "root";
        String PASSWORD = "";
        
        Connection connection = null;
        PreparedStatement selectBookInfos = null;
        ResultSet resultSet = null;
        
        public BookInfo()
        {
           try {
               connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
               selectBookInfos = connection.prepareStatement(
                       "SELECT distinct books.book_id,books.title, book_authors.author_name,book_copies.branch_id,book_copies.no_of_copies, no_of_copies - (select count(*) from book_loans where book_loans.book_id = books.book_id and book_loans.branch_id = book_copies.branch_id) as available_copies FROM bookstore.books,bookstore.book_authors,bookstore.book_copies,bookstore.book_loans where books.book_id = book_copies.book_id and books.book_id = book_authors.book_id AND book_authors.author_name like %?");
  
           }
           catch (SQLException e)
           {
               e.printStackTrace();
           }
           }
            
       public ResultSet getBookInfos(String author_name)
               {
                   try{
                       
                       selectBookInfos.setString(1,author_name); 
                            
                         resultSet = selectBookInfos.executeQuery();
                          }
                   catch (SQLException e)
                   {
                              e.printStackTrace();
                              
               }
                   return resultSet;
               }
  
    }
    %>
    <%
        
    
        String Author = new String();
    
     
       if (request.getParameter("author_name")!= null){
         Author = request.getParameter("author_name");
      }
     
      BookInfo bookInfo = new BookInfo();
      ResultSet bookInfos = bookInfo.getBookInfos(Author);

%> 
<table border="1">
    <tbody>
        <tr>
           
            <td>Book_id</td>
            <td>title</td>
            <td>author</td>
            <td>branch_id</td>
            <td>number of copies</td>
            <td>available copies</td>
            
        </tr>
        <%while (bookInfos.next())    { %>
        <tr>
           
            <td><%=bookInfos.getString("book_id")%>  </td>
            <td><%=bookInfos.getString("title")%>   </td>
            <td><%=bookInfos.getString("author_name")%>   </td>
            <td><%=bookInfos.getString("branch_id")%>   </td>
            <td><%=bookInfos.getString("no_of_copies")%>   </td>
            <td><%=bookInfos.getString("available_copies")%>   </td>
        </tr>
        <% }%>
    </tbody>
</table>

</html>

