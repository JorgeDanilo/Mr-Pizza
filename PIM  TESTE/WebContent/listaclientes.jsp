<%@page import="java.util.List"%>
<%@page import="br.com.mrpizza.modelo.Cliente"%>
<%@page import="br.com.mrpizza.controller.dao.Clientedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<title>****Cliente</title>
</head>
<body>
	
	<h4>Lista de Clientes</h4>
	
<div id="lista">	
	<table border="1">
		<tr>
			<td>Seu Codigo</td>
			<td>Nome</td>
			<td>Endereço</td>
			<td>Cep</td>
			<td>Número</td>
			<td>Login</t>
			<td>Senha</td>
		</tr>
	
	<%
	
	Clientedao daocliente = new Clientedao();
	List<Cliente> list = daocliente.listaCliente();
	
	for(Cliente client : list) {
	
	%>
		<tr>
			<td><%=client.getId_cliente() %></td>
			<td><%=client.getNome() %></td>
			<td><%=client.getLogradouro() %></td>
			<td><%=client.getCep()%></td>
			<td><%=client.getNumero() %></td>
			<td><%=client.getLogin() %></td>
			<td><%=client.getSenha() %></td>
			<td><input type="checkbox" value=""/></td>
		</tr>
		
		<%} %>
	</table>
	
				<script>
    
  					$('input').on('click', function() {
    				$('input[type="checkbox"]').parent().css('background', 'white');
    				$('input[type="checkbox"]:checked').parent().css('background', '#FFE4B5');
  					
  					});
  
				</script>
	
</div>	
</body>
</html>
