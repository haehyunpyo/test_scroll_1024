<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		let lastScrollTop = 0;
		
		$(window).scroll(function(){

			let currentScrollTop = $(window).scrollTop();
			// 다운스크롤
			if ( currentScrollTop - lastScrollTop > 0 ){
				lastScrollTop = currentScrollTop;
			// 업스크롤
			}	else {
				lastScrollTop = currentScrollTop;
			}
			
			
			
			
		});
		
		
		
		
		
		
		
		
	});


</script>

<body>


	<h1>board</h1>
	<div>
		<table>
			<thead>
				<tr class="row">
					<th class="col-1">번호</th>
					<th class="col-6">제목</th>
					<th class="col-2">글쓴이</th>
					<th class="col-2">날짜</th>
					<th class="col-1">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="list">
					<tr style="height: 50px;">
						<td class="col-1">${list.bno }</td>
						<td class="col-6">${list.btitle }</td>
						<td class="col-2">${list.content }</td>
						<td class="col-2">${list.bdate}</td>
						<td class="col-1">${list.blike}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
</body>
</html>