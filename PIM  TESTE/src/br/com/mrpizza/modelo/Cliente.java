package br.com.mrpizza.modelo;

/**
 * Classe bean responsavel por guardar as informacoes dos clientes.
 * 
 * @author danilo
 * @return (int id_cliente, String nome, String login, String senha, String logradouro, String cep, String numero)
 * 
 */
public class Cliente {

	private int id_cliente;
	private String nome;
	private String login;
	private String senha;
	private String logradouro;
	private String cep;
	private String numero;


	
	public Cliente() {
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	};

}
