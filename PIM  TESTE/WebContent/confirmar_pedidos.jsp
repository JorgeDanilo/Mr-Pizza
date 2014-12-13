<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/bootstrap.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap-modal.js"></script>
<link href="css/shop-homepage.css" rel="stylesheet">
<title>Mr Pizza - Pizzas e Produtos</title>
</head>
<body>
<form action="pagamento.jsp">
	<div class="container" style="margin-left: 390px; width: 650px; margin-top: 30px;">
		<div class="row">
			<div class="col-xs-19 col-md-19 form-group">
				<div class="row">
					<div class="col-md-10">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Visualiza Pedidos</h3>
								<div class="pull-right">
								</div>
							</div>
							<table class="table table-hover" id="dev-table">
								<thead>
									<tr>
										<th>Nome/Descrição</th>
										<th>Preço</th>
										<th>Quantidade</th>
										<th>Cliente</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><%=request.getParameter("desc")%></td>
										<input type="hidden" value"<%=request.getParameter("id")%>"/>
										<td><%=request.getParameter("preco") %></td>
										<td><%=request.getParameter("quantidade") %></td>
										<td><%=session.getAttribute("USER") %></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div>
		<input type="submit" value="Finalizar" class="btn btn-primary" style="margin-left: 780px;"/>
	</div>
	</form>
	<div style="margin-left: 710px; margin-top: -32px;">
		<a href="testeComprarPizza.jsp?&descricao=<%=request.getParameter("desc")%>&preco=<%=request.getParameter("preco")%>&id=<%=request.getParameter("id")%>"><button class="btn btn-danger">Voltar</button></a>
	</div>
</body>
</html>