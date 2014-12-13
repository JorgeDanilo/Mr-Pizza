package br.com.mrpizza.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.ProdutoDao;
import br.com.mrpizza.modelo.Produto;

@WebServlet("/CadProdutosFuncionario")
public class CadProdutosFuncionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CadProdutosFuncionario() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Produto modeloProduto = new Produto();
		ProdutoDao daoProduto = new ProdutoDao();
		
		String preco = request.getParameter("preco");
		String descricao = request.getParameter("descricao");
		
		double precoconverter = Double.parseDouble(preco);
		
		modeloProduto.setPreco_venda(precoconverter);
		modeloProduto.setDescricao(descricao);
		
		if(!daoProduto.inserirProdutos(modeloProduto)) {
			RequestDispatcher rd = request.getRequestDispatcher("comprarFuncionario.jsp");
			rd.forward(request, response);
		} else {
			
		}
		
	}

}
