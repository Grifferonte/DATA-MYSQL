package persistantData;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;

public class DataConnection
{
    private static String url_jdbc;
    private static String login;
    private static String pwd;
    
    static {
        DataConnection.url_jdbc = "jdbc:mysql://127.0.0.1:3306/tp_bdd?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC";
        DataConnection.login = "root";
        DataConnection.pwd = "Ft26@AlpS3";
    }
    
    public static Connection connexionBD() throws Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            final Connection connexionBD = DriverManager.getConnection(DataConnection.url_jdbc, DataConnection.login, DataConnection.pwd);
            return connexionBD;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e2) {
            e2.printStackTrace();
        }
        return null;
    }
}