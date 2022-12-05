import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class DeleteBus extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String busno=req.getParameter("busno").trim();
        
       
        
           
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("delete from bus where busno=?");
        pst1.setString(1, busno);
       
        pst1.executeUpdate();
        
                 
                      
        
       
        }
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}