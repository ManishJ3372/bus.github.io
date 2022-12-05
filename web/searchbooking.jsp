<%-- 
    Document   : newpaper
    Created on : Feb 2, 2017, 2:13:50 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <%@include file="mainpage_admin.jsp" %>
        <script>
            
             //used to display date time picker
            $(function () {
             
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    minDate : new Date()
                });
            });
            
            $(document).ready(function() {
           $('#search').click(function(){
               $('#frmsearchbooking').bootstrapValidator('validate');
               var isValid = $('#frmsearchbooking').data('formValidation').isValid();
              
               if (isValid==true) 
               {
               
               var a=$('input[name="txtdate"]').val();
              
               $("#d1").load("SearchBooking?p1="+a);
               }
               else
                   {
                       $("#d1").empty();
                   }
            }); 
					
          
         });



            $(document).ready(function(){
               
                $("a[href='searchbooking.jsp']").css('background-color', 'red');
                
            });
            
            
         
          
         
         $(document).ready(function() {
    $('#frmsearchbooking').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            txtdate: {
                validators: {
                    notEmpty: {
                        message: 'Please select date'
                        
                    }
                    
                    
                    
                }
            }
            
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

      <div class="container-fluid" >
         <div class="row" >
             
             <div class="col-md-offset-2 col-md-5">
                 
                 <div class="panel panel-primary" >
                   <div class="panel-heading" style="font-weight: bolder;">Search Test  </div>
                    <div class="panel-body" >
                    <form role="form" class="form-inline"  id="frmsearchbooking" method="post"  >
                            <div class="form-group">
                                <label for="txtdate">Select Date:</label>
                               
                                          
                                             <div class='input-group date' id='datetimepicker1' >
                                                <input type='text' class="form-control" name="txtdate" placeholder="Select a Date">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                            
                                      

                            </div>


                        
                        <button type="button"  class="btn btn-success" id="search" style="float: right"  >Search</button>
                           
                      </form>
            </div>
             
         </div>
                 <div id="d1">
                                
                            </div>
         </div>

    </body>
</html>





