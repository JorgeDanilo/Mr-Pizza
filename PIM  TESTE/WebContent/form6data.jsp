<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="produto" class="br.com.mrpizza.modelo.LivroProdutoBean" scope="session"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Produto Cadastrado</h3>
	<table border="0"><tr bgcolor="#EFCFEF">
		<td>Código</td><td>${produto.codigo}</td>
		<tr bgcolor="#EFEFCF"><td>Descricao</td>
		<td>${produto.descricao}</td></tr>
		<tr bgcolor="#EFCFEF"><td>Preco</td>
		<td>${produto.preco}</td></tr>
	</table>
</body>
</html>