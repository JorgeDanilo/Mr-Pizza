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


@WebServlet("/ServletFecharSessao")
public class ServletFecharSessao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServletFecharSessao() {
        super();
    }


    /**
     * Método que finaliza uma sessão do cliente.
     * @author danilo
     * 
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession sessao = request.getSession(true);
		sessao.invalidate();

		
		RequestDispatcher rd = request.getRequestDispatcher("login.html");
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
