<%-- 
    Document   : confirmbooking
    Created on : Mar 29, 2017, 1:39:17 AM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="head.jsp" %>
    </head>
    <body>
        <div class="container" style="padding-top: 100px">
         <div class="row">
            <div class="col-md-offset-3 col-md-6">
         <div class="panel panel-primary" >
                   <div class="panel-heading" style="font-weight: bolder;">Booking Details</div>
                    <div class="panel-body">
                        <span class="pull-left" style="font-size: 20px;font-weight: bolder"> ${source}</span> <i class="fa fa-long-arrow-right" style="font-size: 30px;padding-left: 30%" ></i><span class="pull-right" style="font-size: 20px;font-weight: bolder"> ${destination}</span>
               <br/>
               <span class="pull-left"> (${starttime})</span><span style="padding-right:10px"></span> <span class="pull-right"> (${endtime})</span>
               
                        <div class="text-success" style="font-size: 20px;padding-top: 20px">
                        <b>Booking ID:</b> ${bid}<br/>
                        <b>Journey Date:</b> ${j_date}<br/>
                        <b>Booking Date:</b> ${b_date}<br/>
                        <b>Amount Paid:</b> <i class='fa fa-rupee'></i>${cost}<br/>
                        
                      
                        <a class="pull-right" style="font-size: 14px" data-toggle="collapse" href="#demo">Travellers Details</a>
                        <br/>
                        <div id="demo" class="collapse" style="font-weight: normal">
                            <hr style="height: 2px;border:none;background-color:gray"/>
                                ${data}
                        </div>
                        
                    </div>
                 </div>
                </div>
                </div>
        </div>
    </body>
</html>
