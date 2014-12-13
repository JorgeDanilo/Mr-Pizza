<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<a class="navbar-brand" href="home.jsp">Mr Pizza</a>
		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#about">Cardápios</a></li>
				<li><a href="">Promoções</a></li>
				<li><a href="#contact">Contatos</a></li>
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
	
	
<div class="panel panel-default" style="width: 950px; height:450px; margin: 150px;">
<div class="panel-body">
<div class="panel panel-default">
<div class="panel-body">
	<h4 align="left"><b>Alterar Produto</b></h4>
</div>
</div>
<div class="container">
<div class="row">
    
<div class="col-sm-8 contact-form">
<form id="contact" action="ProdutoAlterar" method="post" class="form" role="form">
<div class="row">
<div class="col-xs-6 col-md-6 form-group">
<input type="hidden" name="codigo" id="codigo" value="<%=request.getParameter("cod")%>"/>

<input class="form-control" id="preco" name="preco" type="text" required autofocus value="<%=request.getParameter("preco")%>"/>
</div>

</div>
<textarea class="form-control" id="descricao" name="descricao"rows="5"><%=request.getParameter("descricao")%></textarea>
<br />
<div class="row">
<div class="col-xs-12 col-md-12 form-group">
<div style="left: 50px;">
	<button class="btn btn-primary pull-right" type="submit"> Alterar</button>
</div>
<div>
	<button class="btn btn-danger pull-right" type="reset">Limpar </button>
</div>
</form>
</div>
</div>
</div>
</div>
</body>
</html>
