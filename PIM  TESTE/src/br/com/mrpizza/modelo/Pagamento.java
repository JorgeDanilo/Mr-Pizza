package br.com.mrpizza.modelo;


/**
 * Classe bean responsavel por guardar os dados de pagamento.
 * @author danilo
 * @version 1.0
 */
public class Pagamento {

	private int idPagamento;
	private double valorParaTroco;
	private int codigoCliente;

	public int getIdPagamento() {
		return idPagamento;
	}

	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}

	public double getValorParaTroco() {
		return valorParaTroco;
	}

	public void setValorParaTroco(double valorParaTroco) {
		this.valorParaTroco = valorParaTroco;
	}

	public int getCodigoCliente() {
		return codigoCliente;
	}

	public void setCodigoCliente(int codigoCliente) {
		this.codigoCliente = codigoCliente;
	}
	
	
	
}
