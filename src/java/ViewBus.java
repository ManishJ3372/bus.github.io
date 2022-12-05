import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

import p1.*;


public class ViewBus extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
         
        
        Connection con=DB_Connection.get_DBConnection();
        
        PreparedStatement pst2=con.prepareStatement("select * from bus");
        
        ResultSet rs1=pst2.executeQuery();
         String t="<table  class='table table-bordered'><thead><tr><th>Bus no</th><th>Source</th><th>Destination</th><th>Cost</th><th>Start Time</th><th>End Time</th><th>No. of Seats</th><th>Delete Bus</th></tr></thead>";
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
            t=t+"<td>"+rs1.getString(5);
            t=t+"<td>"+rs1.getString(6);
            t=t+"<td>"+rs1.getString(7);
            t=t+"<td>"+"<button type='button' class='btn btn-danger'><i class='fa fa-trash'></i> Delete Bus</a>";
            
           
            
            
            
        }
        while(rs1.next() );
       
       pw.println(t);
        }
        else
        {
              pw.println("<p style='font-weight:bolder;color:red;font-size:20px'>No Buses to Display</style> ");
        }
        
       }
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}