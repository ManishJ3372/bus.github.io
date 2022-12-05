<%-- 
    Document   : addflight
    Created on : Mar 10, 2017, 1:23:37 AM
    Author     : Administrator
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
    $('#frmaddbus').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
            txtsource: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
	    txtdestination: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            txtbusno: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    }
                 }
            },
	    
	     txtcost: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    },
		    digits:{},
		    greaterThan: {
                        value: 1,
                        message: 'The value must be greater than or equal to 1'
                    }
                 }
            },
	     txtseats: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    },
		    digits:{},
		    greaterThan: {
                        value: 1,
                        message: 'The value must be greater than or equal to 1'
                    }
                 }
            },
	    txtdeparturetime: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    }
                 }
            },
	    txtarrivaltime: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    }
                 }
            }
           
            
        }
          
    });
});
            $(document).ready(function() {
            ${msg}
        });
        
            $(function () {
             
                $('#datetimepicker1').datetimepicker({
                    format: 'HH:mm'
                    
                });
            });
            
             $(function () {
             
                $('#datetimepicker2').datetimepicker({
                    format: 'HH:mm'
                   
                });
            });
            
            $(document).ready(function(){
               
                $("a[href='addbus.jsp']").css('background-color', 'red');
                
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

        <div class="row" >
        <div class=" col-md-offset-2 col-md-4">
                 <div class="panel panel-primary" style="overflow-y: auto; height:420px; ">
                     <div class="panel-heading" style="font-weight: bolder;  "><span class="glyphicon glyphicon-plus"></span> Enter Bus details</div>
                     <div class="panel-body">
                <form id="frmaddbus"  action="AddBus" method="get" role="form">
                     <div class="form-group">
                        <label for="txtsource">Source:</label>
                         <input type="text" class="form-control"  name="txtsource">
                      </div>
                      
                      <div class="form-group">
                        <label for="txtdestination">Destination:</label>
                        <input type="text" class="form-control"  name="txtdestination">
                        
                      </div>
                    
                    <div class="form-group">
                        <label for="txtbusno">Bus no.:</label>
                        <input type="text" class="form-control"  name="txtbusno">
                        
                    </div>
                    
                    <div class="form-group">
                        <label for="txtcost">Cost:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-rupee"></i></span>
                            <input type="text" class="form-control" id="txtcost" name="txtcost">
                    
                    </div>

                        
                    </div>
                    
                    <div class="form-group">
                        <label for="txtdeparturetime">Departure time:</label>
                            <div class='input-group date' id='datetimepicker1' >
                        <input type='text' class="form-control" name="txtdeparturetime"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>

                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtarrivaltime">Arrival time:</label>
                            <div class='input-group date' id='datetimepicker2' >
                        <input type='text' class="form-control" name="txtarrivaltime"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>

                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtseats">No of Seats:</label>
                         <input type="text" class="form-control"  name="txtseats">
                         </div> 
                      <button type="submit" class="btn btn-success" style="width:100%"><span class="glyphicon glyphicon-plus-sign"></span> Add Bus</button>
                       
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
        <h4 class="modal-title">Success</h4>
      </div>
      <div class="modal-body">
        <p>Bus added successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

    </body>
</html>
