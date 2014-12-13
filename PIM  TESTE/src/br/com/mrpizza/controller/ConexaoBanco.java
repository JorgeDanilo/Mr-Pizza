package br.com.mrpizza.controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoBanco {

	private static String url = "jdbc:mysql://localhost/mydb";
	private static String usuario = "root";
	private static String senha = "1234";
	
	public static Connection getConexao() throws Exception {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		return DriverManager.getConnection(url, usuario, senha);
		
	}
	
}
