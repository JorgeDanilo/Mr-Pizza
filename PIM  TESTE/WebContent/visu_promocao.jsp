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
<br/>
<br/>
<br/>
<div class="container" style="margin-left: 190px;">
<div class="row">
<div class="col-xs-19 col-md-19 form-group">
    	<div class="row">
			<div class="col-md-10">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Promoções da Pizzaria.</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
						<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filtrar Promoção..." />
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>Código</th>
								<th>Descrição</th>
								<th>Valor Atual (R$)</th>
								<th>Alterar/Excluir</th>
							</tr>
						</thead>
						
						<!--aqui vai os scriplets ....  -->
						<%
						
						PromocaoDao daoPromocao = new PromocaoDao();
					
						List<Promocoes> list = daoPromocao.listarPromocoes();
					
						for(Promocoes promocoes : list) {
						
						%>
						
						
						<tbody>
							<tr>
								<td><%=promocoes.getCod_promocao() %></td>
								<td><%=promocoes.getDescricao() %></td>
								<td><%=promocoes.getPreco_venda() %></td>
								<td><a href="alterar_promocao.jsp?cod=<%=promocoes.getCod_promocao()%>&descricao=<%=promocoes.getDescricao()%>&preco=<%=promocoes.getPreco_venda()%>"><img alt="Alterar" src="imagens/edit_new.png"></a>
								<img alt="Excluir" onclick="javaScript:exclui('<%=promocoes.getCod_promocao()%>')" src="imagens/delete_new.png" style="cursor: pointer;"></td>
							</tr>
						</tbody>
						
						
						<script>
							function exclui() {
								if(window.confirm("Deseja excluir realmente ?")) {
									document.location.href="PromocaoController?acao=exc&id=<%=promocoes.getCod_promocao()%>";	
								}
								else {
									document.location.href="visu_promocao.jsp";
									
								} 
								
							} 
						
						</script>
						
						<%} %>
					</table>
				</div>
			</div>
</div>
</div>
</div>
</div>
</body>
</html>

