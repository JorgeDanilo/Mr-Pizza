package br.com.mrpizza.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import br.com.mrpizza.controller.ConexaoBanco;
import br.com.mrpizza.modelo.Produto;
import br.com.mrpizza.modelo.Promocoes;

/**
 * Classe responsavel por realizar as persistencias no banco
 * @author danilo
 *
 */
public class PromocaoDao {

	Connection conexao;
	
	public PromocaoDao() {
		
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
	 * Método responsavel por realizar as insercão no banco de dados.
	 * @param promocao
	 * @return 
	 * @author danilo
	 */
	public boolean inserirPromocao(Promocoes promocao) {
		
		StringBuilder str = new StringBuilder();
		
		str.append("INSERT INTO promocoes");
		
		str.append("(dt_promocao, preco_venda, descricao)");
		
		str.append("VALUES (?,?,?)");
		
		try {

			PreparedStatement insert = conexao.prepareStatement(str.toString());
			
			insert.setDate(1, getCurrentDate());
			
			insert.setString(2, promocao.getPreco_venda());
			
			insert.setString(3, promocao.getDescricao());
			
			return insert.execute();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			return false;
			
		}
		
		
	}
	
	
	/**
	 * Método responsavel por listar todos as promocoes de produtos cadastrados no banco.
	 * @return lista de promocoes de produtos ? null 
	 * @author danilo
	 */
	public List<Promocoes> listarPromocoes() {
		
		List<Promocoes> listaPromocoes = new ArrayList<Promocoes>();
		
		String sql = "SELECT * FROM promocoes";
		
		try {
			
			PreparedStatement consultar = conexao.prepareStatement(sql);
			
			ResultSet resultSet = consultar.executeQuery();
			
			while (resultSet.next()) {
				
				Promocoes promocoes = new Promocoes();

				promocoes.setPreco_venda(resultSet.getString("preco_venda"));
				
				promocoes.setDescricao(resultSet.getString("descricao"));
				
				promocoes.setCod_promocao(resultSet.getInt("idpromo"));
				
				listaPromocoes.add(promocoes);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return listaPromocoes;
		
	}
	
	public boolean alterar(Promocoes promocao) {

		String sql = "UPDATE promocoes SET dt_promocao= ?, descricao= ?, preco_venda= ? WHERE idpromo= ?";

		try {
			PreparedStatement insert = conexao.prepareStatement(sql);

			insert.setDate(1, getCurrentDate());
			insert.setString(2, promocao.getDescricao());
			insert.setString(3, promocao.getPreco_venda());
			insert.setInt(4, promocao.getCod_promocao());

			JOptionPane.showMessageDialog(null, "Promoção Alterado com Sucesso");

			return insert.execute();

		} catch (SQLException e) {

			e.printStackTrace();

			return false;

		}

	}


	public void excluir(Promocoes modeloPromocao) {

		String sql = "DELETE FROM promocoes WHERE idpromo = ?";
		
		try {
			
			PreparedStatement excluir = conexao.prepareStatement(sql);
			excluir.setInt(1, modeloPromocao.getCod_promocao());
			
			excluir.execute();
			excluir.close();
			
			JOptionPane.showMessageDialog(null, "Promoçao Excluida com sucesso");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	
}
