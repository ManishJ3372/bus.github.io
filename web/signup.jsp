<%-- 
    Document   : signup
    Created on : Jan 9, 2017, 4:32:19 PM
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
      $(document).ready(function() {
    $('#frmsignup').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtfname: {
                validators: {
                    notEmpty: {
                        message: 'The first name is required'
                        
                    },
                    
                    
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The first name can only consist of alphabets'
                    }
                }
            },
            txtlname: {
                validators: {
                    notEmpty: {
                        message: 'The last name is required'
                        
                    },
                    
                    
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The last name can only consist of alphabets'
                    }
                }
            },
            txtemailid: {
                validators: {
                    notEmpty:{
                         message: 'The emailid is required'
                    },
                    emailAddress: {message: 'Invalid emailid format'}
                }
            },
             txtmobile: {
                validators: {
                    notEmpty: {},
                    digits: {},
                    phone: {
                        country: 'IN'
                    }
                }
            },
            txtpassword: {
                validators: {
                    notEmpty: {
                        message: 'The password value is required'
                        
                    },
                   stringLength: {
                        min: 8,
                        message: 'The password must be less than 8 characters'
                    },

                    identical: {
                        field: 'txtconfirmpassword',
                        message: 'The password and confirm password do not match'

                    }
                 }
            },
            txtconfirmpassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password value is required'
                        
                    },
                    stringLength: {
                        min: 8,
                        message: 'The password must be less than 8 characters'
                    },

                    identical: {
                        field: 'txtpassword',
                        message: 'The password and confirm password do not match'

                    }
                }
            },
            txtsecretquestion: {
                validators: {
                    notEmpty: {
                        message: 'A secret question is required'
                        
                    }
                    
                }
            },
            txtanswer: {
                validators: {
                    notEmpty: {
                        message: 'The answer value is required'
                        
                    }
                    
                }
            }
            
        }
          
    });
});
        
    </script>
    </head>
    <body>
      
        
        <div class="row" style="padding-top:100px" >
         <div class="col-md-4 col-md-offset-4" >
           ${errormsg}
             <legend style="border-bottom:2px solid">Enter details</legend>
                  <form role="form" name="frmsignup" id="frmsignup" action="Signup" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtfname" placeholder="Enter first name" value="${fname}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtlname" placeholder="Enter last name"  value="${lname}">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="txtemailid"  placeholder="Enter emailid" ${autofocus}>
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" name="txtmobile" placeholder="Enter mobile no" maxlength="10"  value="${mobile}">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="txtpassword" placeholder="Enter password" onCopy="return false" onPaste="return false">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="txtconfirmpassword" placeholder="Enter confirm password" onCopy="return false" onPaste="return false">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtsecretquestion" placeholder="Enter secret question" >
                    </div>
                     <div class="form-group">
                        <input type="text" class="form-control" name="txtanswer" placeholder="Enter answer" >
                    </div>                   
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-success" id="register" style="width:100%">Register</button>
                    </div>
              </form>                            
            </div>
    </div>
    </body>
</html>
