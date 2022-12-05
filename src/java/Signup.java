import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;

public class Signup extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String fname=req.getParameter("txtfname").trim();
        String lname=req.getParameter("txtlname").trim();
        String emailid=req.getParameter("txtemailid").trim();
        String mobile=req.getParameter("txtmobile").trim();
        String question=req.getParameter("txtsecretquestion").trim();
        String answer=req.getParameter("txtanswer").trim();
        String password=req.getParameter("txtpassword").trim();
       
        
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("select * from customers where emailid=?");
        pst1.setString(1, emailid);
        ResultSet rs=pst1.executeQuery();
        
        if(rs.next()==false)
        {         
            
             PreparedStatement pst=con.prepareStatement("insert into customers values(?,?,?,?,?,?)");
            pst.setString(1,fname);
            pst.setString(2,lname);
            pst.setString(3,emailid);
            pst.setString(4,mobile);
            pst.setString(5,question);
            pst.setString(6,answer);
            pst.executeUpdate();
            pst.close();
            
            PreparedStatement pst2=con.prepareStatement("insert into login values(?,?,?)");
            pst2.setString(1, emailid);
            pst2.setString(2, password);
            pst2.setBlob(3, getServletContext().getResourceAsStream("/images/av.png") );
           
            pst2.executeUpdate();
            pst2.close();

            con.close();
            
            req.setAttribute("errormsg","<div class='alert alert-success' style='text-align: center;'>Congratulations!Your account is successfully activated.<a href='home.jsp'> Click here</a> to go to login page <br/></div>");       
            RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
            rd.forward(req, res);
                      
        }
        else
        {
            req.setAttribute("fname",fname);
            req.setAttribute("lname",lname);
            req.setAttribute("mobile",mobile);
            req.setAttribute("question",question);
            req.setAttribute("answer",answer);
            req.setAttribute("errormsg","<div class='alert alert-danger' style='height:70px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>The specified email id is already registered with us.Try using a different one</div>");
           
            RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
            rd.forward(req, res); 
        }
        }
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}