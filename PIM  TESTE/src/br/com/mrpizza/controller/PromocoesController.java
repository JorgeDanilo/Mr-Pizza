package br.com.mrpizza.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.PromocaoDao;
import br.com.mrpizza.modelo.Promocoes;


@WebServlet("/PromocoesController")
public class PromocoesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PromocaoDao daoPromocoes = new PromocaoDao();
		
		Promocoes modeloPromocoes = new Promocoes();
		
		String valor = request.getParameter("preco");
		
		String descricao = request.getParameter("descricao");
		
		modeloPromocoes.setDescricao(descricao);
		
		modeloPromocoes.setPreco_venda(valor);
		
		if (!daoPromocoes.inserirPromocao(modeloPromocoes)) {
			
			request.setAttribute("mensagem", "Promoção Cadastrado com Sucesso!");
			
			RequestDispatcher rd = request.getRequestDispatcher("cadPromocoes.jsp");
			
			rd.forward(request, response);
			
		} else {
			
			
			
		}
		
	}

}
