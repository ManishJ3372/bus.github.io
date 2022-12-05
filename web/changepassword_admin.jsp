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
            
            
              $(document).ready(function() {
            ${msg}
        });



            $(document).ready(function(){
               
                $("a[href='changepassword_admin.jsp']").css('background-color', 'red');
                
            });
            
            $(document).ready(function() {
    $('#frmchangepassword').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {

	     txtoldpassword: {
                validators: {
                    notEmpty: {
                        message: 'The password value is required'
                        
                    }
                 }
            },

             txtnewpassword: {
                validators: {
                    notEmpty: {
                        message: 'The new password value is required'
                        
                    },
                    different: {
                        field: 'txtoldpassword',
                        message: 'Old Password and new password cannot be same'

                    },
                    identical: {
                        field: 'txtreenterpassword',
                        message: 'The password and confirm password do not match'

                    },
                    stringLength: {
                        min: 8,
                        message: 'The password must be less than 8 characters'
                    }

                 }
            },
            txtreenterpassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password value is required'
                        
                    },
                    identical: {
                        field: 'txtnewpassword',
                        message: 'The password and confirm password do not match'

                    },
                    stringLength: {
                        min: 8,
                        message: 'The password must be less than 8 characters'
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
                   <div class="panel-heading" style="font-weight: bolder;">Change Password  </div>
                    <div class="panel-body" >
                    <form role="form"  id="frmchangepassword" action="ChangePassword_Admin" method="post"  >
                                        <div class="form-group">
                                            <label for="txtoldpin">Enter old password:</label>
                                            <input type="password" class="form-control" name="txtoldpassword" >
                                        </div>
                                     <div class="form-group ">
                                            <label for="txtnewpin">Enter new password:</label>
                                            <input type="password" class="form-control" name="txtnewpassword" >
                                        </div>
                                     <div class="form-group">
                                            <label for="txtreenterpin">Re-enter new password:</label>
                                            <input type="password" class="form-control" name="txtreenterpassword" >
                                        </div>
                                               
                                        <div class="form-group text-center">
                                            <button type="submit"  class="btn btn-success"  style="width:100%" >Change</button>
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
        <h4 class="modal-title" >${m2}</h4>
      </div>
      <div class="modal-body">
        <p>${m1}</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>  
    </body>
</html>





