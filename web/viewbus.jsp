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
       <%@include file="mainpage_admin.jsp" %>
        <script>
              
        
            $(document).ready(function(){
               
                $("a[href='viewbus.jsp']").css('background-color', 'red');
                
            });
            
            $(document).ready(function() {
          
              
               $("#d1").load("ViewBus");
               
					
          
         });
         
         $(document).ready(function(){
            $('body').on('click','.btn',function(){
               
             var currentRow=$(this).closest("tr");
             var col1=currentRow.find("td:eq(0)").text();  
           
             $("#d1").load("DeleteBus?busno="+col1);  
                
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
              
             <div class="col-md-offset-2 col-md-4">
        <div id="d1">
          
        </div>
                
             </div>
         </div>
        </div>
        <div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    

  </div>
</div>
    </body>
</html>
