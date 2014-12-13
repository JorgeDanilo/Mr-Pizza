package br.com.mrpizza.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.mrpizza.controller.dao.FuncionarioDao;
import br.com.mrpizza.modelo.Funcionario;


@WebServlet("/AutenticaFuncionarioController")
public class AutenticaFuncionarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AutenticaFuncionarioController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		
		String cpf = request.getParameter("cpf");
		
		String nivel = request.getParameter("nivel");
		
		int nivelconvertido = Integer.parseInt(nivel);
		
		Funcionario modeloFuncionario = new Funcionario();
		
		FuncionarioDao daoFuncionario = new FuncionarioDao();
		
		modeloFuncionario.setCpf(cpf);
		
		modeloFuncionario.setNome(nome);
		
		modeloFuncionario.setNivel(nivelconvertido);
		
		PrintWriter out = response.getWriter();
		
		if(daoFuncionario.autenticar(modeloFuncionario)!= null && modeloFuncionario.getNivel() == 3) {
			
			out.println("Nivel de acesso: " + modeloFuncionario.getNivel());
			
			HttpSession sessao = request.getSession();

			sessao.setAttribute("ADM", nome);
			
			sessao.setAttribute("ADM_CPF", cpf);
			
			sessao.setAttribute("ADM_NIVEL", nivelconvertido);
			
			RequestDispatcher rd = request.getRequestDispatcher("visu_funcionarios.jsp");
			
			rd.forward(request, response);
			
		} else if (daoFuncionario.autenticar(modeloFuncionario) != null && modeloFuncionario.getNivel() == 2) {
			
			out.println("Nivel de acesso: " + modeloFuncionario.getNivel());
			
			HttpSession sessao = request.getSession();

			sessao.setAttribute("GERENTE", nome);
			
			sessao.setAttribute("GERENTE_CPF", cpf);
			
			sessao.setAttribute("GERENTE_NIVEL", nivelconvertido);
			
			RequestDispatcher rd = request.getRequestDispatcher("visu_pedidos.jsp");
			
			rd.forward(request, response);
			
		} else if (daoFuncionario.autenticar(modeloFuncionario) != null && modeloFuncionario.getNivel() == 1) {
			
			out.println("Nivel de acesso: " + modeloFuncionario.getNivel());
			
			HttpSession sessao = request.getSession();

			sessao.setAttribute("FUNC", nome);
			
			sessao.setAttribute("FUNC_CPF", cpf);
			
			sessao.setAttribute("FUNC_NIVEL", nivelconvertido);
			
			RequestDispatcher rd = request.getRequestDispatcher("comprarFuncionario.jsp");
			
			rd.forward(request, response);
			
		} else {
			
			out.println("Não autenticado!");
			
			RequestDispatcher rd = request.getRequestDispatcher("login_funcionario.jsp");
			
			rd.forward(request, response);
		}
				
		
	}

}
