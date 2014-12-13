<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="WEB-INF/jspf/acesso.jspf"%>
 <%@include file="WEB-INF/jspf/cabec.jspf" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="http://code.angularjs.org/1.0.1/angular-1.0.1.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<script language="JavaScript" type="text/javascript" src="js/mascara.js"></script>
<link rel="stylesheet" type="text/css" href="css/style_teste.css" />
<title>*****Mr Pizza - Pizzas e Produtos...</title>
</head>
<body>
	<sql:query var="rs" dataSource="${con}">
		select max(idcliente) from cliente
	</sql:query>
	<c:set var="maior" value="${rs.rowsByIndex[0][0] + 1 }"></c:set>
	
	
	
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
			<!-- <li class="entre_contato"><a href="entreContato.html">Entre
					em contato</a></li> -->
		</ul>
	</div>
	</nav>

<div class="col-md-3 column margintop20">
    		<ul class="nav nav-pills nav-stacked">
  <li class="active"><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Home</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Informações</a></li>

</ul>
</div>

	<div class="container" align="center">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-5 well well-md">
				<label><h3>Cadastro Clientes</h3></label>
				<form action="sisICLiente.jsp" method="post" class="form"
					role="form" name="form1">
					
					
					<input class="form-control" name="codTitulo"
						type="text" value="<c:out value="${maior}"></c:out>" readonly="readonly"/>
					
					<br/>
					<input class="form-control" name="nome" placeholder="Nome"
						type="text" required autofocus/>
					
					<br/>
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<input class="form-control" name="login" maxlength="11" placeholder="Login"
								type="text" required />
						</div>
						
						<div class="col-xs-6 col-md-6">
							<input class="form-control" name="senha" placeholder="Senha"
								type="password" required />
						</div>
					</div>
					
					<br/>
					<input class="form-control" name="logradouro"
						placeholder="Logradouro" type="text" required />
						
					<br/>
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<input	class="form-control" name="cep" placeholder="Cep" type="cep" onKeyPress="MascaraCep(form1.cep);" maxlength="10" onBlur="ValidaCep(form1.cep)" required />
						</div>
						
						<div class="col-xs-6 col-md-6">
							 <input class="form-control" name="numero"
						placeholder="Número" type="text" onKeyPress="mascaraInteiro(form1.numero);" maxlength="5" required />							
						</div>
					</div>
					
					
					
					<div style="margin-left: 355px; margin-top: 13px;">
						<button class="btn btn-primary" type="submit">Cadastrar</button>
					</div>	
				</form>
			</div>
		</div>
	</div>



	</form>
		
		
</body>
</html>