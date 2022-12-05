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
            $("#txtpic").change(function(event){
                if(parseInt($(this).get(0).files.length)==1)
                {
                    var tmppath1 = URL.createObjectURL($(this).get(0).files[0]);
                   
                    
                    $("#img1").fadeIn("fast").attr('src',tmppath1 )
                    
                }
                else
                {
                         alert("Please select a file");
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
    <div class="container-fluid" style="padding-top: 100px">
        <div class="row">
            <div class="col-md-2">
                
                    <img class="img-circle" style="width:70px;height:70px;float: left;" src="GetImage?p1=<%= session.getAttribute("A1")%>" ></img>
                    <div style="float:right;padding-top: 15px;"><b>Welcome, admin </b> <br/>
                        <i class="fa fa-circle" style="color:green;font-size: 10px"></i> Online</div>
                
            </div>
            </div>
            <div class="row" style="padding-top: 20px">
            <div class="col-md-2">
                <ul class="nav nav-pills nav-stacked text-center" >
                    
                      <li><a href="addbus.jsp" style="color: white;background-color: #286090">Add Bus</a></li>
                      
                      <li><a href="viewbus.jsp" style="color: white;background-color: #286090">View/Delete Bus</a></li>
                      <li><a href="viewbooking.jsp" style="color: white;background-color: #286090">View Bookings</a></li>
                      <li><a href="searchbooking.jsp" style="color: white;background-color: #286090">Search Booking</a></li>
                      <li><a href="viewcustomers.jsp" style="color: white;background-color: #286090">View All Customers</a></li>
                      <li><a href="viewfeedback.jsp" style="color: white;background-color: #286090">View Feedback</a></li>
                      <li><a href="changepassword_admin.jsp"  style="color: white;background-color: #286090">Change Password</a></li>
                      <li><a  href="uploadpic_admin.jsp"  style="color: white;background-color: #286090">Upload photo</a></li>
                      <li><a href="home.jsp"  style="color: white;background-color: #286090">Logout</a></li>
                </ul>
            </div>
           
            
    </body>
</html>
