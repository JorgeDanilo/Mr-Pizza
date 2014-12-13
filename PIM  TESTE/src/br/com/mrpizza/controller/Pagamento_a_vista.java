package br.com.mrpizza.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.PagamentoDao;
import br.com.mrpizza.modelo.Pagamento;


@WebServlet("/Pagamento_a_vista")
public class Pagamento_a_vista extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
    public Pagamento_a_vista() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String valor_para_troco = request.getParameter("valor");
		
		double valor_convertido = Double.parseDouble(valor_para_troco);
		
		String idcliente = request.getParameter("idcliente");
		
		int idclienteconvertido = Integer.parseInt(idcliente);
		
		Pagamento modeloPagamento = new Pagamento();
		
		PagamentoDao daoPagemento = new PagamentoDao();
		
		modeloPagamento.setCodigoCliente(idclienteconvertido);
		
		modeloPagamento.setValorParaTroco(valor_convertido);
		
		daoPagemento.inserirPagamento(modeloPagamento, idclienteconvertido);
		
		request.setAttribute("mensagem", "Pedido realizado com Sucesso!");
		
		request.getRequestDispatcher("pagamento.jsp").forward(request,response);
		
		
	}

}
