package br.com.mrpizza.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import br.com.mrpizza.controller.ConexaoBanco;
import br.com.mrpizza.modelo.Funcionario;
import br.com.mrpizza.modelo.Produto;

/**
 * Classe responsavel por realizar o CRUD dos produtos.
 * 
 * @author danilo
 * 
 */
public class ProdutoDao {

	Connection conexao;;

	public ProdutoDao() {

		try {

			conexao = ConexaoBanco.getConexao();

		} catch (Exception e) {

			e.printStackTrace();

		}
	}

	/**
	 * Metodo responsavel por realizar a inclusao no banco de dados.
	 * 
	 * @param produto
	 * @return true ? false
	 */
	public boolean inserirProdutos(Produto produto) {

		StringBuilder str = new StringBuilder();

		str.append("INSERT INTO produto");

		str.append("(descricao, preco_venda)");

		str.append("VALUES (?,?)");

		try {
			
			PreparedStatement insert = conexao.prepareStatement(str.toString());
			
			insert.setString(1, produto.getDescricao());
			
//			insert.setObject(2, produto.getFoto());
			
			insert.setDouble(2, produto.getPreco_venda());
			
			return insert.execute();

		} catch (SQLException e) {

			e.printStackTrace();

			return false;

		}

	}
	
	
	/**
	 * Método responsavel por listar todos os produtos cadastrados no banco.
	 * @return lista de produtos ? null 
	 * @author danilo
	 */
	public List<Produto> listarProdutos() {
		
		List<Produto> listaProduto = new ArrayList<Produto>();
		
		String sql = "SELECT * FROM produto";
		
		try {
			
			PreparedStatement consultar = conexao.prepareStatement(sql);
			
			ResultSet resultSet = consultar.executeQuery();
			
			while (resultSet.next()) {
				
				Produto produto = new Produto();
				
				produto.setDescricao(resultSet.getString("descricao"));
				
				produto.setPreco_venda(resultSet.getDouble("preco_venda"));
				
				produto.setCod_produto(resultSet.getInt("idproduto"));
				
				listaProduto.add(produto);
				
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return listaProduto;
		
	}
	
	public boolean alterar(Produto produto) {

		String sql = "UPDATE produto SET descricao =  ?, preco_venda = ? WHERE idproduto = ?";

		try {
			PreparedStatement insert = conexao.prepareStatement(sql);

			insert.setString(1, produto.getDescricao());
			insert.setDouble(2, produto.getPreco_venda());
			insert.setInt(3, produto.getCod_produto());
			
			JOptionPane.showMessageDialog(null, "Produto Alterado com Sucesso");

			return insert.execute();

		} catch (SQLException e) {

			e.printStackTrace();

			return false;

		}

	}
	
	
	
	public void excluir(Produto produto) {
		
		String sql = "DELETE from produto WHERE idproduto = ?";
		
		try {
			
			PreparedStatement excluir = conexao.prepareStatement(sql);
			
			excluir.setInt(1, produto.getCod_produto());
			
			excluir.execute();
			
			excluir.close();
			
			JOptionPane.showMessageDialog(null, "Produto Excluido com sucesso");
			
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
	}

}
