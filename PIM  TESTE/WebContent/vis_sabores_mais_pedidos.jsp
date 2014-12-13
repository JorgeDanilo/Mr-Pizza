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
				<li><a href="contato.jsp">Contatos</a></li>
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
						<h3 class="panel-title">Produtos Mais Vendidos</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
						<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filtrar Pizza" />
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>Nome Produto</th>
								<th>Descrição</th>
								<th>Valor Atual (R$) Tamanho : Médio</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Pizza Calabreza</td>
								<td>Pizza de calabreza com queijo</td>
								<td>19.90</td>
							</tr>
							<tr>
								<td>Pizza Quatro Queijos</td>
								<td>Pizza Quatro Queijos</td>
								<td>25.00</td>
							</tr>
							<tr>
								<td>Pizza Chocolate</td>
								<td>Pizza Chocolate com Queijo</td>
								<td>10.90</td>
							</tr>
							<tr>
								<td>Pizza Banana</td>
								<td>Pizza Banana com Caramelo</td>
								<td>14.99</td>
							</tr>
							<tr>
								<td>Pizza Atum</td>
								<td>Pizza Atum</td>
								<td>19.90</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
</div>
</div>
</div>
</div>
</body>
</html>
