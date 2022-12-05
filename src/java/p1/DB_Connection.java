
package p1;

import java.sql.*;

public class DB_Connection 
{
   
     
    public static Connection get_DBConnection()
    {
       
        Connection conn=null;
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
           conn=DriverManager.getConnection("jdbc:mysql://localhost/bus_db","root","12345");
           
        }
        catch(ClassNotFoundException e)
        {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return conn;
    }
    
}
