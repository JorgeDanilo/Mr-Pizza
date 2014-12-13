<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Novo produto</h3>
	<form action="form6proc.jsp" method="post">
	<table border="0">
			<tr bgcolor="#CFCFEF"><td>Código</td>
			<td><input type="text" name="codigo"></td></tr>
			<tr bgcolor="#DFDFDF"><td>Descricao</td>
			<td><input type="text" name="descricao"></td></tr>
			<tr bgcolor="#CFCFEF"><td>Preço</td>
			<td><input type="text" name="preco"></td></tr>
			<tr bgcolor="#DFDFDF"><td colspan="2" align="right">
			<input type="submit" value="Salvar"></td></tr>
	</table>
	</form>
</body>
</html>