<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />
<link href="estilos.css" rel="stylesheet" type="text/css" />
<link href="css/loginfuncionario.css" rel="stylesheet" type="text/css" />
<!-- CSS para as páginas exemplo -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<script language="JavaScript" type="text/javascript" src="js/mascara.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/bootstrap.js"></script>
<meta name="description" content="">
<meta name="author" content="">
<link href="css/bootstrap.css" rel="stylesheet">

<link href="css/shop-homepage.css" rel="stylesheet">
<title>*****Mr Pizza - Pizzas e Produtos...</title>
</head>
<body>
	<div class="container" style="margin-left: 450px">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-5 well well-md">
				<label><h3>Cadastro Funcionários</h3></label>
				<form action="AutenticaFuncionarioController" method="post" class="form"
					role="form" name="form1">
					
					Nome:
					<input class="form-control" name="nome" placeholder="Nome"
						type="text" required  maxlength="50" autofocus/>
					
					<br/>
					<div class="row">
						<div class="col-xs-6 col-md-6">
						Cpf:
							<input class="form-control" name="cpf"  placeholder="Cpf"
								type="text" onBlur="ValidarCPF(fom1.cpf);" onKeyPress="MascaraCPF(form1.cpf);" maxlength="14" required />
						</div>
						
					</div>
						<br/>
						<div class="row">
						<div class="col-xs-6 col-md-6">
							Nível:
							<input class="form-control" name="nivel" type="number" required value="1"/>
						</div>
					</div>
					<br/>
						
					<div style="margin-left: 350px; margin-top: 1px;">	
						<button class="btn btn-primary" type="submit">Entrar</button>
					</div>
					
					<br/>
					
					<div style="margin-left: 350px; margin-top: 1px; ">							
						<button class="btn btn-danger" type="reset">Limpar</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>