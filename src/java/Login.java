import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import p1.*;

public class Login extends HttpServlet
{

    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse res)
            throws ServletException,IOException
    {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
                
        try
        {
           
        String u=req.getParameter("txt_username");
        String p=req.getParameter("txt_password");
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst=con.prepareStatement("select * from login,customers where login.userid=? and login.password=? and login.userid=customers.emailid");
        pst.setString(1,u);
        pst.setString(2,p);
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
            if(u.equals("admin@bus.com"))
            {
                HttpSession hs=req.getSession(true);
                hs.setAttribute("A1", u);
                hs.setAttribute("A2", rs.getString("customers.fname"));
                res.sendRedirect("mainpage_admin.jsp");
            }
            else
            {
                HttpSession hs=req.getSession(true);
                hs.setAttribute("A1", u);
                hs.setAttribute("A2", rs.getString("customers.fname"));
                res.sendRedirect("mainpage.jsp");
            }
           
            
            
        }
        else
        {
           
             String a="$(document).ready(function(){$('#modal_login') .modal(); $('#modal_login').removeClass('fade')});";
             
           
             req.setAttribute("msg", "Invalid credentials");
             req.setAttribute("msg1", a);
             RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
             rd.include(req, res);
                         
        }
         
        } catch (SQLException ex) 
        {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
       
        