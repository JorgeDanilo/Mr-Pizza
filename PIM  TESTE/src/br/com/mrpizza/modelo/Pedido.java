package br.com.mrpizza.modelo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Classe responsavel por guardar os dados dos pedidos
 * 
 * @author danilo
 * @return (Date dt_pedido, double valorPedido, Cliente id_cliente)
 */
public class Pedido {

	private Date dt_pedido;
	private double valorPedido;
	private int codigoCliente;

	public Date getDt_pedido() {
		return dt_pedido;
	}

	public void setDt_pedido(Date dt_pedido) {
		this.dt_pedido = dt_pedido;
	}

	public double getValorPedido() {
		return valorPedido;
	}

	public void setValorPedido(double valorPedido) {
		this.valorPedido = valorPedido;
	}

	public int getCodigoCliente() {
		return codigoCliente;
	}

	public void setCodigoCliente(int codigoCliente) {
		this.codigoCliente = codigoCliente;
	}
	
	
	/**
	 * Metodo responsavel por realizar a conversao da data...
	 * @return
	 */
	public String getDataFormatada() {
		
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		
		return formato.format(getDt_pedido());
	}

}
