<%-- 
    Document   : mainpage
    Created on : Feb 20, 2017, 3:04:27 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <%@include file="head.jsp" %>
        <script>
          
       
 $(document).ready(function(){
               $( "#s2" ).click(function() {
   var color = $( "#s2" ).css( "background-color" );
    
     if (color === 'rgb(40, 96, 144)') {
         
      $("#s2").css('background-color','red');
      $("i").removeClass("fa fa-caret-down");
      $("i").addClass("fa fa-caret-up");
   }
   else {
      $("#s2").css('background-color','rgb(40, 96, 144)');
      $("i").removeClass("fa fa-caret-up");
      $("i").addClass("fa fa-caret-down");
   }
});
               
                
            });

            


       </script>
    </head>
    
    <body>
        <%
        
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        if((String)session.getAttribute("A1")==null)
               {
            response.sendRedirect("home.jsp");
            return;
               }
       
        %>

        <%@page import="java.util.*" %>
    <div class="container-fluid" style="padding-top: 100px;">
        <div class="row">
            <div class="col-md-2">
                
                    <img class="img-circle" style="width:70px;height:70px;float: left;" src="GetImage?p1=<%= session.getAttribute("A1")%>" ></img>
                    <div style="float:right;padding-top: 15px;"><b>Welcome, <%= session.getAttribute("A2")%> </b> <br/>
                        <i class="fa fa-circle" style="color:green;font-size: 10px"></i> Online</div>
                
            </div>
            </div>
            <div class="row" style="padding-top: 20px">
            <div class="col-md-2">
                <ul class="nav nav-pills nav-stacked text-center" id="s1" >
                    
                      
                      
                      <li><a href="viewbooking_user.jsp" style="color: white;background-color: #286090">View Bookings</a></li>
                      <li><a href="changepassword_user.jsp"  style="color: white;background-color: #286090">Change Password</a></li>
                      
                      <li><a  href="uploadpic.jsp"  style="color: white;background-color: #286090">Upload photo</a></li>
                      
                      <li><a href="home.jsp"  style="color: white;background-color: #286090">Logout</a></li>
                      
                </ul>
                
                
            </div>
           
            
    </body>
</html>
