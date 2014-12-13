package br.com.mrpizza.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import br.com.mrpizza.controller.ConexaoBanco;
import br.com.mrpizza.modelo.Pagamento;

/**
 * Classe responsável por fazer as persistencias nas Entidades na tb_forma_pagamento_vista
 * @author danilo
 * @version 1.0
 */
public class PagamentoDao {

	Connection conexao;
	
	public PagamentoDao() {
		
		try {

			conexao = ConexaoBanco.getConexao();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	/**
	 * Método responsavel por inserir os dados no banco ...
	 * @param pagamento
	 * @return void
	 */
	public void inserirPagamento(Pagamento pagamento, int idcliente) {
		
		int idresult1 = 0;

		PreparedStatement SQL;

		try {

			SQL = conexao
					.prepareStatement("SELECT * FROM cliente WHERE idcliente = ?");

			SQL.setInt(1, idcliente);

			ResultSet rs2 = SQL.executeQuery();

			if (rs2.next()) {

				int lastInsetNome = rs2.getInt("idcliente");

				pagamento.setCodigoCliente(lastInsetNome);

				idresult1 = pagamento.getCodigoCliente();

			} else {

				JOptionPane.showMessageDialog(null, "Cliente nao encontrado");

			}

		} catch (SQLException e) {

			JOptionPane.showMessageDialog(null, "ERRO DE SQL" + e);

		}
		
		StringBuilder str = new StringBuilder();
		
		str.append("INSERT INTO tb_forma_pagamento_vista");
		
		str.append("(valor_para_troco, fk_id_cliente)");
		
		str.append("VALUES (?,?)");
		
		try {
			
			PreparedStatement insert = conexao.prepareStatement(str.toString());
			
			insert.setDouble(1, pagamento.getValorParaTroco());
			
			insert.setInt(2, idresult1);
			
			insert.execute();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
