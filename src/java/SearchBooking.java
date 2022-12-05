import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import p1.*;


public class SearchBooking extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
         String dt=req.getParameter("p1");
         SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date d = f.parse(dt);
        f.applyPattern("yyyy-MM-dd");
        String d1 = f.format(d);
        
        HttpSession hs=req.getSession(true);
        Connection con=DB_Connection.get_DBConnection();
        
        PreparedStatement pst2=con.prepareStatement("select * from booking_master where doj=?");
        pst2.setString(1,d1);
        ResultSet rs1=pst2.executeQuery();
         String t="<table  class='table table-bordered'><thead><tr><th>Booking ID</th><th>UserID</th><th>Booking Date</th><th>Bus no</th><th>Journey Date</th><th>Amount</th><th>Payment Mode</th><th>Total Traveller</th></tr></thead>";
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
             t=t+"<td>"+rs1.getString(8);
            
            
            
        }
       while(rs1.next());
        pw.println(t);
      
        
       }
        else
        {
           pw.println("<p style='font-weight:bolder;color:red;font-size:20px'>No Bookings found</style> ");
        }
        }
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}