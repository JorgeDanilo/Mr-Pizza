<%@page import="java.sql.ResultSet"%>
<%@page import="br.com.mrpizza.modelo.Pedido"%>
<%@page import="br.com.mrpizza.controller.dao.PedidoDao"%>
<%@page import="br.com.mrpizza.modelo.Promocoes"%>
<%@page import="java.util.List"%>
<%@page import="br.com.mrpizza.controller.dao.PromocaoDao"%>
<%@include file="WEB-INF/jspf/acesso.jspf" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
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
				<li class="entre_contato"><a href="menu.jsp">Menu</a></li>
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
						<h3 class="panel-title">Pedidos Realizados</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
						<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filtrar Pedidos..." />
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>Código Pedido</th>
								<th>Data Pedido</th>
								<th>Valor Pedido</th>
								<th>Nome Cliente</th>
								<th>Logradoruo</th>
								<th>CEP</th>
								<th>Número</th>
								<th>Descrição</th>
								<th>Preco</th>
								<th>Quantidade</th>
							</tr>
						</thead>
						
						<%
						Pedido modeloPedido = new Pedido();
						
						Class.forName("com.mysql.jdbc.Driver");
					      Connection con = DriverManager.getConnection
					      ("jdbc:mysql://localhost/mydb","root",
					      "1234");
					      Statement stmt = con.createStatement();
					      String query ="SELECT * FROM pedido inner join cliente on cliente_idcliente = idcliente inner join produto_tem_pedido on  idpedido = pedido_idpedido inner join produto on idproduto =  produto_idproduto;";
					      ResultSet rs = stmt.executeQuery(query);
					      System.out.println("");
					      while (rs.next()) {
					    	 int id_pedido = rs.getInt("idpedido");
					         modeloPedido.setDt_pedido(rs.getDate("dt_pedido"));
					         String valor_pedido = rs.getString("valorPedido");
					         int idCliente = rs.getInt("cliente_idcliente");
					         String nomeCliente = rs.getString("nome");
					         String logradouro = rs.getString("logradouro");
					         String cep = rs.getString("cep");
					         String numero = rs.getString("numero");
					         String descricao = rs.getString("descricao");
					         double preco_venda = rs.getDouble("preco_venda");
					         int quantidade = rs.getInt("quantidade");
					         
					     %>
					     
					   
					     
					     <tbody>
							<tr>
								<td><%=id_pedido%></td>
								<td><b><%=modeloPedido.getDataFormatada() %></b></td>
								<td bgcolor="FFD700"><b><%=valor_pedido%></b></td>
								<td><%=nomeCliente%></td>
								<td><%=logradouro%></td>
								<td><%=cep%></td>
								<td><%=numero%></td>
								<td><%=descricao%></td>
								<td><%=preco_venda%></td>
								<td><%=quantidade%></td>
								</tr>
								</tbody>
								<%
					      }
						
						%>
						
						
						<%-- <tbody>
							<tr>
								<td><%=fname%></td>
								<td><%=lname%></td>
								<td><%=idCliente%></td>
								<td><%=nomeCliente%></td>
								<td><a href="alterar_promocao.jsp?cod=<%=promocoes.getCod_promocao()%>&descricao=<%=promocoes.getDescricao()%>&preco=<%=promocoes.getPreco_venda()%>"><img alt="Alterar" src="imagens/edit_new.png"></a>
								<img alt="Excluir" onclick="javaScript:exclui('<%=promocoes.getCod_promocao()%>')" src="imagens/delete_new.png" style="cursor: pointer;"></td>
							</tr>
						</tbody> --%>
						
						
						<%-- <script>
							function exclui() {
								if(window.confirm("Deseja excluir realmente ?")) {
									document.location.href="PromocaoController?acao=exc&id=<%=promocoes.getCod_promocao()%>";	
								}
								else {
									document.location.href="visu_promocao.jsp";
									
								} 
								
							} 
						
						</script> --%>
						
					</table>
				</div>
			</div>
</div>
</div>
</div>
</div>
</body>
</html>

