<%-- 
    Document   : head
    Created on : Jan 9, 2017, 4:35:41 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>blueBUS.com</title>
       
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/breadcrumbs.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/formValidation.css"/> <%--used for validation--%>
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/jquery.dataTables.min.css"/><%-- used for table sorting --%>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/typeaheadjs.css"/><%-- used for type ahead(to retain styling for text box) --%>
        
        <script src="bootstrap-3.3.7-dist/js/jquery-3.1.1.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
        <script src="bootstrap-3.3.7-dist/js/moment.js"></script>
        <script src="bootstrap-3.3.7-dist/js/formValidation.js"></script> <%--used for validation--%>
        <script src="bootstrap-3.3.7-dist/js/bootstrap_1.js"></script>  <%--used for validation--%>
        <script src="bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.js"></script>
        <script src="bootstrap-3.3.7-dist/js/jquery.dataTables.js"></script> <%-- used for table sorting --%>
        <script src="bootstrap-3.3.7-dist/js/typeahead.bundle.js"></script><%-- used for type ahead --%>
        <script type="text/javascript" src="city.json"></script>
         
        
       <script>
            
          function ch()
             {
                 $("#a1").attr("href", "home1.jsp");
             }

             
$(document).ready(function(){
    $("#login").click(function(){
        $("#modal_login").modal();
    });
});
</script>
    </head>
    
    <body>
        
       <nav class="navbar navbar-inverse navbar-fixed-top " style="background-color: #286090;" >
  <div class="container-fluid" >
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" >
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
        <div style="" ><a class="navbar-brand" href="home.jsp" style="color:white;font-weight:bolder;font-size: 30px;"><i class="fa fa-bus"></i> blueBUS.com </a></div>
    </div>
      <div class="collapse navbar-collapse" id="myNavbar"  >
      <ul class="nav navbar-nav">
        <li><a id="a1" href="home.jsp">Home</a></li>
        <li><a href="aboutus.jsp">About us</a></li>
        <li><a href="contactus.jsp">Contact us</a></li> 
        <li><a href="feedback.jsp">FeedBack/Suggestions</a></li> 
        <li><a href="workwithus.jsp">Work with us</a></li> 
         <%
            if(session.getAttribute("A1")!=null )
            {
                if(session.getAttribute("A1").toString().equalsIgnoreCase("admin@bus.com"))
                {

            %>
        
        <li><a href="mainpage_admin.jsp">Admin's Section</a></li> 
        <script>
               ch();
           </script>
        <%
               }
            else
            {
         %>
                <li><a href="mainpage.jsp">My Section</a></li>
                <script>
               ch();
           </script>
           <% 
           }
                               }
        %>
      </ul>
      <%
        if(session.getAttribute("A1")==null)
       {
           
     %>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#" id="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      
     <%
         }
        %>
        </div>
  </div>
</nav>
        
   <div class="modal fade" id="modal_login" role="dialog" style="padding-top: 100px" >
    <div class="modal-dialog  modal-sm " >
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <img src="images/av.png" class="img-circle" alt="Cinque Terre" width="80" height="80" style="display: block;margin: auto">
        </div>
        <div class="modal-body" >
             <div class="text-center" style="color: #ac2925"> ${msg}</div>
          <form name="frmlogin" id="frmlogin" role="form" action="Login">
            <div class="form-group">
              <label for="txt_username"  ><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="txt_username" name="txt_username"  >
            </div>
            <div class="form-group">
              <label for="txt_password" ><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="txt_password" name="txt_password" >
            </div>
             <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          
          <p> <a href="forgotpassword.jsp"> Forgot Password?</a></p>
        </div>
      </div>
    </div>
        </div>     
        
    </body>
</html>
