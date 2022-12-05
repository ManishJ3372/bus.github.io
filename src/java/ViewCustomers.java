import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

import p1.*;


public class ViewCustomers extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
         
        
        Connection con=DB_Connection.get_DBConnection();
        
        PreparedStatement pst2=con.prepareStatement("select * from customers");
        
        ResultSet rs1=pst2.executeQuery();
         String t="<table  class='table table-bordered'><thead><tr><th>First name</th><th>Last name</th><th>Email ID</th><th>Mobile</th></tr></thead>";
        t=t+"<tbody>";
      
        if(rs1.next())
        {
            do
            {
                t=t+"<tr>";
                t=t+"<td>"+rs1.getString(1);
                t=t+"<td>"+rs1.getString(2);
                t=t+"<td>"+rs1.getString(3);
                t=t+"<td>"+rs1.getString(4);


                t=t+"</tr>";


            }
            while(rs1.next() );
       
       
            pw.println(t);
        }
        else
        {
            pw.println("<p style='font-weight:bolder;color:red;font-size:20px'>No Users to Display</style> ");
        }
        
       }
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}