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
        
        <h1>checking out books information</h1>
    </body>
    <%!
    public class BookName{
        String URL = "jdbc:mysql://localhost:3306/bookstore";
        String USERNAME = "root";
        String PASSWORD = "";
        
        Connection connection = null;
        PreparedStatement loanNo = null;
        PreparedStatement availableNo = null;
        PreparedStatement insertBookNames = null;
        ResultSet resultSet = null;
        
        public BookName()
        {
           try {
               connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
               loanNo = connection.prepareStatement("select count(*) from book_loans where card_no = ?");
               availableNo = connection.prepareStatement("SELECT no_of_copies - (select count(*) from book_loans where book_loans.book_id = books.book_id and book_loans.branch_id = book_copies.branch_id) as available_copies FROM bookstore.books,bookstore.book_authors,bookstore.book_copies,bookstore.book_loans where books.book_id = book_copies.book_id and books.book_id = book_authors.book_id AND book_copies.branch_id = ? and books.book_id = ?");

               insertBookNames = connection.prepareStatement(
           
                      "INSERT INTO bookstore.book_loans (book_id,branch_id,card_no,date_out, due_date) VALUES (?, ?, ?, curDATE(), ADDDATE(curDate(), INTERVAL 14 DAY));");
                         
  
           }
           catch (SQLException e)
           {
               e.printStackTrace();
           }
           }
        
        public int getLoanNo(String card_no) {
            int no = 0;
            try {
                loanNo.setString(1, card_no);
                resultSet = loanNo.executeQuery();
                resultSet.next();
                no = resultSet.getInt(1);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return no;
        }
        
        public int getAvailableNo (String branch_id, String book_id) {
            int no =0;
            try {
                availableNo.setString(1, branch_id);
                availableNo.setString(2, book_id);
                resultSet = availableNo.executeQuery();
                resultSet.next();
                no = resultSet.getInt(1);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return no;
        }
       public int getBookNames(String book_id,String branch_id,String card_no)
               
               {
                   int result =0;
                   try
                   {
                        insertBookNames.setString(1,book_id);
                        insertBookNames.setString(2,branch_id); 
                        insertBookNames.setString(3,card_no); 
                         
                         result = insertBookNames.executeUpdate();
                          }
                   catch (SQLException e)
                   {
                              e.printStackTrace();
                              
               }
                   return result;
               }
  
    }
    %>
    <%
       int result = 0 ;
       int loanNo = 0;
       int availableNo = 0;
       if (request.getParameter("Submit")!=null)
       {
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
      loanNo = bookName.getLoanNo(card_no);
      availableNo = bookName.getAvailableNo(branch_id, book_id);
      if(loanNo >= 3) {%>
      <p>You already borrowed three books, please return them first</p>
      <%}
      else if(availableNo <= 0) {%>
      <p>there is no copy available in this branch, please try others</p>
      <%} else {
      
      result  = bookName.getBookNames(book_id,branch_id,card_no);
      
       

%> 
<p>You successfully loaned the book!</p>

        <%}}%>

</html>
