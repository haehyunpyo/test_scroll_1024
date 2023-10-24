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
<style>
body{
	margin: auto;
	padding: 0;
}

table{
	width: 80%;
	height: 80%;
}

tr{
	height: 60px;
}

</style>
<script src="./js/jquery-3.7.0.min.js"></script>
<script src="./js/jquery-ui.min.js"></script>
<script type="text/javascript">


	$(function() {
		let isLoading = false; 
		let lastScrollTop = 0;
		let percent = 0;
		
		$(window).scroll(function() {

			let currentScrollTop = $(window).scrollTop();
			// 다운스크롤 이벤트 발생
			outerIf: if ( currentScrollTop - lastScrollTop > 0) { 
				//console.log("down-scroll");
				//console.log("currentScrollTop : " + $(window).scrollTop()); // 194.99998474121094
				//console.log("lastScrollTop : " + lastScrollTop); 
				//console.log($(document).height()-$(window).height());
				
				
				percent = ($(window).scrollTop() / ($(document).height() - $(window).height())) * 100;
				//console.log("percent : " + percent);
				
				if( percent > 99.9 ){
					isLoading = true;
					let addList = "";
					let lastbno = $(".scrolling:last").attr("data-bno");
					console.log("lastbno : " + lastbno);
					
					if(lastbno == 1){
						break outerIf;
					}
					
					$.ajax({
						url: './scrollDown',
						type: 'post',
						data: {bno : lastbno},
						dataType: 'json',
						success: function(data){
							
							if(data != ""){
								//alert("와");
								// 이제 여기다가 글을 더 뿌려
								$(data).each(function(){
									//console.log(this);			
									//console.log(this.list[0].bno);
									//console.log(typeof this.list[0].bno);	// number
							 		
									for(let i = 0; i<this.list.length; i++){
										
										addList +=	"<tr class=" + "'listToChange'" + ">" 
										+	 	"<td class=" +  "'scrolling'" + " data-bno='" + this.list[i].bno +"'>"
										+			this.list[i].bno
										+		"</td>"
										+		"<td class=" +  "title'>" + this.list[i].btitle + "</td>"		
										+		"<td>" + this.list[i].m_name + "</td>"
										+		"<td>" + this.list[i].bdate + "</td>"
										+		"<td>" + this.list[i].blike + "</td>"
								 		+ 	"</tr>";
									}
									
								});	// each
								
								$(".listToChange").remove();	// 기존게시글 지우기
								$(".scrollLocation").after(addList);	// 추가게시글 띄우기
								
								isLoading = false;
								
								
								// 스크롤바 중간지점으로 이동
								let position = ($(document).height() - $(window).height()) / 100 * 95;
								//console.log("Top: " + position.top);
								/* window.scroll({
									  top: position.top,
									  left: 0,
									  behavior: "smooth"
									}); */
								$('html,body').stop().animate({scrollTop : position}, 500, 'easeInQuint');
								percent = 0;
								
								
							} // if (data != "")
			
						}, // success
						error : function(error){
							//alert("에러남");
						} // error
						
					});	// ajax
					
					

				} // if	(percent > ~)
				
				lastScrollTop = currentScrollTop;
				
			}	// 다운스크롤 이벤트
			 // 업스크롤 이벤트 발생
	         else {
	            //console.log("up-scroll");
	            
	          	percent = ($(window).scrollTop() / ($(document).height() - $(window).height())) * 100;
				//console.log("업 / percent : " + percent);
				
	            outIf: if(percent <= 1 ){
	               
	               let addList = "";
	               let firstbno = $(".scrolling:first").attr("data-bno");
	               console.log("firstbno : " + firstbno);
	      
	               let xhr = $.ajax({
	                  url: './scrollUp',
	                  type: 'post',
	                  data: {bno : firstbno},
	                  dataType: 'json',
	                  success: function(data){
	                     
	                     if(!('emptybno' in data)){
	                    	 
	                        $(data).each(function(){
	                           console.log(this.list[0].bno);
	                           
	                           for(let i = 0; i<this.list.length; i++){
		                              
		                              addList +=   "<tr class=" + "'listToChange'" + ">" 
		                              +       "<td class=" +  "'scrolling'" + " data-bno='" + this.list[i].bno +"'>"
		                              +         this.list[i].bno
		                              +      "</td>"
		                              +      "<td class=" +  "title'>" + this.list[i].btitle + "</td>"      
		                              +      "<td>" + this.list[i].m_name + "</td>"
		                              +      "<td>" + this.list[i].bdate + "</td>"
		                              +      "<td>" + this.list[i].blike + "</td>"
		                               +    "</tr>";
		                           }
	                         
	                        });   // each
	                        
	                        $(".listToChange").remove();   // 기존게시글 지우기
	                        $(".scrollLocation").after(addList);   // 추가게시글 띄우기
	                        
							// 스크롤바 중간지점으로 이동
	                        let position = ($(document).height() - $(window).height()) / 100 * 5;
	                        //console.log("*****************업 / position: " + position);
	                        window.scroll({
	                             top: position,
	                             left: 0,
	                             behavior: "smooth"
	                           });
	                        
	                        percent = 0;
	                        
	                     } // if (data != "")
	                    
	                  }, // success
	                  error : function(error){
	                     //alert("에러남");
	                  } // error
	                  
	               });   // ajax
	              
	            }   // if(percent <= 1 )
	            
	            lastScrollTop = currentScrollTop;
	            	
	         } // else

	      });

	      
	   });
	</script>
<body>


	<h1>board</h1>
	<div align="center"><img src="../img/고래nb.png" width="80%"></div>
	<div align="center">
		<div><a href="/">새로고침</a></div>
		<table>
			<thead>
				<tr class="scrollLocation">
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>읽음</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr style="height: 50px;" class="listToChange">
						<td class="scrolling" data-bno="${list.bno}">${list.bno }</td>
						<td class="title">${list.btitle }</td>
						<td>${list.m_name }</td>
						<td>${list.bdate }</td>
						<td>${list.blike }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>