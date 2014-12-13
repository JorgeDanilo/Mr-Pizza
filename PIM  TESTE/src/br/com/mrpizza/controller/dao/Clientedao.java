package br.com.mrpizza.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import br.com.mrpizza.controller.ConexaoBanco;
import br.com.mrpizza.modelo.Cliente;
import br.com.mrpizza.modelo.Produto;

/**
 * Classe responsavel por realizar o CRUD cliente
 * 
 * @author danilo
 * 
 */
public class Clientedao {

	Connection conexao;

	public Clientedao() {

		try {

			conexao = ConexaoBanco.getConexao();

		} catch (Exception e) {

			e.printStackTrace();

		}
	}

	/**
	 * Metodo reponsavel por inserir no banco de dados os dados dos clientes.
	 * 
	 * @param cliente
	 * @return true : false
	 */
	public boolean inserir(Cliente cliente) {
		StringBuilder str = new StringBuilder();

		str.append("INSERT INTO cliente");
		str.append("(nome, login, senha,logradouro,cep,numero)");
		str.append("VALUES (?,?,?,?,?,?)");

		try {

			PreparedStatement insert = conexao.prepareStatement(str.toString());

			insert.setString(1, cliente.getNome());

			insert.setString(2, cliente.getLogin());

			insert.setString(3, cliente.getSenha());

			insert.setString(4, cliente.getLogradouro());

			insert.setString(5, cliente.getCep());

			insert.setString(6, cliente.getNumero());
			
			
			return insert.execute();
			
			
			

		} catch (SQLException e) {

			e.printStackTrace();

			return false;

		}

	}
	
	
	/**
	 * Método que retorna os dados dos clientes
	 * @author danilo
	 * @return lista ? null
	 */
	public List<Cliente> listaCliente() {
		
		List<Cliente> listaCliente = new ArrayList<Cliente>();
		
		String sql = "SELECT * FROM cliente";
		
		try {
			
			PreparedStatement consultar = conexao.prepareStatement(sql);
			
			ResultSet resultSet = consultar.executeQuery();
			
			while (resultSet.next()) {
				
				Cliente cliente = new Cliente();
				
				cliente.setNome(resultSet.getString("nome"));
				
				cliente.setLogradouro(resultSet.getString("logradouro"));
				
				cliente.setCep(resultSet.getString("cep"));
				
				cliente.setNumero(resultSet.getString("numero"));
				
				cliente.setLogin(resultSet.getString("login"));
				
				cliente.setSenha(resultSet.getString("senha"));
				
				cliente.setId_cliente(resultSet.getInt("idcliente"));
				
				
				
				listaCliente.add(cliente);
				
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return listaCliente;
		
	}

	

	/**
	 * Método responsavel por autenticar um cliente no sistema
	 * @param cliente
	 * @return Dados usuario ? null
	 */
	public Cliente autenticar(Cliente cliente) {

		String sql = "SELECT * FROM cliente WHERE login=? AND senha=? AND idcliente = ?";

		try {

			PreparedStatement consultar = conexao.prepareStatement(sql);

			consultar.setString(1, cliente.getLogin());
			consultar.setString(2, cliente.getSenha());
			consultar.setInt(3, cliente.getId_cliente());

			ResultSet resultSet = consultar.executeQuery();

			if (resultSet.next()) {

				Cliente modelocliente = new Cliente();
				
				modelocliente.setId_cliente(resultSet.getInt("idcliente"));
				modelocliente.setLogin(resultSet.getString("login"));
				modelocliente.setSenha(resultSet.getString("senha"));

				JOptionPane.showMessageDialog(null, "Seu Código de compra é :" + resultSet.getInt("idcliente"));
				
				return modelocliente;

			}

			consultar.close();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null;

	}

}
