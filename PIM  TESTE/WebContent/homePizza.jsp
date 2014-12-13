<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>

<title>*****Mr Pizza - Pizzas e Produtos...</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<script language="JavaScript" type="text/javascript" src="js/mascara.js"></script>
<link rel="stylesheet" type="text/css" href="css/style_teste.css">

<!--adicionando uma imagem de pizza em background-->
<style type="text/css">
	body {
		background-image: url("imagens/pizzawallpapper1.jpg");
		background-repeat: repeat-x;
	}
</style>

</head>
<body>

	<form action="usuariocontroller.do" name="form1" method=post>
	
		<nav class="navbar navbar-inverse" id="menu_top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Mr Pizza</a>
				</div>

				<ul class="nav navbar-nav">
					<li class="menu_home"><a href="#">Home</a></li>
					<li class="menu_ajuda"><a href="#">Ajuda</a></li>					
					<li class="entre_contato"><a href="#">Entre
							em contato</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li class="sair"><a href="#janela1" rel="modal">Entrar</a></li>
				</ul>
			</div>
		</nav>

		<div class="div_formulario">
			<div class="container">
				<div class="row">
					<div class="col-sm-3" id="formulario">
						<center>
							<p class="mensagem_login">
								<%
									String mensagem = (String) request.getAttribute("mensagem");
									if (mensagem != null) {
										out.println(mensagem);
									} else {
										out.println("Nome/Senha Invalidos. ");
									}
								%>
						</center>
						</p>

						<div class="panel panel-info">
							<div class="panel-heading">
								<center>
									<p>Mr Pizza - Login Acesso</p>
								</center>
							</div>
							
							<div class="formulario">
								<fieldset>
									<legend> </legend>
									
									<!-- Teste com codigo de controle -->
									<div class="form-group">
										<label for="nome">Codigo</label> <input type="text"
											class="form-control" autofocus="" name="codigo" maxlength="11" onKeyPress="mascaraInteiro(form1.numero);">
									</div>
									<!-- finalizacao do teste de controle ^ -->
																		
									<div class="form-group">
										<label for="nome">Nome</label> <input type="text"
											class="form-control" autofocus="nome" id="nome" name="txtnome">
									</div>

									<div class="form-group">
										<label for="password">Senha</label> <input type="password"
											class="form-control" id="Senha" name="txtsenha">
									</div>
								</fieldset>


								<fieldset>
									<div class="form-group">
										<button type="submit" class="btn btn-primary">Entrar</button>
										<a href="testeCadastro.jsp"><button type="button" class="btn btn-warning">Auto-Registrar</button></a>
									</div>

								</fieldset>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</form>
</body>
</html>