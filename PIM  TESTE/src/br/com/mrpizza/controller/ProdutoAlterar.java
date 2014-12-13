package br.com.mrpizza.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.ProdutoDao;
import br.com.mrpizza.modelo.Produto;


@WebServlet("/ProdutoAlterar")
public class ProdutoAlterar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ProdutoAlterar() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Produto modeloProduto = new Produto();
		
		ProdutoDao daoProduto = new ProdutoDao();
		
		String codigo = request.getParameter("codigo");
		
		int codConvertido = Integer.parseInt(codigo);
		
		String preco = request.getParameter("preco");
		
		double precoConvertido = Double.parseDouble(preco);
		
		String descricao = request.getParameter("descricao");
		
		modeloProduto.setCod_produto(codConvertido);
		
		modeloProduto.setPreco_venda(precoConvertido);
		
		modeloProduto.setDescricao(descricao);
		
		PrintWriter saida = response.getWriter();
		
		if(! daoProduto.alterar(modeloProduto)) {
			
			request.setAttribute("mensagem", "Produto Alterado com Sucesso!");
			
			request.getRequestDispatcher("visu_produtos.jsp").forward(request,response);
			
		} else {
			
			saida.println("Erro ao alterar Produto");
			
		}
		
	}

}
