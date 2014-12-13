<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="estilos.css" rel="stylesheet" type="text/css" />
<!-- CSS para as páginas exemplo -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/bootstrap.js"></script>
<script language="JavaScript" type="text/javascript" src="js/mascara.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<link href="css/shop-homepage.css" rel="stylesheet">
<title>Mr Pizza - Pizzas e Produtos</title>
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

<!-- JavaScript para Manipulacao de divs escondidas XD -->
<script type="text/javascript">

$(document).ready(function() {
	
	$("#cartao").click(function(evento) {
		
		if($("#cartao").attr("checked")) {
			
			$("#pagamentos").css("display","block");
			
		} else {
			
			$("#pagamentos").css("display","none");
			
		}
	});
	
	});

</script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#dinheiro").click(function(evento) {
		
		if($("#dinheiro").attr("checked")) {
			
			$("#pagamentodinheiro").css("display","block");
			
		} else {
			
			$("#pagamentodinheiro").css("display","none");
			
		}
	});
	
	});

</script>

<!--  -->

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

<div>
	<img alt="" src="imagens/cartoes.jpg" style="width: 650px; margin-left: 320px;"><br/>
</div>
<div style="margin-left: 95px;">
	<input type="checkbox" name="cartao" id="cartao" value="1"><b>Cartão Crédito</b>
</div>

<div style="margin-left: 95px;">
	<input type="checkbox" name="dinheiro" id="dinheiro" value="1"><b>Dinheiro</b>
</div>




<div class="container" id="pagamentos"  style="display: none;">
  <form class="form-horizontal" role="form" action="##" method="post">
    <fieldset>
      <div align="center"><legend>Pagamento</legend></div>
      <div class="form-group">
      <input type="hidden" name="idcliente" id="idcliente" value="<%=session.getAttribute("ID") %>"/>
        <label class="col-sm-3 control-label" for="card-holder-name">Nome no cartão</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Nome do titular do Cartão">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">Número do cartão</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Número de Débito / Cartão de Crédito">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="expiry-month">Data de Validade</label>
        <div class="col-sm-9">
          <div class="row">
            <div class="col-xs-3">
              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
                <option>Mês</option>
                <option valustyle="display: none;"e="01">Jan (01)</option>
                <option value="02">Fev (02)</option>
                <option value="03">Mar (03)</option>
                <option value="04">Abril  (04)</option>
                <option value="05">Maio (05)</option>
                <option value="06">Jun (06)</option>
                <option value="07">Julh (07)</option>
                <option value="08">Aug (08)</option>
                <option value="09">Sep (09)</option>
                <option value="10">Out (10)</option>
                <option value="11">Nov (11)</option>
                <option value="12">Dez (12)</option>
              </select>
            </div>
            <div class="col-xs-3">
              <select class="form-control" name="expiry-year">
                <option value="13">2013</option>
                <option value="14">2014</option>
                <option value="15">2015</option>
                <option value="16">2016</option>
                <option value="17">2017</option>
                <option value="18">2018</option>
                <option value="19">2019</option>
                <option value="20">2020</option>
                <option value="21">2021</option>
                <option value="22">2022</option>
                <option value="23">2023</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="cvv">CVV Cartão</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Código de segurança">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
          <button type="submit" class="btn btn-success">Pagar Agora</button>
        </div>
      </div>
    </fieldset>
  </form>
</div>


<!-- Modal para inserção do dinheiro  -->
<br/>
<form action="Pagamento_a_vista" method="post" name="form1">
<div class="container" id="pagamentodinheiro" style="display: none;">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-5 well well-md">
				<h2>Dinheiro</h2>
				<br/>
				<input type="hidden" name="idcliente" id="idcliente" value="<%=session.getAttribute("ID") %>"/>
				Valor Para Troco:<input type="text" class="form-control" name="valor" id="valor" style="width: 120px;" maxlength="5" onKeyPress="mascaraInteiro(form1.numero);">
				<button type="submit" class="btn btn-success" style="margin-left: 150px; margin-top: -33px;">Pagar Agora</button>			
			</div>
		</div>
</div>
</form>
<a href="testeHomePizza.jsp"><button class="btn btn-primary">Continue Comprando</button></a>
</body>
</html>