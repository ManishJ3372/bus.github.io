
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;

 public class GetImage extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
         //PrintWriter pw=res.getWriter();
         res.setContentType("image/jpeg");
         HttpSession hs=req.getSession(false);
         byte b[]=null;
        try
        {
      
     /*  String n=req.getParameter(nm);*/
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select * from login where userid=?");
        pst1.setString(1, hs.getAttribute("A1").toString());
        ResultSet rs=pst1.executeQuery();
        rs.next();
        
        if(rs.getBytes("pic")!=null)
        {
            b=rs.getBytes("pic");
            ServletOutputStream o=res.getOutputStream();
            o.write(b);
            o.flush();
            o.close();
        }
        else
        {
            PreparedStatement pst2=con.prepareStatement("update login set pic=? where userid=?");
            pst2.setBlob(1, getServletContext().getResourceAsStream("/images/av.png"));
            pst2.setString(2, hs.getAttribute("A1").toString());
            pst2.executeUpdate();
            pst2.close();
            
            pst2=con.prepareStatement("Select * from login where userid=?");
            pst2.setString(1, hs.getAttribute("A1").toString());
            ResultSet rs1=pst1.executeQuery();
            rs1.next();
            b=rs1.getBytes("pic");
            ServletOutputStream o=res.getOutputStream();
            o.write(b);
            o.flush();
            o.close();
            
            
        }
        
      // System.out.println(b.length);
       
        
        //pw.println("abc.jpg");
        }
        catch(Exception e)
        {
           
        }
    }
        
}