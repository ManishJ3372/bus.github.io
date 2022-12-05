import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import p1.*;


public class AddBus extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String source=req.getParameter("txtsource").trim();
        String destination=req.getParameter("txtdestination").trim();
        String busno=req.getParameter("txtbusno").trim();
        String d_time=req.getParameter("txtdeparturetime").trim();
        String a_time=req.getParameter("txtarrivaltime").trim();
        int cost=Integer.parseInt(req.getParameter("txtcost").trim());
        int seats=Integer.parseInt(req.getParameter("txtseats").trim());
       
        
           
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("insert into bus values(?,?,?,?,?,?,?)");
        pst1.setString(1, busno);
        pst1.setString(2,source);
        pst1.setString(3,destination);
        pst1.setInt(4,cost);
        pst1.setString(5,d_time);
        pst1.setString(6,a_time);
         pst1.setInt(7,seats);
        pst1.executeUpdate();
        
                 req.setAttribute("msg", "$('#modal-msg').modal('show');");
            RequestDispatcher rd=req.getRequestDispatcher("addbus.jsp");
            rd.forward(req, res);
                      
        
       
        }
        catch(NumberFormatException e)
        {
            pw.println(e);
       
        } 
        catch (SQLException ex)
        {
            Logger.getLogger(AddBus.class.getName()).log(Level.SEVERE, null, ex);
        }       
        
    }
}