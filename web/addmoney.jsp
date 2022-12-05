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
       <%@include file="mainpage.jsp" %>
       
       <script>
            
$(document).ready(function() {
    $('#frmmywallet')
        .formValidation({
            framework: 'bootstrap',
            live:'enabled',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                txtamt: {
                      validators: {
                         notEmpty: {
                            message: 'The amount value is required'
                        
                        },
                        digits:{
                            message:'Enter valid amount'
                        },
                        greaterThan:{
                            value:1,
                            message:'Amount should be greater than 0'
                        }
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
                            if(value=='Select year')
                            {
                                return{
                                    valid:false,
                                    message:'Invalid year'
                                }
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
                            if(value=='Select month')
                            {
                                return{
                                    valid:false,
                                    message:'Invalid month'
                                }
                            }
                            year= validator.getFieldElements('select_year').val(),
                            currentyear  = new Date().getFullYear(),
                            currentmonth = new Date().getMonth() + 1;
                            if(year==currentyear && value<currentmonth)
                            {
                                return{
                                    valid:false,
                                    message:'Card expired'
                                }
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
        <div class="container-fluid" >
         <div class="row" >
            <div class="col-md-4 col-md-offset-2" style="margin-top: -10px;" >
                ${msg}
                <div class="col-md-8" style="margin-left: -10px">
                    <legend style="border-bottom:2px solid;width:280px" >My Wallet</legend></div>
                   
                
                <form class="form-horizontal" role="form" id="frmmywallet" action="AddMoney" >
                    <div class="form-group">
                        <div class="col-md-8"> <input type="text" class="form-control " name="txtamt"  placeholder="Enter amount"></div>
                     </div>
                    
                    <div class="form-group">
                        <div class="col-md-8"> <input type="text" class="form-control " name="txtcc" id="txtcc" placeholder="Enter credit card number"></div>
                     </div>
                   
                    
                    <div class="form-group">
                        <div class="col-md-4">  <select class="form-control" name="select_year" id="select_year">
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
                            <div id="error" style="color:darkred  ;font-size: 12px"></div>
                        </div>
                       
                        
                        
                        
                        <div class="col-md-4"> <select class="form-control" name="select_month" id="select_month">
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
                            <div id="error1" style="color:darkred;font-size: 12px"></div>
                       </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-5">  <input type="text" class="form-control" name="txtname"  placeholder="Name on card"></div>
                       <div class="col-md-3"> <input type="text" class="form-control" name="txtcvv"  placeholder="CVV"></div>
                    </div>
                        
                      <div class="form-group">
                        <div class="col-md-8"><button type="submit" class="btn btn-success btn-block" id="btnsubmit" >Submit</button></div>
                       
                    </div>                           
                                      
                     </form>
            </div>
               
            </div>
        </div>
    </body>
</html>
