<%-- 
    Document   : viewtests
    Created on : Mar 19, 2017, 9:56:52 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <%@include file="mainpage.jsp" %>
       
        <script>
            $(document).ready(function(){
               
                $("a[href='viewbooking_user.jsp']").css('background-color', 'red');
                
            });
            
            $(document).ready(function() {
          
              
               $("#d1").load("ViewBooking_User");
               
					
          
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

        <div class="container-fluid" >
         <div class="row" >
              
             <div class="col-md-offset-2 col-md-4">
        <div id="d1">
        </div>
             </div>
         </div>
        </div>
    </body>
</html>
