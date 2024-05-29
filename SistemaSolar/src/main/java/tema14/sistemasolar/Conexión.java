package tema14.sistemasolar;

/**
 *
 * @author Claudia Valdivia Carrasco
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexión {
    private static final String URL = "jdbc:mysql://localhost:3306/nombre_de_la_base_de_datos";
    private static final String USER = "root";
    private static final String PASSWORD = "Med@c";

    public Connection obtenerConexión() {
        Connection con = null;
        try {
            // Registrar el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establecer la conexión
            con = DriverManager.getConnection(URL, USER, PASSWORD);

            // Verificar si la conexión fue exitosa
            if (con != null) {
                System.out.println("Conexión exitosa a la base de datos!");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("Error: No se encontró el driver de MySQL.");
        } catch (SQLException e) {
            System.out.println("Error: No se pudo conectar a la base de datos.");
        }
        return con;
    }
}
