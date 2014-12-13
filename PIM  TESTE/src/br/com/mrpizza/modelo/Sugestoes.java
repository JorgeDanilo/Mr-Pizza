package br.com.mrpizza.modelo;

/**
 * Classe responsavel por guardar as informacoes das sugestoes.
 * 
 * @author danilo
 * @return (String email, String descricao, Cliente id_cliente)
 */
public class Sugestoes {

	private String email;
	private String descricao;
	private int idcliente;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getId_cliente() {
		return idcliente;
	}

	public void setId_cliente(int id_cliente) {
		this.idcliente = id_cliente;
	}

}
