package br.com.mrpizza.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mrpizza.controller.dao.Clientedao;
import br.com.mrpizza.modelo.Cliente;

@WebServlet("/cadastrarusuario.do")
public class CadastrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
    public CadastrarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cliente modeloCliente = new Cliente();
		Clientedao daoCliente = new Clientedao();
		
		String nome = request.getParameter("nome");

		String loginCliente = request.getParameter("login");

		String senhaCliente = request.getParameter("senha");
		
		String logradouro = request.getParameter("logradouro");
		
		String cep = request.getParameter("cep");
			
		String numero = request.getParameter("numero");
		
		
		
		modeloCliente.setNome(nome);
		
		modeloCliente.setLogin(loginCliente);
		
		modeloCliente.setSenha(senhaCliente);
		
		modeloCliente.setLogradouro(logradouro);
		
		modeloCliente.setCep(cep);
		
		modeloCliente.setNumero(numero);
		
		
		if(!daoCliente.inserir(modeloCliente)) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/exibircliente.jsp");
			
			rd.forward(request, response);
			
		}
	}

}
