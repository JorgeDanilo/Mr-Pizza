<%@page import="br.com.mrpizza.modelo.Funcionario"%>
<%@page import="br.com.mrpizza.controller.dao.FuncionarioDao"%>
<%@page import="br.com.mrpizza.modelo.Promocoes"%>
<%@page import="java.util.List"%>
<%@page import="br.com.mrpizza.controller.dao.PromocaoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="http://code.angularjs.org/1.0.1/angular-1.0.1.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/sabores.js"></script>
<link rel="stylesheet" type="text/css" href="css/style_teste.css" />
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />
<link href="estilos.css" rel="stylesheet" type="text/css" />
<!-- CSS para as páginas exemplo -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/bootstrap.js"></script>
<meta name="description" content="">
<meta name="author" content="">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
<title>*****Mr Pizza - Pizzas e Produtos...</title>
</head>
<body>
	
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="testeHomePizza.jsp">Mr Pizza</a>
		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#about">Cardápios</a></li>
				<li><a href="">Promoções</a></li>
				<li class="entre_contato"><a href="menu.jsp">Menu</a></li>
				<li><a href="#">Vis.Pedidos</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="sair"><a href="#janela1" rel="modal">Sair</a></li>
			</ul>
		</div>
	</div>
</nav>
	
	<style>
		.contact-form {
    margin-top:70px;
		}
	</style>
	
<br/>
<br/>

<%
	String mensagem = (String) request.getAttribute("mensagem");
	if (mensagem != null) {
	   %><div class="alert alert-success alert-dismissible" align="center" role="alert" style="height: 45px; width: 400px;">
	  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 	 	<% out.println(mensagem);%>
	</div>
	<% } else {
	   out.println("");
	}
%>
<%-- <%=session.getAttribute("ADM_CPF") %> --%>
<div class="container" style="margin-left: 190px;">
<div class="row">
<div class="col-xs-19 col-md-19 form-group">
    	<div class="row">
			<div class="col-md-10">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Visualizar Funcionários.</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
						<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Pesquisar Funcionários..." />
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>CPF</th>
								<th>Nome</th>
								<th>Função</th>
								<th>CTPS</th>
								<th>Logradouro</th>
								<th>CEP</th>
								<th>Número</th>
								<th align="center">Alterar/Excluir</th>
							</tr>
						</thead>
						
						<!--aqui vai os scriplets ....  -->
						<%
						
						/* PromocaoDao daoPromocao = new PromocaoDao();
					
						List<Promocoes> list = daoPromocao.listarPromocoes();
					
						for(Promocoes promocoes : list) { */
							
						FuncionarioDao daoFuncionario = new FuncionarioDao();
						
						List<Funcionario> listaFuncionario = daoFuncionario.listarTodos();
						
						for(Funcionario func : listaFuncionario) {
						
						%>
						
						
						<tbody>
							<tr>
								<td><%=func.getCpf() %></td>
								<td><%=func.getNome()%></td>
								<td><%=func.getFuncao()%></td>
								<td><%=func.getCtps()%></td>
								<td><%=func.getLogradouro()%></td>
								<td><%=func.getCep()%></td>
								<td align="center"><%=func.getNumero()%></td>
								<td align="center"><a href="alterar_funcionario.jsp?cod=<%=func.getCpf() %>&nome=<%=func.getNome()%>&funcao=<%=func.getFuncao()%>&ctps=<%=func.getCtps()%>&logradouro=<%=func.getLogradouro()%>&cep=<%=func.getCep()%>&numero=<%=func.getNumero()%>"><img alt="Alterar" src="imagens/edit_new.png"></a>
								<img alt="Excluir" onclick="javaScript:exclui('<%=func.getCpf()%>')" src="imagens/delete_new.png" style="cursor: pointer;"></td>
							</tr>
						</tbody>
						
						
						<script>
							function exclui() {
								if(window.confirm("Deseja excluir realmente ?")) {
									document.location.href="FuncionarioController?acao=exc&id=<%=func.getCpf()%>";	
								}
								else {
									document.location.href="visu_funcionarios.jsp";
									
								} 
								
							} 
						
						</script>
						
						<%} %>
					</table>
				</div>
			</div>
			<table>
						<tr>
							<td><a href="testeHomePizza.jsp"><input type="button" class="btn btn-primary" value="Voltar"></a></td>
						</tr>
					</table>
</div>
</div>
</div>
</div>
</body>
</html>

