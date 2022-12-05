<%-- 
    Document   : home
    Created on : Jan 1, 2017, 12:19:18 AM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>blueBUS.com</title>
        <%
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        session.removeAttribute("A1");
        session.removeAttribute("A2");
        
        
        %>
          <%@include file="head.jsp" %>
        <script>
            
             //used to display date time picker
            $(function () {
             
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    minDate : new Date()
                });
            });
            
            ${msg1}  
                
            $(document).ready(function() {
   $('#frmlogin').formValidation({
       
       framework: 'bootstrap',
       container:'tooltip',
       icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
            txtemailid: {
                validators: {
                    notEmpty:{
                         message: 'Userid is required'
                    },
                    emailAddress: {
                        message:'Invalid format'
                    }
                }
            },
            txtpwd: {
                validators: {
                    notEmpty:{
                         message: 'Password is required'
                    }
                    
                }
            }
        }
       
        });
    });
    
        </script>
        
    </head>
    <body>
      
        
        <div class="row" style="padding-top: 100px">
             <div class="col-md-8">
                 <div class="container-fluid">
                     <div id="myCarousel" class="carousel slide" data-ride="carousel" >
                                                
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                          <li data-target="#myCarousel" data-slide-to="1"></li>
                          <li data-target="#myCarousel" data-slide-to="2"></li>
                          <li data-target="#myCarousel" data-slide-to="3"></li>
                          <li data-target="#myCarousel" data-slide-to="4"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active"  >
                            <img src="images/image1.jpg" alt="Chania" style="height:600px;width:100%">
                          </div>

                          <div class="item" >
                              <img src="images/image2.jpg" alt="Chania" style="height:600px;width:100%"> 
                          </div>

                          <div class="item">
                              <img src="images/image3.jpg" alt="Flower" style="height:600px;width:100%">
                          </div>
                          
                          <div class="item">
                              <img src="images/image4.jpg" alt="Flower" style="height:600px;width:100%">
                          </div>
                            
                          <div class="item">
                              <img src="images/image5.jpg" alt="Flower"  style="height:600px;width:100%">
                          </div>
                        </div>
    
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"  ></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right " aria-hidden="true"  ></span>
                        <span class="sr-only">Next</span>
                      </a>
                </div>
            </div>
             </div>
                      
         
            
            <div class="col-md-3">
                 <div class="panel panel-primary" >
                     <div class="panel-heading" style="font-weight: bolder;  ">Travel with us</div>
                     <div class="panel-body">
                <form id="frmbook" name="frmbook" action="BookBus" method="post" role="form">
                     <div class="form-group">
                        <label for="txtsource">Source:</label>
                         <div class="form-group">
                            <input type="text" class="form-control" id="txtsource" name="txtsource">
                         </div>
                      </div>
                      <div class="form-group">
                        <label for="txtdestination">Destination:</label>
                        <div class="form-group">
                                <input type="text" class="form-control" id="txtdestination" name="txtdestination">
                        </div>
                      </div>
                      <div class="form-group">  
                        <label  for="date">Journey Date:</label>
                            
                                <div class='input-group date' id='datetimepicker1' >
                                    <input type='text' class="form-control" name="txtdate"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            
                      </div>
                      <button type="submit" class="btn btn-success" style="width:100%"><span class="glyphicon glyphicon-search"></span> Search Buses</button>
                     
                </form>
            </div>
             
         </div>
         </div>
         </div>
    </body>
</html>
