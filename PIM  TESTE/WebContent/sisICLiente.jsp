<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/acesso.jspf" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar</title>
</head>
<body>
	<sql:update var="res" dataSource="${con}">
		INSERT INTO cliente (nome, login, senha, logradouro, cep, numero)
		VALUES (?,?,?,?,?,?)
		
		<sql:param value="${param['nome']}"/>
		<sql:param value="${param['login']}"/>
		<sql:param value="${param['senha']}"/>
		<sql:param value="${param['logradouro']}"/>
		<sql:param value="${param['cep']}"/>
		<sql:param value="${param['numero']}"/>
		
	</sql:update>
	
	<script language='JavaScript'>
 		<c:choose>
		  <c:when test="${res > 0}">
		  alert('Cliente incluído com Sucesso');
		  alert(" Seu Código de Cliente: <c:out value='${param.codTitulo}'></c:out>"+
				  "\n Nome: <c:out value='${param.nome}'></c:out>" +
				  "\n Login de Acesso: <c:out value='${param.login}'></c:out>" +
				  "\n Senha de Acesso: <c:out value='${param.senha}'></c:out>" +
				  "\n Logradouro: <c:out value='${param.logradouro}'></c:out>" +
				  "\n Número:<c:out value='${param.numero}'></c:out>");
		  </c:when>
		  <c:otherwise>
		  alert('Registro não incluído');
		  </c:otherwise>
		  </c:choose>
		  document.location.href="login.html";
		  /* history.go(-1); */
</script>
</body>
</html>