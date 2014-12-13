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

@WebServlet("/ControllerPedidoPromocoes")
public class ControllerPedidoPromocoes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//recebe os dados da view comprar e enseri as mesmas no banco de dados..
		
				Pedido modeloPedido = new Pedido();
				
				PedidoDao daoPedido = new PedidoDao();
				
				String idProduto = request.getParameter("id");
				
				String preco = request.getParameter("preco");
				
				String codigoCliente = request.getParameter("nome");
				
				/*Convertendo o id do cliente para inteiro*/
				int codigo = Integer.parseInt(codigoCliente);
				
				/*Convertendo o id do produto para inteiro*/
				int idprodutoconvertido = Integer.parseInt(idProduto);
				
				modeloPedido.setCodigoCliente(codigo);
				
				Double precoNovo = Double.parseDouble(preco);
				
				modeloPedido.setValorPedido(precoNovo);
				
				/*daoPedido.inserirPedido(modeloPedido, codigo, idprodutoconvertido, quantidadesProd);*/
					
				daoPedido.inserirPedidoPromocoes(modeloPedido, codigo, idprodutoconvertido);
				
				PrintWriter out = response.getWriter();
				
				out.println("Pedido inserido com sucesso!\n "
						+ "Aguarde a Pizza Chegar...");
				
				
				RequestDispatcher rd = request.getRequestDispatcher("testeHomePizza.jsp");
				
				rd.forward(request, response);
			}
}
