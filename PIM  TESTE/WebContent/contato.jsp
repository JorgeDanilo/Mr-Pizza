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

<!--adicionando uma imagem de pizza em background-->
<style type="text/css">
	body {
		background-image: url("imagens/pizzawallpapper1.jpg");
		background-repeat: repeat-x;
	}
</style>

<style>
#formulario {
	padding-top: 10px;
	left: 120px;
	
}
</style>
<body>
<nav class="navbar navbar-inverse" id="menu_top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Mr Pizza</a>
		</div>

		<ul class="nav navbar-nav">
			<li class="menu_home"><a href="#">Home</a></li>
			<li class="menu_ajuda"><a href="#">Ajuda</a></li>
			<li class="entre_contato"><a href="entreContato.html">Entre
					em contato</a></li>
		</ul>
	</div>
	</nav>
	<div id="formulario" class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal" action="sugestaocontroller.do" method="post">
						<fieldset>
							<legend class="text-center">Contato</legend>
										
							<div class="form-group">
								<div class="col-md-9">
									<input id=codigo_cliente name="codigo_cliente" type="hidden"
										placeholder="Seu Codigo" class="form-control" required autofocus value="<%=session.getAttribute("ID") %>">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="email">Seu
									E-mail</label>
								<div class="col-md-9">
									<input id="email" name="email" type="email"
										placeholder="Seu email" class="form-control" required autofocus>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="descricao">Descrição</label>
								<div class="col-md-9">
									<textarea class="form-control" id="descricao" name="descricao"
										placeholder="Por favor, preencher sua dúvida aqui.." rows="5" required autofocus></textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12 text-right">
									<button type="submit" class="btn btn-primary btn-lg">Enviar</button>
								</div>
							</div>
							
							
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>