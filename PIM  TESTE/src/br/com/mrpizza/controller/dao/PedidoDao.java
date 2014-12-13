package br.com.mrpizza.controller.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import br.com.mrpizza.controller.ConexaoBanco;
import br.com.mrpizza.modelo.Cliente;
import br.com.mrpizza.modelo.Pedido;
import br.com.mrpizza.modelo.Produto;

/**
 * Método responsável por realizar toda a persistencia no banco de dados
 * 
 * @author danilo
 * @Date 12/11/2014
 * 
 */
public class PedidoDao {

	Connection conexao;

	public PedidoDao() {

		try {

			conexao = ConexaoBanco.getConexao();

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	/**
	 * Método que pega a data atual do sistema
	 * 
	 * @author danilo
	 * @return a getTime
	 */
	private static java.sql.Date getCurrentDate() {

		java.util.Date today = new java.util.Date();

		return new java.sql.Date(today.getTime());

	}

	/**
	 * Metodo responsavel por inserir no banco de dados os pedidos dos clientes.
	 * 
	 * Esse metodo tambem insere a chave estrangeira do cliente na entidade
	 * produto.
	 * 
	 * @author danilo
	 * @param pedido
	 * @param nomeCliente
	 */
	public void inserirPedido(Pedido pedido, int idcliente, int idProduto,
			int quantidadeProdutos) {

		int idresult1 = 0;

		PreparedStatement SQL;

		try {

			SQL = conexao
					.prepareStatement("SELECT * FROM cliente WHERE idcliente = ?");

			SQL.setInt(1, idcliente);

			ResultSet rs2 = SQL.executeQuery();

			if (rs2.next()) {

				int lastInsetNome = rs2.getInt("idcliente");

				pedido.setCodigoCliente(lastInsetNome);

				idresult1 = pedido.getCodigoCliente();

			} else {

				JOptionPane.showMessageDialog(null, "Cliente nao encontrado");

			}

		} catch (SQLException e) {

			JOptionPane.showMessageDialog(null, "ERRO DE SQL" + e);

		}

		try {

			PreparedStatement ps2 = conexao
					.prepareStatement(
							"INSERT INTO pedido (dt_pedido,valorPedido, cliente_idcliente) VALUES (?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS);

			ps2.setDate(1, getCurrentDate());

			ps2.setDouble(2, pedido.getValorPedido());

			ps2.setInt(3, idresult1);

			ps2.execute();

			ResultSet rs = ps2.getGeneratedKeys();

			int id = 0;

			if (rs.next()) {

				id = rs.getInt(1);

			}

			System.out.println("Id gerado pelo insert foi " + id);

			PreparedStatement ps3 = conexao
					.prepareStatement("INSERT INTO produto_tem_pedido (produto_idproduto, pedido_idpedido,quantidade) values (?,?,?)");

			ps3.setInt(1, idProduto);

			ps3.setInt(2, id);

			ps3.setInt(3, quantidadeProdutos);

			ps3.execute();

			ps2.close();

			ps3.close();

			conexao.close();

		} catch (Exception e) {

			JOptionPane.showMessageDialog(null, "ERRO AO INSERIR DADOS NO SQL"
					+ e);

		}

	}

	public void inserirPedidoPromocoes(Pedido pedido, int idcliente,
			int idPromocao) {

		int idresult1 = 0;

		PreparedStatement SQL;

		try {

			SQL = conexao
					.prepareStatement("SELECT * FROM cliente WHERE idcliente = ?");

			SQL.setInt(1, idcliente);

			ResultSet rs2 = SQL.executeQuery();

			if (rs2.next()) {

				int lastInsetNome = rs2.getInt("idcliente");

				pedido.setCodigoCliente(lastInsetNome);

				idresult1 = pedido.getCodigoCliente();

			} else {

				JOptionPane.showMessageDialog(null, "Cliente nao encontrado");

			}

		} catch (SQLException e) {

			JOptionPane.showMessageDialog(null, "ERRO DE SQL" + e);

		}

		try {

			PreparedStatement ps2 = conexao
					.prepareStatement(
							"INSERT INTO pedido (dt_pedido,valorPedido, cliente_idcliente) VALUES (?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS);

			ps2.setDate(1, getCurrentDate());

			ps2.setDouble(2, pedido.getValorPedido());

			ps2.setInt(3, idresult1);

			ps2.execute();

			ResultSet rs = ps2.getGeneratedKeys();

			int id = 0;

			if (rs.next()) {

				id = rs.getInt(1);

			}

			System.out.println("Id gerado pelo insert foi " + id);

			PreparedStatement ps3 = conexao
					.prepareStatement("INSERT INTO pedido_has_promocoes (promocoes_idpromo, pedido_idpedido) values (?,?)");

			ps3.setInt(1, idPromocao);

			ps3.setInt(2, id);

			ps3.execute();

			ps2.close();

			ps3.close();

			conexao.close();

		} catch (Exception e) {

			JOptionPane.showMessageDialog(null, "ERRO AO INSERIR DADOS NO SQL"
					+ e);

		}

	}

	/**
	 * Método responsavel por consultar todos os pedidos apenas na tabela de
	 * pedidos para teste de data.
	 * 
	 * @return listaPedidos
	 * @author danilo
	 */

	public List<Pedido> listarTodosPedidos() {

		List<Pedido> listaPedidos = new ArrayList<Pedido>();

		String sql = "SELECT * FROM pedido";

		try {
			PreparedStatement consultar = conexao.prepareStatement(sql);

			ResultSet resultSet = consultar.executeQuery();

			while (resultSet.next()) {

				Pedido pedido = new Pedido();

				pedido.setCodigoCliente(resultSet.getInt("idpedido"));

				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

				pedido.setDt_pedido(resultSet.getDate("dt_pedido"));

				pedido.setValorPedido(resultSet.getDouble("valorPedido"));

				listaPedidos.add(pedido);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return listaPedidos;
	}

	public List<Pedido> listarTodosPedidosComClientes() {

		Pedido pedido = new Pedido();

		Cliente cliente = new Cliente();

		List<Pedido> listaPedidos = new ArrayList<Pedido>();

		String sql = "SELECT * FROM pedido inner join cliente on (idpedido = idcliente)";

		try {
			PreparedStatement consultar = conexao.prepareStatement(sql);

			ResultSet resultSet = consultar.executeQuery();

			while (resultSet.next()) {

				pedido.setCodigoCliente(resultSet.getInt("idpedido"));

				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

				pedido.setDt_pedido(resultSet.getDate("dt_pedido"));

				pedido.setValorPedido(resultSet.getDouble("valorPedido"));

				cliente.setId_cliente(resultSet.getInt("idcliente"));

				cliente.setCep(resultSet.getString("cep"));
				
				listaPedidos.add(pedido);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return listaPedidos;
	}

	/**
	 * Método responsável por buscar o id do cliente e inserir o dados na tabela
	 * associativa Tabela associativa produto_tem_pedido
	 * 
	 * @param produto
	 * @param idcliente
	 * 
	 * @author danilo
	 */
	/*
	 * public void inserirPedidosComProduto(Produto produto, int idcliente) {
	 * 
	 * int idresult1 = 0;
	 * 
	 * PreparedStatement SQL;
	 * 
	 * try {
	 * 
	 * SQL =
	 * conexao.prepareStatement("SELECT * FROM cliente WHERE idcliente = ?");
	 * 
	 * SQL.setInt(1, idcliente);
	 * 
	 * ResultSet rs2 = SQL.executeQuery();
	 * 
	 * if(rs2.next()) {
	 * 
	 * int lastInsetNome = rs2.getInt("idcliente");
	 * 
	 * produto.setCod_produto(cod_produto);(lastInsetNome);
	 * 
	 * idresult1 = pedido.getCodigoCliente();
	 * 
	 * } else {
	 * 
	 * JOptionPane.showMessageDialog(null, "Cliente nao encontrado");
	 * 
	 * }
	 * 
	 * 
	 * } catch (SQLException e) {
	 * 
	 * JOptionPane.showMessageDialog(null, "ERRO DE SQL" +e);
	 * 
	 * 
	 * } }
	 */

}
