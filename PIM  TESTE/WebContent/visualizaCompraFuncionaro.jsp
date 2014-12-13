<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.mrpizza.modelo.Pedido"%>
<%@page import="br.com.mrpizza.modelo.Produto"%>
<%@page import="br.com.mrpizza.controller.dao.ProdutoDao"%>
<%@page import="br.com.mrpizza.modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="br.com.mrpizza.controller.dao.Clientedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/sabores.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
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
				<li class="entre_contato"><a href="menu.jsp">Menu</a></li>
				<li><a href="#">Vis.Pedidos</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="sair"><a href="#janela1" rel="modal">Sair</a></li>
			</ul>
		</div>
	</div>
	</nav>
			
<!--verificacao de pedidos. -->
        <form role="form" action="#" method="post">
           <div class="container" style="margin-left: 365px; margin-top: 100px;">
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-primary">
							<div class="panel-body">
							</div>
							<table class="table table-hover" id="dev-table">
								<thead>
									<tr style="font-style: inherit;">
										<th>Produto</th>
										<th>Cliente</th>
										<th>Quantidade</th>
										<th>Preço Venda</th>
										<th>Alterar/Excluir</th>
									</tr>
								</thead>
								
								
								<tbody>
									<tr>
										<td><%=request.getParameter("produto")%></td>
										<td><%=request.getParameter("cliente")%></td>
										<td><%=request.getParameter("quantidade")%></td>
										<td><%=request.getParameter("valor")%></td>
										<%-- <td><%=nomeCliente%></td> --%>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>   
     <!--  <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Voltar</button>
        <button type="submit" class="btn btn-primary">Finalizar</button>
      </div> -->
      </form>
</body>
</html>
