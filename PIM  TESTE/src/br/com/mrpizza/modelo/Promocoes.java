package br.com.mrpizza.modelo;

import java.util.Date;

/**
 * Classe responsavel por guardar as informações das promoções.
 * 
 * @author danilo
 * @return (Date dt_promocao, String descricao, Object foto, double preco_venda)
 */
public class Promocoes {

	private int cod_promocao;
	private Date dt_promocao;
	private String descricao;
	private Object foto;
	private String preco_venda;

	public int getCod_promocao() {
		return cod_promocao;
	}

	public void setCod_promocao(int cod_promocao) {
		this.cod_promocao = cod_promocao;
	}

	public Date getDt_promocao() {
		return dt_promocao;
	}

	public void setDt_promocao(Date dt_promocao) {
		this.dt_promocao = dt_promocao;
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

	public String getPreco_venda() {
		return preco_venda;
	}

	public void setPreco_venda(String preco_venda) {
		this.preco_venda = preco_venda;
	}

}
