package persistantData;

public class Room
{
    private String nSalle;
    private String nomSalle;
    private String nbPoste;
    private String indIp;
    
    public Room(final String nSalle, final String nomSalle, final String nbPoste, final String indIp) {
        this.setnSalle(nSalle);
        this.setNomSalle(nomSalle);
        this.setNbPoste(nbPoste);
        this.setIdIp(indIp);
    }
    
    public String getnSalle() {
        return this.nSalle;
    }
    
    public void setnSalle(final String nSalle) {
        this.nSalle = nSalle;
    }
    
    public String getNomSalle() {
        return this.nomSalle;
    }
    
    public void setNomSalle(final String nomSalle) {
        this.nomSalle = nomSalle;
    }
    
    public String getNbPoste() {
        return this.nbPoste;
    }
    
    public void setNbPoste(final String nbPoste) {
        this.nbPoste = nbPoste;
    }
    
    public String getIdIp() {
        return this.indIp;
    }
    
    public void setIdIp(final String indIp) {
        this.indIp = indIp;
    }
    
    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append(String.valueOf(this.nSalle) + "     ");
        sb.append(String.valueOf(this.nomSalle) + "         ");
        sb.append(String.valueOf(this.nbPoste) + "       ");
        sb.append(this.indIp);
        return sb.toString();
    }
}