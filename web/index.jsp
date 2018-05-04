<%-- 
    Document   : newjsp
    Created on : Mar 2, 2015, 5:27:27 PM
    Author     : Yilun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
    </head>
   
    <body>
        <h2>book search and availability</h2>
        <!--use book id and book title to search book-->
   
        <form name="flight query" action="bookdisplay.jsp" method="POST">
            
            <table border="0">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>book id:</td>
                        <td><input type="text" name="book_id" value="" /></td>
                    </tr>
                    <tr>
                        <td>book title:</td>
                        <td><input type="text" name="title" value="" /></td>
                    </tr>
                    <tr>
                 <td>
                  <input type="submit" value="bookid search" name="submit" />
                </td>
                </tr>
                     
                     
                </tbody>
           
            </table>
            
                </form>
            
            
        <form name="flight query" action="bookdisplay1.jsp" method="POST">
            <!--use full author name or part of author name to search -->
        <tr>
            <table border="0">
                        <td>author:</td>
                        <td><input type="text" name="author_name" value="" /></td>
                        
                    </tr>   
                    <tr>
                 <td>
                  <input type="submit" value="book author search" name="submit" />
                </td>
                </tr>
                    </table>
                    
        </form>
        
        
            
        <h3>Checking out books</h3>
        <form name="fare" action="bookdisplay2.jsp" method="POST">
            <!--input book id , branch id and card no to check out book-->
            <table border="0">                
                <tbody>
                    <tr>
                        <td>book id :</td>
                        <td><input type="text" name="book_id" value="" size="25" /></td>
                    </tr> 
                    <tr>
                        <td>branch id :</td>
                        <td><input type="text" name="branch_id" value="" size="25" /></td>
                    </tr>
                     <tr>
                        <td>card No. :</td>
                        <td><input type="text" name="card_no
                                   " value="" size="25" /></td>
                    </tr>
                </tbody>
            </table>
          
            <input type="submit" value="create new book loan" name="Submit" />            
        </form>
        
        
          <h2>Checking in books</h2>
        <form name="seats" action="bookdisplay3.jsp" method="POST">
            <!--check in book-->
            <table border="0">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>book id :</td>
                        <td><input type="text" name="book_id" value="" /></td>
                    </tr>
                    <tr>
                        <td>card No. :</td>
                        <td><input type="text" name="card_no" value="" /></td>
                    </tr>
                    <tr>
                        <td>borrower name. :</td>
                        <td><input type="text" name="borrower_name" value="" /></td>
                    </tr>  
                      <tr>
                        <td>check in day :</td>
                        <td><input type="date" name="date" value="" /></td>
                    </tr>  
                </tbody>
            </table>
            <input type="submit" value="check in" name="submit" />          
        </form>
            
        
        
        
        
        
        <h4>Borrower Management</h4>
        <form name="passengers" action="boookdisplay4.jsp" method="POST">
            <!--borrower managment, input information to get a record in database -->
            <table border="0">                
                <tbody>
                    <tr>
                        <td> Names: </td>
                        <td><input type="text" name=" " value="" size="25" /></td>
                     </tr>   
                     
                        
                        <tr>
                        <td>Address: </td> 
                        <td><input type="text" name="text"></td>
                        </tr>
                    
                </tbody>
            </table>
            
            <input type="submit" value="create new borrower" name="Submit" />            
        </form>
        
        
    </body>
</html>
            
            
