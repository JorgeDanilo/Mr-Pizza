<%@page import="br.com.mrpizza.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@page import="br.com.mrpizza.controller.dao.ProdutoDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<title>Mr Pizza - Pizzas e Produtos</title>
</head>

<body>

<jsp:useBean id="produtos" class="br.com.mrpizza.modelo.Produto" scope="session"/>
<jsp:setProperty name="produtos" property="*"/>

<form action="comprar.jsp" method="post">

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home.jsp">Mr Pizza</a>
		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#about">Cardápios</a></li>
				<li><a href="promocoes.jsp">Promoções</a></li>
				<li><a href="contato.jsp">Contatos</a></li>
				<li><a href="#">Vis.Pedidos</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="sair"><a href="ServletFecharSessao" rel="modal">Sair</a></li>
			</ul>
		</div>
	</div>
</nav>

<style>
	.message {
		
		font-style: inherit;
		font-family: monospace;
		font-weight: 100;
		background-color: #FFF5EE;
		border-style: dashed;
		width: 350px;
		height: 40px;
	}

</style>

	<div class="message" align="center">
		<h4>BEM VINDO <b><%=session.getAttribute("USER") %></b></h4>
	</div>	
	<br/>
	<div class="row">
		<div class="col-md-2 column margintop20">
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="#"><span
						class="glyphicon glyphicon-chevron-right"></span>Home</a></li>
				<li><a href="promocoes.jsp"><span
						class="glyphicon glyphicon-chevron-right"></span>Promoções</a></li>
				<li><a href="visualizaPedidos.jsp" class="active2"><span
						class="glyphicon glyphicon-chevron-right"></span>Vis.Pedidos</a></li>
				<li><a href="contato.jsp"><span
						class="glyphicon glyphicon-chevron-right"></span>Contato</a></li>
				<li><a href="#"><span
						class="glyphicon glyphicon-chevron-right"></span>Produtos</a></li>
			</ul>
		</div>

		<div class="col-md-8">
			<div class="row carousel-holder">
				<div class="col-md-12">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img class="slide-image" src="imagens/images.jpg"
									alt="Pizzas Deliciosas">
								<div class="carousel-caption">
									<h3>Pizza Calabreza</h3>
									<p>A pizza mais saborosa da regiao!</p>
								</div>

							</div>
							<div class="item">
								<img class="slide-image" src="imagens/segundaPizza.jpg" alt="">
								<div class="carousel-caption">
									<h3>Pizza Catupiry</h3>
									<p>Desfrute da Pizza com o sabor de Quero Mais!</p>
								</div>
							</div>
							<div class="item">
								<img class="slide-image" src="imagens/produtos.jpg" alt="">
								<div class="carousel-caption">
									<h3>Salgadinhos Deliciosos</h3>
									<p>Salgadinhos deliciosos a pronta entrega em domicilio!</p>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>
			</div>
			
			<p><h1>Produtos mais vendidos</h1></p>
			
			<%
				ProdutoDao daoProduto = new ProdutoDao();
				List<Produto> list = daoProduto.listarProdutos();
				
				for(Produto produto : list) {
			%>
			
			
			<div class="row">
				<div class="col-sm-4 col-lg-4 col-md-4">
					<div class="thumbnail">
						<img class="img-thumbnail" src="imagens/pizza1.jpg" alt="">
						<div class="caption">
							<h4 name="preco" class="pull-right">R$<%=produto.getPreco_venda() %></h4>
							<h4>			
								<a name="descricao" href="comprar.jsp"><%=produto.getDescricao() %></a>
							</h4>
							<p>A melhor pizza da regiao.</p>
							<!--<a href="comprarcontroller.do?acao=comprar&id=<%=produto.getDescricao()%>"><input type="button" class="btn btn-primary" value="Comprar"/></a>-->
							<strong>Comprar</strong><input name="produto" type="checkbox" value="<%=produto.getDescricao()%>"/>
							
						</div>
						<div class="ratings"></div>
					</div>
				</div>

				
			<%} %>
			
			
			</div>
		</div>
	</div>
	<input class="btn btn-primary" type="submit" value="Comprar"/>
	<div class="container">
		<hr>
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Mr Pizza, Pizzas e produtos. 2014</p>
			</div>
		</div>
		</footer>
		</form>
	</div>
</body>
</html>

