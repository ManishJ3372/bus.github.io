<%-- 
    Document   : bookflight
    Created on : Jan 19, 2017, 3:27:57 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="head.jsp" %>
        <script lang="java">
                       
              $(document).ready(function(){
                $('#bustable').dataTable({
                
                    paging:   false,
                    searching:false,
                    info:false
                });
             });
             
             
           $(document).ready(function(){
            $('button').click(function(){
                //var val= this.parentNode.parentNode.cells[2].innerHTML;
               // alert( $(this).index());
                //alert(val);
               // var $row = $(this).closest("tr");
                //$td1 = $row.find("td:nth-child(2)");
                //alert(td1.text());
               
                var currentRow=$(this).closest("tr");
                var col1=currentRow.find("td:eq(3)").text(); 
                var d=$("input[name=h1]").val();
                var a=$("input[name=h2]").val();
                var c=$("input[name=h3]").val();
                var i=$("input[name=h4]").val();
                var cl=$("input[name=h5]").val();
              // alert(d);
                if(col1!=="")
                    {
                        window.location.href='makepayment.jsp?busno='+col1+'&date='+d;
                    }
                
            });
        });
        
       
        
        $(document).ready(function() {
   $('#frmbook').formValidation({
      
       framework: 'bootstrap',
       container:'tooltip',
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
                         message: 'Source value is required'
                    }
                }
            },
             txtdestination: {
                validators: {
                    notEmpty:{
                         message: 'Destination value is required'
                    }
                    
                }
            }
            
        }
       

   });
    
    });
   
        </script>
    </head>
    <body>
        
     
        <div class="container" style="padding-top: 100px">
            <div class="row">
                ${errormsg}
            
       <p class="text-info" style="font-weight: bold;font-size: 20px">${source} <i class="fa fa-long-arrow-right"></i> ${destination} </p> 
       
       <p class="text-info" style="font-weight: bold;font-size: 15px; ">${date} 
             
       ${data}
        </div>
       <input type="hidden" name="h1" value="${date}"/>
       
       </div>
    </body>
    
</html>
