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
			<a class="navbar-brand" href="home.jsp">Mr Pizza</a>
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
	
	
<div class="panel panel-default" style="width: 1050px; height:650px; margin: 150px;">
<div class="panel-body">
<div class="panel panel-default">
<div class="panel-body">
	<h3 align="left"><b>Alteração Funcionário</b></h3>
</div>
</div>
<div class="container">
<div class="row">
    
<div class="col-sm-8 contact-form">
<form id="contact" action="FuncionarioAlterar" method="post" class="form" role="form">
<div class="row">

<div class="col-xs-6 col-md-6 form-group">
<b>Código:</b><input class="form-control" id="codigo" name="codigo" type="text" value="<%=request.getParameter("cod")%>" readonly="readonly"/>
</div>


<div class="col-xs-6 col-md-6 form-group">

</div>

</div>
<b>Nome</b><input class="form-control" id="nome" name="nome" type="text" value="<%=request.getParameter("nome")%>"/>



<br/>

<div class="row">

<div class="col-xs-6 col-md-6 form-group">
<b>Função:</b><input class="form-control" id="funcao" name="funcao" type="text" value="<%=request.getParameter("funcao")%>"/>
</div>


<div class="col-xs-6 col-md-6 form-group">
<b>CTPS:</b><input class="form-control" id="ctps" name="ctps" type="text" value="<%=request.getParameter("ctps")%>"/>
</div>

</div>
<br/>
</div>

<br/>
<div class="col-xs-6 col-md-6 form-group">
<b>Logradouro:</b><input class="form-control" id="logradouro" name="logradouro" type="text" value="<%=request.getParameter("logradouro")%>"/>
</div>

<div class="col-xs-2 col-md-2 form-group">
<b>CEP:</b><input class="form-control" id="cep" name="cep" type="text" value="<%=request.getParameter("cep")%>"/>
</div>

<br/>
<div class="col-xs-2 col-md-2 form-group">
<b>Número:</b><input class="form-control" id="numero" name="numero" type="text" value="<%=request.getParameter("numero")%>"/>
</div>

<br/>
</div>
</div>
<br/>
<div class="row">
<div class="col-xs-12 col-md-12 form-group">
<div style="left: 50px;">
	<button class="btn btn-primary pull-right" type="submit"> Alterar</button>
</div>
<input type="hidden" name="ac" value="atualizar"></input>
<div>
	<button class="btn btn-danger pull-right" type="reset">Limpar</button>
</div>
</form>
</div>
</div>
</div>
</div>
</body>
</html>
