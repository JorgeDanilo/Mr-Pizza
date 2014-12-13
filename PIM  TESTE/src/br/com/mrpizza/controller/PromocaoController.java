package br.com.mrpizza.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import br.com.mrpizza.controller.dao.PromocaoDao;
import br.com.mrpizza.modelo.Promocoes;

@WebServlet("/PromocaoController")
public class PromocaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PromocaoDao daoPromocao = new PromocaoDao();
		
		Promocoes modeloPromocao = new Promocoes();
		
		String acao = request.getParameter("acao");
		
		if(acao != null && acao.equals("exc")) {
			
			String id = request.getParameter("id");
			
			modeloPromocao.setCod_promocao(Integer.parseInt(id));
			
			daoPromocao.excluir(modeloPromocao);
			
			request.getRequestDispatcher("visu_promocao.jsp").forward(request, response);
		
	}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		PromocaoDao daoPromocao = new PromocaoDao();
		
		Promocoes modeloPromocao = new Promocoes();
		
		String codigo = request.getParameter("codigo");
		
		int codigoconvertido = Integer.parseInt(codigo);
		
		String descricao = request.getParameter("descricao");
		
		String valor = request.getParameter("preco");
		
		modeloPromocao.setCod_promocao(codigoconvertido);
		
		modeloPromocao.setDescricao(descricao);
		
		modeloPromocao.setPreco_venda(valor);
		
		if(! daoPromocao.alterar(modeloPromocao)) {
			
			RequestDispatcher rd = request.getRequestDispatcher("visu_promocao.jsp");
			
			rd.forward(request, response);
			
		} else {
			
			
		}
		
		
	}

}
