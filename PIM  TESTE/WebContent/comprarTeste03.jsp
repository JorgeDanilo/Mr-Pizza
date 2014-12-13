<%@page import="br.com.mrpizza.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@page import="br.com.mrpizza.controller.dao.ProdutoDao"%>
<%@page import="br.com.mrpizza.controller.ComprarController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>*****Mr Pizza - Pizzas e Produtos...</title>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/styleCompras.css"/>
<script src="js/simpleCart.js"></script>
<script src="js/jquery-min.js"></script>
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
				<li><a href="promocoes.jsp">Promoções</a></li>
				<li><a href="contato.jsp">Contatos</a></li>
				<li><a href="#">Vis.Pedidos</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="sair"><a href="ServletFecharSessao" rel="modal">Sair</a></li>
			</ul>
		</div>
	</div>
</nav>

<br/>
<br/>

<form id="form1">

<br/><br/>
<div class="container">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">Produto</th>
							<th style="width:10%">Preço Unitário</th>
							<th style="width:8%">Quantidade</th>
							<th style="width:22%" class="text-center">Comprar ?</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					
					<%
			
					
						ProdutoDao daoProduto = new ProdutoDao();
						List<Produto> listaProduto =  daoProduto.listarProdutos();
						
						for(Produto listaproduto : listaProduto) {

					%>
					
					<tbody id="tab">
						<tr id="tab">
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
									<div class="col-sm-15" >
									<div>
										<h4 id="tab"><%=listaproduto.getDescricao()%></h4>
									</div>	
										<p></p>
									</div>
								</div>
							</td>
							
							<td data-th="Price">R$ <%=listaproduto.getPreco_venda()%></td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td data-th="Subtotal" class="text-center">Comprar<input type="checkbox" value="<%=listaproduto.getPreco_venda()%>"/></td>
							<!--<td onclick="mudar_cor(this);mostraDiv('opcoes');"><input type="checkbox" onclick="mudar_cor_chk(this,0);mostraDiv('opcoes');" /></td>-->
							
						</tr>
					</tbody>
					
						<script>
						
   						 	function sumChecked() {
							    var result = $("input:checked");
							    var total = 0;

							    for (var i=0;i<result.length;i++) {
							    	total = total+parseFloat(result[i].value);
							    }
							    
							    $("#result").val(total.toFixed(2));		
							    }
							    
   						 	sumChecked();
							    $(":checkbox").click(sumChecked);
						</script>
					
					
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total 1.99</strong></td>
						</tr>
						<tr>
							
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong><%%></strong></td>
							
						</tr>
					</tfoot>
				
				
				<% } %>
				</table>
				
				
				<script>
    
  					$('input').on('click', function() {
    				$('input[type="checkbox"]').parent().css('background', 'white');
    				$('input[type="checkbox"]:checked').parent().css('background', '#FFE4B5');
  					
  					});
  
				</script>
				
				
				
				
				<script type="text/javascript">
					
				function voltarParaHome() {
					var r = confirm("Deseja realmente Voltar ?");
					
					if (r == true) {
						location.href="http://localhost:8080/PIM__TESTE/home.jsp";
					} else {
						
						}
					}
					 
				
				function mostraLogin() {
						window.alert("voce clicou em finalizar");
					}
				
				</script>
				
				<input id='result' type="text" value='0'/>
				<!-- Quando eu selecionar o botao continue comprando ou o botao finalizar, o sistema deverá popular esses dados. -->
				<a href="#" name="finalizar" class="btn btn-success btn-block" onclick="mostraLogin()">Finalizar Compra<i class="fa fa-angle-right"></i></a>
				
				
</div>
</form>
</body>
</html>