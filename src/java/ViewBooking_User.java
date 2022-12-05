import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.sql.*;

import p1.*;


public class ViewBooking_User extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
         
        
        Connection con=DB_Connection.get_DBConnection();
        
        PreparedStatement pst2=con.prepareStatement("select * from booking_master where userid=?");
        pst2.setString(1,hs.getAttribute("A1").toString());
        ResultSet rs1=pst2.executeQuery();
         String t="<table  class='table table-bordered'><thead><tr><th>Booking ID</th><th>UserID</th><th>Booking Date</th><th>Bus no</th><th>Journt Date</th><th>Amount</th><th>Payment Mode</th><th>Total Traveller</th><th>Traveller's Details</th></tr></thead>";
        t=t+"<tbody>";
      int i=1;
        if(rs1.next())
        {
           
       do
        {
           
            t=t+"<tr >";
            t=t+"<td>"+rs1.getString(1);
            t=t+"<td>"+rs1.getString(2);
            t=t+"<td>"+rs1.getString(3);
            t=t+"<td>"+rs1.getString(4);
            t=t+"<td>"+rs1.getString(5);
            t=t+"<td>"+rs1.getString(6);
            t=t+"<td>"+rs1.getString(7);
            t=t+"<td>"+rs1.getString(8);
            t=t+"<td >"+"<button type='button' class='btn btn-link' data-toggle='collapse' data-target='#a"+i+"'><i class='fa fa-eye'></i> View Details</a>";
            
            PreparedStatement pst3=con.prepareStatement("select * from booking_details where bid=?");
            pst3.setString(1,rs1.getString("bid"));
            ResultSet rs2=pst3.executeQuery();
            String d="";int j=1;
            while(rs2.next())
            {
                d=d+"<div class='text-info'>Traveller " +j+":"+rs2.getString("name")+" ("+(rs2.getString("gender").equals("m")?"Male":"Female") +")<br/></div>";
                j++;
            }
            t=t+"<tr id='a"+i+"' class='collapse'><td colspan=9><div>"+d+" </div></td></tr>";
            i++;
      }
        while(rs1.next() );
       
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