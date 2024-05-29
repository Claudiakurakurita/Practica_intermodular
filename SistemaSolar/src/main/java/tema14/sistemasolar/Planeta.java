package tema14.sistemasolar;

import javax.swing.JLabel;

/**
 *
 * @author Claudia Valdivia Carrasco
 */
public class Planeta {

    static void setText(JLabel NombrePlaneta) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    private String nombrePlaneta;
    private double radioPlaneta;
    private double distanciaPlaneta;
    private double orbitaPlaneta;
    private double temperaturaPlaneta;
    private Integer numeroDeSatelites;
    private String tipoPlaneta;

    public Planeta(String nombrePlaneta, double radioPlaneta, double distanciaPlaneta, double orbitaPlaneta, double temperaturaPlaneta, String tipoPlaneta, Integer numeroDeSatelites ){
        this.nombrePlaneta = nombrePlaneta;
        this.radioPlaneta = radioPlaneta;
        this.distanciaPlaneta = distanciaPlaneta;
        this.orbitaPlaneta = orbitaPlaneta;
        this.temperaturaPlaneta = temperaturaPlaneta;
        this.tipoPlaneta = tipoPlaneta;
        this.numeroDeSatelites = numeroDeSatelites;
    }

    // Getters y Setters
    public String getNombrePlaneta() {
        return nombrePlaneta;
    }

    public void setnombrePlaneta(String nombrePlaneta) {
        this.nombrePlaneta = nombrePlaneta;
    }

    public double getradioPlaneta() {
        return radioPlaneta;
    }

    public void setradioPlaneta(double radioPlaneta) {
        this.radioPlaneta = radioPlaneta;
    }

    public double getdistanciaPlaneta() {
        return distanciaPlaneta;
    }

    public void setdistanciaPlaneta(double distanciaPlaneta) {
        this.distanciaPlaneta = distanciaPlaneta;
    }

    public double getorbitaPlaneta() {
        return orbitaPlaneta;
    }

    public void setorbitaPlaneta(double orbitaPlaneta) {
        this.orbitaPlaneta = orbitaPlaneta;
    }

    public double gettemperaturaPlaneta() {
        return temperaturaPlaneta;
    }

    public void settemperaturaPlaneta(double temperaturaPlaneta) {
        this.temperaturaPlaneta = temperaturaPlaneta;
    }

    public String gettipoPlaneta() {
        return tipoPlaneta;
    }

    public void setTipoDePlaneta(String tipoPlaneta) {
        this.tipoPlaneta = tipoPlaneta;
    }

    public Integer getNumeroDeSatelites() {
        return numeroDeSatelites;
    }

    public void setNumeroDeSatelites(Integer numeroDeSatelites) {
        this.numeroDeSatelites = numeroDeSatelites;
    }

    @Override
    public String toString() {
        return "Planeta{" +
                "nombre='" + nombrePlaneta + '\'' +
                ", radioKm=" + radioPlaneta +
                ", distanciaMediaAlSolMillonesKm=" + distanciaPlaneta +
                ", periodoOrbitalDias=" + orbitaPlaneta +
                ", temperaturaMediaC=" + temperaturaPlaneta +
                ", tipoDePlaneta='" + tipoPlaneta + '\'' +
                ", numeroDeSatelites=" + numeroDeSatelites +
                '}';
    }
}

