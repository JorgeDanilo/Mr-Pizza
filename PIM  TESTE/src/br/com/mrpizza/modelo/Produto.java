package br.com.mrpizza.modelo;

/**
 * Classe bean responsavel por guardar informacoes dos produtos.
 * 
 * @author danilo
 * @return (String descricao, Objetc foto, double preco_venda)
 */
public class Produto {

	private int cod_produto;
	private String descricao;
	private Object foto;
	private double preco_venda;

	public int getCod_produto() {
		return cod_produto;
	}

	public void setCod_produto(int cod_produto) {
		this.cod_produto = cod_produto;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Object getFoto() {
		return foto;
	}

	public void setFoto(Object foto) {
		this.foto = foto;
	}

	public double getPreco_venda() {
		return preco_venda;
	}

	public void setPreco_venda(double preco_venda) {
		this.preco_venda = preco_venda;
	}

}
