package gestion;

import java.util.Iterator;
import persistantData.Room;
import persistantData.ItInfrastrcture;

public class Appli
{
    public static void main(final String[] args) {
        final ItInfrastrcture itInfrastrcture = new ItInfrastrcture();
        System.out.println("Liste des salles :\n");
        System.out.println("nSalle\tnomSalle  \tnbPoste\tindIP");
        System.out.println("------------------------------------------");
        for (final Room room : ItInfrastrcture.getRooms()) {
            System.out.println(room.toString());
        }
        ItInfrastrcture.deleteRoom(Integer.valueOf(1));
    }
}