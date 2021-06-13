package persistantData;

import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class ItInfrastrcture
{
    private static Connection connexionDB;
    private static PreparedStatement SeachListRooms;
    
    public static ArrayList<Room> getRooms() {
        final ArrayList<Room> ListRooms = new ArrayList<Room>();
        try {
            ItInfrastrcture.connexionDB = DataConnection.connexionBD();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        final String Rooms = "select * from salle";
        try {
            ItInfrastrcture.SeachListRooms = ItInfrastrcture.connexionDB.prepareStatement(Rooms);
            final ResultSet res = ItInfrastrcture.SeachListRooms.executeQuery();
            while (res.next()) {
                final Room room = new Room(res.getString("nSalle"), res.getString("nomSalle"), res.getString("nbPoste"), res.getString("indIp"));
                ListRooms.add(room);
            }
            return ListRooms;
        }
        catch (SQLException e2) {
            e2.printStackTrace();
            return null;
        }
    }
    
    public static void deleteRoom(final Integer rang) {
        try {
            final Statement etatModifiable = ItInfrastrcture.connexionDB.createStatement(1004, 1008);
            ItInfrastrcture.connexionDB.setAutoCommit(false);
            final ResultSet res = etatModifiable.executeQuery("SELECT s.* FROM Salle s");
            if (res.absolute(rang)) {
                res.deleteRow();
                ItInfrastrcture.connexionDB.commit();
                System.out.println("Salle supprim\u00e9e");
            }
            else {
                System.out.println("D\u00e9sol\u00e9, pas de " + rang + " \u00e8me salle !");
            }
            res.close();
            etatModifiable.close();
        }
        catch (SQLException ex) {
            while (ex != null) {
                System.out.println("Statut SQL  : " + ex.getSQLState());
                System.out.println("Message     : " + ex.getMessage());
                System.out.println("Code erreur : " + ex.getErrorCode());
                ex = ex.getNextException();
            }
        }
    }
}