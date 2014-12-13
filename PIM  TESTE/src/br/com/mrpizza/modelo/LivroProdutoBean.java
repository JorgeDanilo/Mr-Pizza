package br.com.mrpizza.modelo;

public class LivroProdutoBean {

	private long codigo;
	private String descricao;
	private double preco;
	
	
	public LivroProdutoBean() {
	}


	public long getCodigo() {
		return codigo;
	}


	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}


	public String getDescricao() {
		return descricao;
	}


	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}


	public double getPreco() {
		return preco;
	}


	public void setPreco(double preco) {
		this.preco = preco;
	}

	
	
}
