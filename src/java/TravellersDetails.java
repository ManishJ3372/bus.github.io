import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


public class TravellersDetails extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        int no=Integer.parseInt(req.getParameter("nt"));
        String busno=req.getParameter("busno");
        String date=req.getParameter("date");
        String cost=req.getParameter("cost");
        try
        {
                String data="<div class='panel panel-info'  ><div class='panel-heading' style='font-weight: bolder;'>Enter traveller details</div><div class='panel-body'>";
                for(int i=1;i<=no;i++)
                {
                    data=data+"<form id='frmtd' action='MakePayment'><div class=form-group >";
                    data=data+"Traveller "+i+" <input type=text class=form-control name=tr placeholder='Enter name'>";
                    data=data+"Gender: <label class='radio-inline'><input type='radio' value='m' name=r"+i+"><i class='fa fa-male' style='color:blue'></i></label><label class='radio-inline'><input type='radio' value='f' name=r"+i+"><i class='fa fa-female' style='color:darksalmon'></i></label></div>";
                }
               data=data+"<button type='submit' class='btn btn-success center-block'>Make Payment</button>";
               data=data+" <input type='hidden' name='date' value="+date+"><input type='hidden' name='busno' value="+busno+"></form></div></div>";
                
               
               pw.println(data);
                      
        
        }
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}