package br.com.mrpizza.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.PedidoDao;
import br.com.mrpizza.modelo.Pedido;

@WebServlet("/PedidoControllerFuncionario")
public class PedidoControllerFuncionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public PedidoControllerFuncionario() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Pedido modeloPedido = new Pedido();
		
		PedidoDao daoPedido = new PedidoDao();
		
		PrintWriter out = response.getWriter();
		
		String cliente = request.getParameter("cliente");
		
		int clienteconvertido = Integer.parseInt(cliente);
		
		out.println(cliente);
		
		String produto = request.getParameter("produto");
		
		int produtoconvertido = Integer.parseInt(produto);
		
		String qtd = request.getParameter("quantidade");
		
		int quantidadeconvertido = Integer.parseInt(qtd);
		
		String valor = request.getParameter("valor");
		
		double valorconvertido = Double.parseDouble(valor);
		
		modeloPedido.setCodigoCliente(clienteconvertido);
		
		modeloPedido.setValorPedido(valorconvertido);
		
		daoPedido.inserirPedido(modeloPedido, clienteconvertido, produtoconvertido, quantidadeconvertido);
		
		out.println("Pedido inserido com sucesso!");
		
		
		/*RequestDispatcher rd = request.getRequestDispatcher("testeHomePizza.jsp");*/
		
	/*	rd.forward(request, response);*/
		
	}

}
