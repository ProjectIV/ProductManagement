<%-- 
    Document   : homeView
    Created on : Dec 1, 2020, 8:26:55 PM
    Author     : t1804i_VPHung
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
     <meta charset="UTF-8">
     <title>Home Page</title>
  </head>
  <body>
 
     <jsp:include page="_header.jsp"></jsp:include>
     <jsp:include page="_menu.jsp"></jsp:include>
    
      <div class="container">
         <h3 style="text-align: center; margin-top: 40px">Admin Home Page</h3>
      
      This is admin home page<br><br>
      <b>It includes the following functions for tables:</b>
      <ul>
         <li>View list</li>
         <li>Search</li>
         <li>Create</li>
         <li>Edit</li>
      </ul>
      </div>
 
     <jsp:include page="_footer.jsp"></jsp:include>
 
  </body>
</html>
