package net.cibertec.instituto.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConexion {
	
	public static Connection getConexion() {
		Connection cn=null;
		try {
			String url="jdbc:mysql://localhost/instituto_2022_4gn?serverTimezone=UTC",user="root",clave="mysql";
			//Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			cn=DriverManager.getConnection(url,user,clave);
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cn;
	}
	
	
}
