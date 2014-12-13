package teste;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Teste {

	public static void main(String[] args) throws Exception{

		  consultaPedidos();
	   }

	public static void consultaPedidos() throws ClassNotFoundException,
			SQLException {
		Class.forName("com.mysql.jdbc.Driver");
	      Connection con = DriverManager.getConnection
	      ("jdbc:mysql://localhost/mydb","root",
	      "1234");
	      Statement stmt = con.createStatement();
	      String query ="SELECT * FROM pedido inner join cliente on (idpedido = idcliente)";
	      ResultSet rs = stmt.executeQuery(query);
	      System.out.println("");
	      while (rs.next()) {
	         String fname = rs.getString("dt_pedido");
	         String lname = rs.getString("valorPedido");
	         int idCliente = rs.getInt("cliente_idcliente");
	         String nomeCliente = rs.getString("nome");
	         System.out.println(fname + "  " + lname+"   "+idCliente+"  "+nomeCliente);
	      }
	      System.out.println();
	      System.out.println();
	}
		

}
