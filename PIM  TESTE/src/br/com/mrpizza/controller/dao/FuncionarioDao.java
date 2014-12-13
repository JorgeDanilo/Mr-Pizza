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
import br.com.mrpizza.modelo.Funcionario;
import br.com.mrpizza.modelo.Promocoes;

/**
 * Classe responsavel por realizar o CRUD dos funcionairos.
 * @author danilo
 *
 */
public class FuncionarioDao implements IntFuncionarioDao {

	Connection conexao;
	
	public FuncionarioDao() {
		
		try {
			
			conexao = ConexaoBanco.getConexao();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	}
	
	
	/**
	 * Metodo responsavel por realizar a persistência do funcionario no banco.
	 * @param funcionario
	 * @return
	 */
	
	@Override
	public boolean inserir(Funcionario funcionario) {
		
		StringBuilder str = new StringBuilder();
		
		str.append("INSERT INTO funcionario");
		
		str.append("(cpf, nome, funcao, ctps, logradouro, cep, numero, nivel)");
				
		str.append("VALUES (?,?,?,?,?,?,?,?)");
		
		try {
			
			PreparedStatement insert = conexao.prepareStatement(str.toString());
			
			insert.setString(1, funcionario.getCpf());
			
			insert.setString(2, funcionario.getNome());
			
			insert.setString(3, funcionario.getFuncao());
			
			insert.setString(4, funcionario.getCtps());
			
			insert.setString(5, funcionario.getLogradouro());
			
			insert.setString(6, funcionario.getCep());
			
			insert.setString(7, funcionario.getNumero());
			
			insert.setInt(8, funcionario.getNivel());
			
			return insert.execute();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
			JOptionPane.showMessageDialog(null, "Erro de cadastro.\n Verifique o seu cpf.");
			
			return false;
			
		}
		
	}


	/**
	 * Método responsável por realizar a pesquisa de todos os funcionarios no banco.
	 * @author danilo
	 */
	
	@Override
	public List<Funcionario> listarTodos() {
		
		List<Funcionario> listaFuncionarios = new ArrayList<Funcionario>();
		
		String sql = "SELECT * FROM funcionario";
		
		try {
			
			PreparedStatement consulta = conexao.prepareStatement(sql);
			
			ResultSet resultSet = consulta.executeQuery();
			
			while (resultSet.next()) {
				
				Funcionario funcionario = new Funcionario();
				
				funcionario.setCpf(resultSet.getString("cpf"));
				
				funcionario.setNome(resultSet.getString("nome"));
				
				funcionario.setFuncao(resultSet.getString("funcao"));
				
				funcionario.setCtps(resultSet.getString("ctps"));
				
				funcionario.setLogradouro(resultSet.getString("logradouro"));
				
				funcionario.setCep(resultSet.getString("cep"));
				
				funcionario.setNumero(resultSet.getString("numero"));
				
				funcionario.setNivel(resultSet.getInt("nivel"));
				
				listaFuncionarios.add(funcionario);
				
				
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		}
		
		return listaFuncionarios;
	}
	
	
	/**
	 * Método responsavel por realizar a alteracao dos funcionarios no sistema.
	 * 
	 * @param funcionario
	 * @return
	 * 
	 * @author danilo
	 */
	public boolean alterar(Funcionario funcionario) {

		String sql = "UPDATE funcionario SET nome =  ?, funcao = ?, ctps = ?, logradouro = ? , cep = ?, numero = ? WHERE cpf=?";

		try {
			PreparedStatement insert = conexao.prepareStatement(sql);

			insert.setString(1, funcionario.getNome());
			insert.setString(2, funcionario.getFuncao());
			insert.setString(3, funcionario.getCtps());
			insert.setString(4, funcionario.getLogradouro());
			insert.setString(5, funcionario.getCep());
			insert.setString(6, funcionario.getNumero());
			insert.setString(7, funcionario.getCpf());

			JOptionPane.showMessageDialog(null, "Funcionário Alterado com Sucesso");

			return insert.execute();

		} catch (SQLException e) {

			e.printStackTrace();

			return false;

		}

	}
	
	
	public void excluir(Funcionario funcionario) {
		
		String sql = "DELETE FROM funcionario WHERE cpf = ?";
		
		try {
			
			PreparedStatement excluir = conexao.prepareStatement(sql);
			
			excluir.setString(1, funcionario.getCpf());
			
			excluir.execute();
			
			excluir.close();
			
			JOptionPane.showMessageDialog(null, "Funcionário Excluido com sucesso");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
	}
	
	/**
	 * Método responsaval por realizar o login do funcionario
	 * @param funcionario
	 * @return
	 * @author danilo
	 */
	public Funcionario autenticar(Funcionario funcionario) {

		String sql = "SELECT * FROM funcionario WHERE nome = ? AND cpf = ? AND nivel = ?";

		try {

			PreparedStatement consultar = conexao.prepareStatement(sql);

			consultar.setString(1, funcionario.getNome());
			consultar.setString(2, funcionario.getCpf());
			consultar.setInt(3, funcionario.getNivel());

			ResultSet resultSet = consultar.executeQuery();

			if (resultSet.next()) {

				Funcionario modfuncionario = new Funcionario();

				modfuncionario.setCpf(resultSet.getString("cpf"));
				modfuncionario.setNome(resultSet.getString("nome"));
				modfuncionario.setNivel(resultSet.getInt("nivel"));
				
				return modfuncionario;

			}

			consultar.close();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null;

	}
	
}
