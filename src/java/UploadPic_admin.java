import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class UploadPic_admin extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        
        
        HttpSession hs=req.getSession(false);
        try
        {
          Part p1 = req.getPart("txtpic");
          InputStream is=p1.getInputStream();
                
                 
            
        
        Connection con=DB_Connection.get_DBConnection();
     
       
        PreparedStatement pst=con.prepareStatement("update login set pic=? where userid=?");
        pst.setBlob(1, is);
        pst.setString(2, hs.getAttribute("A1").toString());
        pst.executeUpdate();
        pst.close();
        req.setAttribute("m1", "Pic uploaded successfully");
        req.setAttribute("msg","$('#modal-msg').modal('show');");
        
        RequestDispatcher rd=req.getRequestDispatcher("uploadpic_admin.jsp");
        rd.forward(req, res);
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}