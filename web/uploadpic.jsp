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
          <%@include file="mainpage.jsp" %>
        <script>
            $(document).ready(function() {
            ${msg}
        });
            $(document).ready(function(){
               
                $("a[href='uploadpic_admin.jsp']").css('background-color', 'red');
                
            });
            
/*function call()
{
    if(parseInt($("#txtpic").get(0).files.length)==0)
    {

        return false;
    }
    else
        {
            return true;
        }
}*/
            
            $(document).ready(function() {
    $('#frmpic').formValidation({
       
        framework: 'bootstrap',
       
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
              txtpic: {
               validators: {
                    
                    notEmpty: {
                        message: 'Please select an image'
                    },
                    file: {
                        extension: 'jpeg,jpg,png',
                        type: 'image/jpeg,image/png',
                        maxSize: 4294967295,   
                        message: 'The selected file is not valid'
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
              
             <div class="col-md-offset-2 col-md-4">
                 
                 <div class="panel panel-primary" >
                   <div class="panel-heading" style="font-weight: bolder;">Upload Profile Pic</div>
                    <div class="panel-body">
                    <form role="form"  id="frmpic" action="UploadPic" method="post" enctype="multipart/form-data" >
                                        <div class="form-group form-group-lg">
                                            <label  for="txtpic">Select Profile Pic:</label>
                                             
                                                   <label class="btn btn-default btn-file" style="width:80%;height:35px">
                                                       Browse <input type="file" style="opacity:0;" id="txtpic" name="txtpic"></input>
                                                    </label>
                                                 <img id="img1" class="zoom" style="width:50px;height:50px;">
                                                                                             
                                      </div>
                                     <div class="form-group text-center">
                                            <button type="submit"  class="btn btn-success center-block"  style="width:50%"  >Upload</button>
                                        </div>
                                  </form>  
            </div>
             
         </div>
         </div>
<div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color: green">Success</h4>
      </div>
      <div class="modal-body">
        <p>Pic uploaded successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </body>
</html>





