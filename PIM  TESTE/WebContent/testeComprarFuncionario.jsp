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
<script src="js/mascara.jsp"></script>
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
	
	<form action="visualizaCompraFuncionaro.jsp" method="post">
	<div class="panel panel-default"
		style="margin-left: 350px; width: 600px; height: 800px; margin-top: 150px">
		<div class="panel-heading" align="center">
			<h2>
				<b>Compras</b>
			</h2>
		</div>
		<div class="panel-body">


			<div class="col-md-6">
				<b>Cliente</b> 
							<select id="selectbasic" class="form-control" name="cliente">
							
					
					<option value="1">Selecione...</option>
						<%
							Clientedao daoCliente = new Clientedao();
							List<Cliente> lista = daoCliente.listaCliente();
	
							for(Cliente cliente : lista) {

						%>
					
						    <%-- <option value="<%=cliente.getId_cliente() %>"><%=cliente.getNome()%></option> --%>
							<option value="<%=cliente.getId_cliente()%>"><%=cliente.getNome()%></option>
							
						<%} %>
				</select>
			</div>

			<div class="col-md-4" style="margin-top: 21px;">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"">Cadastrar</button>
			</div>

			<br /> <br /> <br /> <br /> <br />

			<div class="col-md-6">
				<b>Produto</b> <select id="selectbasic" name="produto"
					class="form-control">
					<option value="1">Selecione...</option>
					
					<%
						ProdutoDao daoProduto = new ProdutoDao();
						List<Produto> produto = daoProduto.listarProdutos();
						
						for(Produto produtos : produto) {
						
					%>
					
					<option value="<%=produtos.getCod_produto()%>" ><%=produtos.getDescricao()%></option>
					
					<%
						}
					%>
				</select>
			</div>

			<div class="col-md-4" style="margin-top: 21px;">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2"">Cadastrar</button>
			</div>

			<br /> <br /> <br /> <br /> <br />

			<div class="col-md-3">
				<b>Quantidade</b> <input name="quantidade" type="number"
					class="form-control text-center" value="1">
			</div>

			
			<br /> <br /> <br /> <br /> <br />
			<div class="col-md-3">
				<b>Valor:</b> <input name="valor" type="text"
					class="form-control text-center">
			</div>

			<div class="col-md-4" style="margin-top: 21px; margin-left: 143px;">
				<button type="submit" class="btn btn-primary">Verificar</button>
				<button id="cadastar" name="cadastar" class="btn btn-danger">Limpar</button>
			</div>
			
			<br /> <br /> <br /> <br />

			<div align="center">
				<h2>
					<b>Pedidos</b>
				</h2>
			</div>

			<br />

		</div>
		</div>
		</form>
	
			<script type="text/javascript">
			$('#exampleModalLabel').on('show.bs.modal', function (e) {
				  if (!data) return e.preventDefault()
				}) 
			
				
			$('#exampleModalLabel2').on('show.bs.modal', function (e) {
				  if (!data) return e.preventDefault()
				})
				
			$('#exampleModalLabel3').on('show.bs.modal', function (e) {
				  if (!data) return e.preventDefault()
				})	
			</script>
			
			
<!-- Modal de cadastro de clientes -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="exampleModalLabel"><b>Cadastro Cliente</b></h4>
      </div>
      <div class="modal-body">
        <form role="form" action="cadastrarusuario.do" method="post" name="form1" id="form1">
          <div class="form-group">
            <label for="nome" class="control-label">Nome</label>
            <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
          </div>
       
          
          <div class="row">
				<div class="col-xs-6 col-md-6">
					<label for="recipient-name" class="control-label">Login</label>
					<input class="form-control" name="login" maxlength="11" placeholder="Login" type="text" required autofocus />
				</div>
						
				<div class="col-xs-6 col-md-6">
					<label for="recipient-name" class="control-label">Senha</label>
					<input class="form-control" name="senha" placeholder="Senha" type="password" required />
				</div>
		 </div>
		 
		 <br/>
		 <div class="form-group">
            <label for="nome" class="control-label">Logradouro</label>
            <input type="text" class="form-control" id="logradouro" name="logradouro" placeholder="Lograduro">
          </div>
				
				
				
		<div class="row">
				<div class="col-xs-6 col-md-6">
					<label for="recipient-name" class="control-label">Cep</label>
					<input class="form-control" name="cep" maxlength="11" placeholder="Cep" type="text" required autofocus />
				</div>
						
				<div class="col-xs-6 col-md-6">
					<label for="recipient-name" class="control-label">Número</label>
					<input class="form-control" name="numero" placeholder="Número" type="text" required />
				</div>
		 </div>		
		 
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Voltar</button>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!--Modal para cadastro de produtos-->

<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal2"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="exampleModalLabel2"><b>Cadastro Produtos</b></h4>
      </div>
      <div class="modal-body">
        <form role="form" action="CadProdutosFuncionario" method="post">
              
          
          <div class="row">
				<div class="col-xs-6 col-md-6">
					<label for="recipient-name" class="control-label">Preço</label>
					<input class="form-control" name="preco" maxlength="11" placeholder="Preço do produto..." type="text" required autofocus />
				</div>
		 </div>
		
		<br/>
		<div class="form-group">
			<label for="recipient-name" class="control-label">Descrição</label>
			<textarea class="form-control" id="descricao" name="descricao" placeholder="Descricao" rows="5" required></textarea>
		</div>		 	
		 
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Voltar</button>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
      </div>
      </form>
    </div>
  </div>
</div>




<!-- modal para verificacao de pedidos. -->

<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel3" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal3"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="exampleModalLabel3"><b>Verificar Pedido</b></h4>
      </div>
      <div class="modal-body">
        <form role="form" action="#" method="post">
           <div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-primary">
							<div class="panel-body">
								<input type="text" class="form-control" id="dev-table-filter"
									data-action="filter" data-filters="#dev-table"
									placeholder="Pesquisar Vendas..." />
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
										<td><%%></td>
										<td><%%></td>
										<td><%%></td>
										<td><%%></td>
										<%-- <td><%=nomeCliente%></td> --%>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>   
      </div>
     <!--  <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Voltar</button>
        <button type="submit" class="btn btn-primary">Finalizar</button>
      </div> -->
      </form>
    </div>
  </div>
</div>
</body>
</html>
