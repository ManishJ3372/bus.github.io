import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;

public class ForgotPassword extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String userid=req.getParameter("txtuserid").trim();
        
          
        
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("select * from customers where emailid=?");
        pst1.setString(1, userid);
        ResultSet rs=pst1.executeQuery();
     
        if(rs.next()==true)
        {         
            
            String question=rs.getString("secret_question");
            req.setAttribute("userid", userid);
            req.setAttribute("question", question);
            req.setAttribute("option", "secret");
            req.setAttribute("div1", "hidden");
            RequestDispatcher rd=req.getRequestDispatcher("forgotpassword1.jsp");
            rd.forward(req, res);

                      
        }
        else
        {
            req.setAttribute("errormsg","<div class='alert alert-danger' style='height:70px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>The specified email id/userid is not registered with us.</div>");
            req.setAttribute("autofocus", "autofocus");
            
            RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
            rd.forward(req, res); 
        }
        }
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}