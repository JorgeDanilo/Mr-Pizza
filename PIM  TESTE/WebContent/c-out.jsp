<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:out value="<h3>&lt;c:out&gt;</h3>" escapeXml="false"/>
	<p>Servidor: <c:out value="${header.host}"/>
	<br/> 123 * 456 = <c:out value="${123*456}"/>
	<br/> X = <c:out value="${x}" default="variavel não existe"/></p>	
</body>
</html>