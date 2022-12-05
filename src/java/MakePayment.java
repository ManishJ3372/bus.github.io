import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;
import java.text.*;

public class MakePayment extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
            
            String busno=req.getParameter("busno").trim();
            String date1=req.getParameter("date").trim();
            
            SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date d = f.parse(date1);
            f.applyPattern("EEEE, d MMM yyyy");
            String d1 = f.format(d);
        
            String n[]=req.getParameterValues("tr");
              
            String tr="",tr1="";
            for(int i=0;i<n.length;i++)
            {
               String gender=req.getParameter("r"+(i+1));
               tr=tr+"<input type='hidden' name='tr' value="+n[i]+">";
               tr=tr+"<input type='hidden' name='r'  value="+gender+">";
               tr1=tr1+"<div class='text-danger' style='font-size:16px;font-weight:bold'>Name: "+n[i]+"<span style='padding-left:10px'> "+(gender.equals("m")?"(Male)":"(Female)")+"</span></div>";
            }
           
        
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("select source,destination,TIME_FORMAT(starttime, '%H:%i'),TIME_FORMAT(endtime, '%H:%i'),cost from bus where busno=?");
        pst1.setString(1, busno);
       
        ResultSet rs=pst1.executeQuery();
       
        if(rs.next()==true)
        {         
           
              
                req.setAttribute("busno",busno); 
                req.setAttribute("source",rs.getString("source")); 
                req.setAttribute("destination",rs.getString("destination")); 
                req.setAttribute("cost",(rs.getInt("cost")*n.length)); 
                req.setAttribute("starttime",rs.getString(3)); 
                req.setAttribute("endtime",rs.getString(4)); 
                req.setAttribute("date",d1);
                req.setAttribute("data", tr);
                req.setAttribute("data1", tr1);
                
                
                    RequestDispatcher rd=req.getRequestDispatcher("makepayment.jsp");
                    rd.forward(req, res);
               
                      
        }
        
        }
        catch(ParseException e)
        {
            pw.println(e);
        } catch (SQLException e) {
            pw.println(e);
        } catch (ServletException e) {
            pw.println(e);
        } catch (IOException e) {
            pw.println(e);
        }

              
        
    }
}