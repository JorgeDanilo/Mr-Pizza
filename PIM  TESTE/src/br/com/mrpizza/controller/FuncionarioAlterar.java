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
import br.com.mrpizza.modelo.Funcionario;

/**
 * Servlet implementation class FuncionarioAlterar
 */
@WebServlet("/FuncionarioAlterar")
public class FuncionarioAlterar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuncionarioAlterar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Funcionario modeloFuncionario = new Funcionario();
		
		FuncionarioDao daoFuncionario = new FuncionarioDao();
		
		String codigo = request.getParameter("codigo");
		
		String nome = request.getParameter("nome");
		
		String funcao = request.getParameter("funcao");
		
		String ctps = request.getParameter("ctps");
		
		String logradouro = request.getParameter("logradouro");
		
		String cep = request.getParameter("cep");
		
		String numero = request.getParameter("numero");
		
		modeloFuncionario.setCpf(codigo);
		
		modeloFuncionario.setNome(nome);
		
		modeloFuncionario.setFuncao(funcao);
		
		modeloFuncionario.setCtps(ctps);
		
		modeloFuncionario.setLogradouro(logradouro);
		
		modeloFuncionario.setCep(cep);
		
		modeloFuncionario.setNumero(numero);

		PrintWriter saida = response.getWriter();
		
		if(! daoFuncionario.alterar(modeloFuncionario)) {
			
			saida.println("Alterado com sucesso");
			
			RequestDispatcher rd = request.getRequestDispatcher("visu_funcionarios.jsp");
			
			rd.forward(request, response);
			
		} else {
			
			saida.println("Erro ao alterar funcionário");
			
		}
		
	}

}
