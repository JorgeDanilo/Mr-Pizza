package br.com.mrpizza.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.SugestaoDao;
import br.com.mrpizza.modelo.Sugestoes;

@WebServlet("/sugestaocontroller.do")
public class SugestaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Sugestoes modeloSugestoes = new Sugestoes();

		SugestaoDao daoSugestoes = new SugestaoDao();

		String email = request.getParameter("email");

		String descricao = request.getParameter("descricao");
		
		String cod_cliente = request.getParameter(("codigo_cliente"));
		
		int cod = Integer.parseInt(cod_cliente);
		

		modeloSugestoes.setEmail(email);

		modeloSugestoes.setDescricao(descricao);

		daoSugestoes.inserirSugestao(modeloSugestoes, cod);

	}

}
