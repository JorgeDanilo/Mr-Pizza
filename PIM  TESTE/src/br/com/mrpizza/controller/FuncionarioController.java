package br.com.mrpizza.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.FuncionarioDao;
import br.com.mrpizza.controller.dao.PromocaoDao;
import br.com.mrpizza.modelo.Funcionario;
import br.com.mrpizza.modelo.Promocoes;

@WebServlet("/FuncionarioController")
public class FuncionarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FuncionarioController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FuncionarioDao daoFuncionario = new FuncionarioDao();
		
		Funcionario modeloFuncionario = new Funcionario();
		
		String acao = request.getParameter("acao");
		
		if(acao != null && acao.equals("exc")) {
			
			String id = request.getParameter("id");
			
			modeloFuncionario.setCpf(id);
			
			daoFuncionario.excluir(modeloFuncionario);
			
			request.getRequestDispatcher("visu_funcionarios.jsp").forward(request, response);
		
	}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//recebe os dados da view de cadastro de funcionarios.
		
		String nome = request.getParameter("nome");
		
		String cpf = request.getParameter("cpf");
		
		String ctps = request.getParameter("ctps");
		
		String funcao = request.getParameter("funcao");
		
		String logradouro = request.getParameter("logradouro");
		
		String cep = request.getParameter("cep");
		
		String numero = request.getParameter("numero");
		
		String nivel = request.getParameter("nivel");
		
		Funcionario modeloFuncionario = new Funcionario();
		
		FuncionarioDao daoFuncionario = new FuncionarioDao();
		
		modeloFuncionario.setNome(nome);
		
		modeloFuncionario.setCpf(cpf);
		
		modeloFuncionario.setCtps(ctps);
		
		modeloFuncionario.setFuncao(funcao);
		
		modeloFuncionario.setLogradouro(logradouro);
		
		modeloFuncionario.setCep(cep);
		
		modeloFuncionario.setNumero(numero);
		
		int nivelConvertido = Integer.parseInt(nivel);
		
		modeloFuncionario.setNivel(nivelConvertido);
		
		if (!daoFuncionario.inserir(modeloFuncionario)) {
		
			request.setAttribute("mensagem", "Funcionario Cadastrado com Sucesso!");
			
			RequestDispatcher rd = request.getRequestDispatcher("visu_funcionarios.jsp");
			
			rd.forward(request, response);
			
		} else {
			
			PrintWriter out = response.getWriter();
			
			request.setAttribute("mensagem2", "Provavelmente seu Cps está invalido");
			
			RequestDispatcher rd = request.getRequestDispatcher("respostaCadFuncionario.jsp");
			
			rd.forward(request, response);
			
			return;
			
		}
		
		
		
		
	}

}


