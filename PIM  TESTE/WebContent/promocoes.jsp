<%@page import="java.util.List"%>
<%@page import="br.com.mrpizza.controller.dao.PromocaoDao"%>
<%@page import="br.com.mrpizza.modelo.Promocoes"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<!-- CSS para as páginas exemplo -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<meta name="description" content="">
<meta name="author" content="">

<title>Mr Pizza - Promoções Incríveis</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Add custom CSS here -->
<link href="css/shop-homepage.css" rel="stylesheet">
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
				<li><a href="#contact">Contatos</a></li>
				<li><a href="#">Vis.Pedidos</a></li>

			</ul>
		</div>
	</div>
	</nav>

	<style>
		.botaoCarrinho {
		position: relative;
		left: 1008px;
		}
	</style>

	<div class="jumbotron">
		<h2>Promoções Incríveis</h2>
		<p>Os mais variados Produtos para vocês ! Não percam.</p>
		<br>
	</div>

				<%
						PromocaoDao daoPromocao = new PromocaoDao();
					
						List<Promocoes> list = daoPromocao.listarPromocoes();
					
						for(Promocoes promocoes : list) {
				%>

				<div class="container">				
					<div class="row">
						<div class="col-sm-2 col-lg-4 col-md-2">
							<div class="thumbnail">
								<img class="img-thumbnail" src="imagens/pizza1.jpg" alt="">
								<input type="hidden" value="<%=promocoes.getCod_promocao()%>">
								<div class="caption">
									<h4 class="pull-left"><%=promocoes.getPreco_venda() %></h4>
									<h4>
									<br/>
										<h4><a href="#"><%=promocoes.getDescricao()%></a></h4>
									</h4>
									
								</class="botaoCarrinho">
								<a href="testeComprarPromocoes.jsp?&descricao=<%=promocoes.getDescricao()%>&preco=<%=promocoes.getPreco_venda()%>&id=<%=promocoes.getCod_promocao()%>"><input type="button" class="btn btn-primary" value="Comprar"/></a>
								</div>
							
							</div>
						</div>
			<% } %>
	</div>
	</div>
</body>
</html>
