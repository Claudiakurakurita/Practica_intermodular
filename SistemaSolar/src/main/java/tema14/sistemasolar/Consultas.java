package tema14.sistemasolar;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Consultas {

    public List<Planeta> ejecutarConsultas(Connection con) {
        List<Planeta> planetas = new ArrayList<>();
        String sql = "SELECT nombre, radio_km, distancia_media_al_sol_millones_km, periodo_orbital_dias, temperatura_media_c, tipo_de_planeta, numero_de_satelites FROM planetas";

        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                String nombrePlaneta = rs.getString("nombre");
                double radioPlaneta = rs.getDouble("radio_km");
                double distanciaPlaneta = rs.getDouble("distancia_media_al_sol_millones_km");
                double orbitaPlaneta = rs.getDouble("periodo_orbital_dias");
                double temperaturaPlaneta = rs.getDouble("temperatura_media_c");
                String tipoPlaneta = rs.getString("tipo_de_planeta");
                int numeroDeSatelites = rs.getInt("numero_de_satelites");

                Planeta planeta = new Planeta(nombrePlaneta, radioPlaneta, distanciaPlaneta, orbitaPlaneta, temperaturaPlaneta, tipoPlaneta, numeroDeSatelites);
                planetas.add(planeta);
            }
        } catch (SQLException e) {
        }
        return planetas;
    }
}
