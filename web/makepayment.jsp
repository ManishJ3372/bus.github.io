<%-- 
    Document   : bookflight1
    Created on : Feb 1, 2017, 4:26:46 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="head.jsp" %>
         <Script>
             $(document).ready(function() {
    $('#frmpayment')
        .formValidation({
            framework: 'bootstrap',
            live:'enabled',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                txtemailid: {
                validators: {
                    notEmpty:{
                         message: 'The emailid is required'
                    },
                    emailAddress: {message: 'Invalid emailid format'}
                }
            },
                txtcc: {
                    threshold: 16,
                    validators: {
                        creditCard: {
                            message: 'The credit card number is not valid'
                        },
                        notEmpty: {
                            message: 'The credit card number is required'
                        
                        }
                    }
                },
                
                txtcvv: {
                threshold: 3,
                validators: {
                    cvv: {
                        creditCardField: 'txtcc',
                        message: 'The CVV number is not valid'
                    },
                    notEmpty: {
                        message: 'The CVV number is required'
                        
                    }
                }
            },
            txtname: {
             validators: {
                    notEmpty: {
                        message: 'The name value is required'
                        
                    },
                    regexp: {
                        regexp: /^[a-zA-Z ]+$/,
                        message: 'The name can only consist of alphabetical'
                    }
                }
            },
            select_year:{
                validators: {
                    callback:{
                        callback:function(value,validator,$field){
                            if(value==='Select year')
                            {
                                return{
                                    valid:false,
                                    message:'Invalid year'
                                };
                            }
                             return true;
                        }
                    }
                   
                        
                }
            },
            select_month:{
                validators: {
                    callback:{
                        callback:function(value,validator,$field){
                            if(value==='Select month')
                            {
                                return{
                                    valid:false,
                                    message:'Invalid month'
                                };
                            }
                            year= validator.getFieldElements('select_year').val(),
                            currentyear  = new Date().getFullYear(),
                            currentmonth = new Date().getMonth() + 1;
                            if(year===currentyear && value<currentmonth)
                            {
                                return{
                                    valid:false,
                                    message:'Card expired'
                                };
                            }
                             return true;
                        }                       
                            
                        }
                    }
                   
                        
                    }
                   
                        
                }
                  
         })
                 
        .on('success.validator.fv', function(e, data) {
            if (data.field === 'txtcc' && data.validator === 'creditCard') {
                var $icon = data.element.data('fv.icon');
                // data.result.type can be one of
                // AMERICAN_EXPRESS, DINERS_CLUB, DINERS_CLUB_US, DISCOVER, JCB, LASER,
                // MAESTRO, MASTERCARD, SOLO, UNIONPAY, VISA

                switch (data.result.type) {
                    case 'AMERICAN_EXPRESS':
                        $icon.removeClass().addClass('form-control-feedback fa fa-cc-amex fa-2x pull-left');
                        $icon.attr('style','padding-top:3px;');
                        break;

                    case 'DISCOVER':
                        $icon.removeClass().addClass('form-control-feedback fa fa-cc-discover fa-2x pull-left');
                        $icon.attr('style','padding-top:3px;');
                        break;

                    case 'MASTERCARD':
                    case 'DINERS_CLUB_US':
                        $icon.removeClass().addClass('form-control-feedback fa fa-cc-mastercard fa-2x pull-left');
                        $icon.attr('style','padding-top:3px;');
                        break;

                    case 'VISA':
                        $icon.removeClass().addClass('form-control-feedback fa fa-cc-visa fa-2x pull-left');
                        $icon.attr('style','padding-top:3px;');
                        break;

                    default:
                        $icon.removeClass().addClass('form-control-feedback fa fa-credit-card fa-2x pull-left');
                        $icon.attr('style','padding-top:3px;');
                        break;
                }
                data.fv.disableSubmitButtons(false);
            }
        })
        .on('err.field.fv', function(e, data) {
            if (data.field === 'txtcc') {
                var $icon = data.element.data('fv.icon');
                $icon.removeClass().addClass('form-control-feedback glyphicon glyphicon-remove');
               
            }
           data.fv.disableSubmitButtons(false);
        });
    
        
});


     </script>
         
    </head>
    <body> 
        <%@page import="java.util.*" %>
        <div class="container" style="padding-top: 100px">
            <div class="row" >
                <div class="col-md-offset-4 col-md-4">
                       
                          <div class="panel panel-primary" >
                    <div class="panel-heading" style="font-weight: bolder;">Make Payment</div>
                     <div class="panel-body text-primary" >
                         <form class="form-horizontal" role="form" id="frmpayment" action="MakePayment2" >
                        
                    
                    <div class="form-group">
                        <div class="col-md-12"> <input type="text" class="form-control " name="txtcc" id="txtcc" placeholder="Enter credit card number"></div>
                     </div>
                   
                    
                    <div class="form-group">
                        <div class="col-md-6">  <select class="form-control" name="select_year" id="select_year">
                                <option selected="true">Select year</option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR) %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR) %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+1 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+1 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+2 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+2 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+3 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+3 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+4 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+4 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+5 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+5 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+6 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+6 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+7 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+7 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+8 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+8 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+9 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+9 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+10 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+10 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+11 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+11 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+12 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+12 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+13 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+13 %></option>
                                <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+14 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+14 %></option>
                                 <option value="<%=new java.util.GregorianCalendar().get(Calendar.YEAR)+15 %>"><%=new java.util.GregorianCalendar().get(Calendar.YEAR)+15 %></option>
                            </select>
                            
                        </div>
                       
                        
                        
                        
                        <div class="col-md-6"> <select class="form-control" name="select_month" id="select_month">
                                <option selected="true" >Select month</option>
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                            
                       </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-8">  <input type="text" class="form-control" name="txtname"  placeholder="Name on card"></div>
                       <div class="col-md-4"> <input type="text" class="form-control" name="txtcvv"  placeholder="CVV"></div>
                    </div>
                            
                    <div class="form-group">
                        <div class="col-md-12">  <input type="text" class="form-control" name="txtemailid"  placeholder="Enter emailid to send your ticket on"></div>
                       
                    </div>
                        
                      <div class="form-group">
                        <div class="col-md-12"><button type="submit" class="btn btn-success btn-block" id="btnsubmit" >Pay <i class="fa fa-rupee"></i>${cost} </button></div>
                       
                    </div>                           
                    
                    

                          
                      </div>
                    </div>
                       
                    </div>
                       ${data}
                        
                       
                        <input type="hidden" name="date" value="${date}"/>
                        <input type="hidden" name="busno" value="${busno}"/>
                        <input type="hidden" name="cost" value="${cost}"/>
                   </form>
               
                </div>
          </div>
             
                   
                   
               
               
       
    </body>
</html>
