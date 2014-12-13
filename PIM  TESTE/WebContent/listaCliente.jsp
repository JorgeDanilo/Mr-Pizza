<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/acesso.jspf" %>
 <%@include file="WEB-INF/jspf/cabec.jspf" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar</title>
</head>
<body>
	Seu Código de Cliente<c:out value="${param.codTitulo}"></c:out><br/>
	Nome:<c:out value="${param.nome}"></c:out><br/>
	Login de Acesso:<c:out value="${param.login}"></c:out><br/>
	Senha de Acesso:<c:out value="${param.senha}"></c:out><br/>
	Logradouro:<c:out value="${param.logradouro}"></c:out><br/>
	Número:<c:out value="${param.numero}"></c:out>
	
	
	
	
</body>
</html>
