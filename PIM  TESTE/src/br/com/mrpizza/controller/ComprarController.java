package br.com.mrpizza.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.ProdutoDao;
import br.com.mrpizza.modelo.Produto;


/**
 * Servlet implementation class ComprarController
 */
@WebServlet("/comprarcontroller.do")
public class ComprarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComprarController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProdutoDao daoProduto = new ProdutoDao();
		
		Produto modeloProduto = new Produto();
		
		String acao = request.getParameter("acao");
		
		if(acao != null && acao.equals("comprar")) {
			
			String id = request.getParameter("id");
			
			String descricao = request.getParameter("descricao");
			
			String preco = request.getParameter("preco");
			
			request.getRequestDispatcher("comprar.jsp").forward(request, response);
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
