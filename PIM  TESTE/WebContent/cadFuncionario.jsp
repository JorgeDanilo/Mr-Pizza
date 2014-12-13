<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="http://code.angularjs.org/1.0.1/angular-1.0.1.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<script language="JavaScript" type="text/javascript" src="js/mascara.js"></script>
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
<title>*****Mr Pizza - Pizzas e Produtos...</title>

<!--adicionando uma imagem de pizza em background-->
<style type="text/css">
	body {
		background-image: url("imagens/pizzawallpapper1.jpg");
		background-repeat: repeat-x;
	}
</style>

</head>


<body>
	<nav class="navbar navbar-inverse" id="menu_top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Mr Pizza</a>
		</div>

		<ul class="nav navbar-nav">
			<li class="menu_home"><a href="#">Home</a></li>
			<li class="menu_ajuda"><a href="#">Ajuda</a></li>
			<li class="entre_contato"><a href="menu.jsp">Menu</a></li>
		</ul>
	</div>
	</nav>
	
	
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
	
				
<div class="col-md-3 column margintop20">
    		<ul class="nav nav-pills nav-stacked">
  <li class="active"><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Home</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Informações</a></li>

</ul>
</div>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-5 well well-md">
				<label><h3>Cadastro Funcionários</h3></label>
				<form action="FuncionarioController" method="post" class="form"
					role="form" name="form1">
					
					<input class="form-control" name="nome" placeholder="Nome"
						type="text" required  maxlength="50" autofocus/>
					
					<br/>
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<input class="form-control" name="cpf"  placeholder="Cpf"
								type="text" onBlur="ValidarCPF(form1.cpf);" onKeyPress="MascaraCPF(form1.cpf);" maxlength="14" required/>
						</div>
						
						<div class="col-xs-6 col-md-6">
							<input class="form-control" name="ctps" placeholder="Ctps"
								type="password" required maxlength="25" />
						</div>
					</div>
					
					<br/>
					<input class="form-control" name="funcao"
						placeholder="Funcao" type="text" required maxlength="25"/>
					
					<br/>
					<input class="form-control" name="logradouro"
						placeholder="Logradouro" type="text" required maxlength="50"/>
						
						
					<br/>	
					<input	class="form-control" name="cep" placeholder="Cep" type="cep" onKeyPress="MascaraCep(form1.cep);" maxlength="10" onBlur="ValidaCep(form1.cep)"
						required maxlength="25"/>
						
						<br/>
						 <input class="form-control" name="numero"
						placeholder="Numero" type="text" onKeyPress="mascaraInteiro(form1.numero);" required maxlength="4"/>

						
						<br/>
						<div class="row">
							<div class="col-xs-6 col-md-6">
							Nivel:
							 <input class="form-control" name="nivel"
							type="number" name="nivel" id="nivel"/>
						</div>
						</div>
						
					<br/>
					<button class="btn btn-primary btn-block" type="submit">
						Cadastrar</button>
						
						<br/>
					<button class="btn btn-danger btn-block" type="reset">
						Limpar</button>
				</form>
			</div>
		</div>
	</div>
	</form>
</body>
</html>