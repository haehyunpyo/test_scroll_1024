<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


	<h1>Test</h1>
<div>
	<c:forEach items="${list }" var="list">
		<div>${list.m_no }</div>
		<div>${list.m_id }</div>
		<div>${list.m_name }</div>
		<div>${list.m_birth }</div>
		<div>${list.m_addr }</div>
	</c:forEach>
</div>


</body>
</html>