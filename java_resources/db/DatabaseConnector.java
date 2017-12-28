package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DatabaseConnector {
	private static Connection connection;
	private DatabaseConnector() { }
	public static Connection getConnection() {
		if(connection == null) {
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/"+DatabaseContract.database_name,DatabaseContract.username,DatabaseContract.password);
				return connection;
			} 
			catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			}
			catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		return connection;
	}
}
