package br.com.mrpizza.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import br.com.mrpizza.controller.ConexaoBanco;
import br.com.mrpizza.modelo.Cliente;
import br.com.mrpizza.modelo.Sugestoes;

/**
 * Classe responsavel por inserir dados das sugestoes dos clientes no banco.
 * 
 * @author danilo
 * 
 */
public class SugestaoDao {

	Connection conexao;

	Cliente cliente;

	public SugestaoDao() {

		try {

			conexao = ConexaoBanco.getConexao();

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	/**
	 * Método responsavel por inserir as sugestoes de clientes no banco.
	 * 
	 * @param sugestoes
	 * @param idcliente
	 * @return as insercoes no banco :)
	 * 
	 */

	public void inserirSugestao(Sugestoes sugestoes, int idcliente) {

		int idresult = 0;
		PreparedStatement SQL;

		try {
			SQL = conexao
					.prepareStatement("SELECT * FROM cliente where idcliente = ?");
			SQL.setInt(1, idcliente);

			ResultSet rs = SQL.executeQuery();

			if (rs.next()) {
				int lastInsertId = rs.getInt("idcliente");
				sugestoes.setId_cliente(lastInsertId);
				idresult = sugestoes.getId_cliente();

			} else {
				JOptionPane.showMessageDialog(null, "Cliente nao encontrado");
			}

		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "ERRO DE SQL " + e);
		}

		try {

			PreparedStatement ps2 = conexao
					.prepareStatement("insert into sugestoes (email,"
							+ "descricao, "
							+ "cliente_idcliente) VALUES (?,?,?)");

			ps2.setString(1, sugestoes.getEmail());
			ps2.setString(2, sugestoes.getDescricao());
			ps2.setInt(3, idresult);

			ps2.execute();

			ps2.close();
			conexao.close();

		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro no SQL" + e);
		}

	}

	/**
	 * Metodo responsavel por listar as sugestoes aos funcionarios...
	 * 
	 * @return lista de sugestoes para os clientes.
	 */
	public java.util.List<Sugestoes> listaSugestoes() {

		java.util.List<Sugestoes> listar = new ArrayList<Sugestoes>();

		String sql = "SELECT * FROM sugestoes";

		PreparedStatement consultar;

		try {
			consultar = conexao.prepareStatement(sql);

			ResultSet resultSet = consultar.executeQuery();

			while (resultSet.next()) {

				Sugestoes sugestoes = new Sugestoes();

				sugestoes.setEmail(resultSet.getString("email"));
				sugestoes.setDescricao(resultSet.getString("descricao"));

				conexao.close();

			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return listar;

	}
}
