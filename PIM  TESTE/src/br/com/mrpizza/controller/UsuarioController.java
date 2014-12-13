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

import br.com.mrpizza.controller.dao.Clientedao;
import br.com.mrpizza.modelo.Cliente;


@WebServlet("/usuariocontroller.do")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsuarioController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		
		String nome = request.getParameter("txtnome");

		String senha = request.getParameter("txtsenha");
		
		String cod = request.getParameter("codigo");
		
		int codconvertido = Integer.parseInt(cod);

		String msg = "";

		RequestDispatcher rd = null;

		PrintWriter saida = response.getWriter();

		
		
		Cliente modeloCliente = new Cliente();
		

		Clientedao daoCliente = new Clientedao();

		modeloCliente.setLogin(nome);
		
		modeloCliente.setSenha(senha);
		
		modeloCliente.setId_cliente(codconvertido);

		Cliente verficaUsuario = daoCliente.autenticar(modeloCliente);

		if (verficaUsuario != null) {

			HttpSession sessao = request.getSession();

			sessao.setAttribute("USER", nome);
			
			sessao.setAttribute("ID", codconvertido);
			
			sessao.setMaxInactiveInterval(60);

			rd = request.getRequestDispatcher("testeHomePizza.jsp");

			rd.forward(request, response);

		} else {

			request.setAttribute("mensagem", "Nome/Senha invalido");

			request.getRequestDispatcher("homePizza.jsp").forward(request,
					response);

		}

	}

}
