<<%@taglib prefix ="sql" uri= "http://java.sun.com/jsp/jstl/sql"%>
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
        <h1>borrower managemnet</h1>
    </body>
    <%!
    public class BookName{
        String URL = "jdbc:mysql://localhost:3306/bookstore";
        String USERNAME = "root";
        String PASSWORD = "";
        
        Connection connection = null;
        PreparedStatement selectBookNames = null;
        ResultSet resultSet = null;
        
        public BookName()
        {
           try {
               connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
               selectBookNames = connection.prepareStatement(
           
                      "INSERT INTO bookstore.book_loans (book_id,branch_id,card_no,date_out) VALUES ('?', ?, '?', curDATE());");
                         
  
           }
           catch (SQLException e)
           {
               e.printStackTrace();
           }
           }
            
       public ResultSet getBookNames(String book_id,String branch_id,String card_no)
               {
                   try{
                        selectBookNames.setString(1,book_id);
                        selectBookNames.setString(2,branch_id); 
                        selectBookNames.setString(3,card_no); 
                         
                         resultSet = selectBookNames.executeQuery();
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
        String book_id = new String();
        String branch_id = new String();
        String card_no = new String();
    
    
      if (request.getParameter("book_id")!= null){
         book_id = request.getParameter("book_id");
      }
      if (request.getParameter("branch_id")!= null){
         branch_id = request.getParameter("branch_id");
      }
      if (request.getParameter("card_no")!= null){
         card_no = request.getParameter("card_no");
      }
     
      BookName bookName = new BookName();
      ResultSet bookNames = bookName.getBookNames(book_id,branch_id,card_no);

%> 
<table border="1">
    <thead>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <tr>
           
            <td>book_id</td>
            <td>branch_id</td>
            <td>card_no</td>
            <td>date_out</td>
            <td>due_date</td>
            
            
        </tr>
        <%while (bookNames.next())    { %>
        <tr>
           
            <td><%=bookNames.getString("book_id")%>  </td>
            <td><%=bookNames.getString("branch_id")%>  </td>
            <td><%=bookNames.getString("card_no")%>  </td>
            <td><%=bookNames.getString("date_out")%>  </td>
            <td><%=bookNames.getString("due_date")%>  </td>
        </tr>
        <% }%>
    </tbody>
</table>

</html>

