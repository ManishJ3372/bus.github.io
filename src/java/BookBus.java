import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;
import java.text.*;

public class BookBus extends HttpServlet
{
    @Override
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
        String source=req.getParameter("txtsource").trim();
        String destination=req.getParameter("txtdestination").trim();
        String date=req.getParameter("txtdate").trim();
        
        
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date d = f.parse(date);
        f.applyPattern("EEEE, d MMM yyyy");
        String d1 = f.format(d);
        
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("select busno,source,destination,TIME_FORMAT(starttime, '%H:%i'),TIME_FORMAT(endtime, '%H:%i'), TIME_FORMAT(TIMEDIFF(endtime, starttime),'%Hh:%im'), cost from bus where source=? and destination=?");
        pst1.setString(1, source);
        pst1.setString(2,destination);
        ResultSet rs=pst1.executeQuery();
        String data="<table id='bustable' class='table table-hover' style='margin:0px auto'><thead><tr><th style='text-align:center'>Departure</th><th style='text-align:center'>Duration</th><th style='text-align:center'>Arrival</th><th style='text-align:center'>Bus no.</th><th style='text-align:center'>Price</th><th></th></tr></thead><tbody>";
        if(rs.next()==true)
        {         
            do
            {
                data=data+"<tr class='info'><td class='col-md-2' style='text-align:center;font-size:20px'>"+rs.getString(4)+"<br/><div style='font-size:15px'>"+source+"</td><td class='col-md-1' style='text-align:center;font-size:12px'>"+rs.getString(6)+"<td class='col-md-2' style='text-align:center;font-size:20px'>"+rs.getString(5)+"<br/><div style='font-size:15px'>"+destination+"</td><td class='col-md-1' style='text-align:center;font-size:20px'>"+rs.getString("busno")+"</td><td class='col-md-1' style='text-align:center;font-size:20px' ><i class='fa fa-rupee'>&nbsp"+ rs.getInt("cost")+"</td><td class='col-md-1' style='text-align:center;font-size:20px'><button class='btn btn-success' id='btnbook' >Book</td></tr>";
            }
            while(rs.next());
            
            
                data=data+"</tbody></table>";
                req.setAttribute("source",(source.substring(0,1)).toUpperCase()+source.substring(1));
                req.setAttribute("destination",(destination.substring(0,1)).toUpperCase()+destination.substring(1));
                req.setAttribute("date",d1);

                req.setAttribute("data",data);       
                RequestDispatcher rd=req.getRequestDispatcher("bookbus.jsp");
                rd.forward(req, res);
            
            
                      
        }
        else
        {
           
                req.setAttribute("errormsg","<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Buses available in this route </style>");


                RequestDispatcher rd=req.getRequestDispatcher("bookbus.jsp");
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