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
    
      <h3>Home Page</h3>
      
      This is demo Simple web application using jsp,servlet &amp; Jdbc. <br><br>
      <b>It includes the following functions:</b>
      <ul>
         <li>Login</li>
         <li>Storing user information in cookies</li>
         <li>List</li>
         <li>Create</li>
         <li>Edit</li>
         <li>Delete</li>
      </ul>
 
     <jsp:include page="_footer.jsp"></jsp:include>
 
  </body>
</html>