<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>


<!DOCTYPE html>
<html>

<head>

   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <style>

       @import url("<c:url value='/css/home.css'/>");
   
   </style>
   <title>Document</title>
</head>

<body style="margin-top: 1rem; font-family: ONE-Mobile-Regular;">

   <div class="container">
<!-- 최신, 트랜딩 메뉴판 날짜설정메뉴는은 트랜딩메뉴 적용시만 활성 -->
		<div class="row" style="padding: 1.5rem 1.5rem 0.5rem 1.5rem;">
			<div class="col-md-1 px-md-0" id="recent2">
			
			<form action="<c:url value='/'/>" method="post">
			<c:if test="${trending==true }"><input type="hidden" name=fromT value="true"></c:if>
			<button type="submit" id="recent" class="btn z lo c p-0"
					style="margin-left: 0.3rem;background-color:transparent; border-color: transparent;  <c:if test="${recent==true }">font-weight: bold; color: black;</c:if>">
					<i class="fa-regular fa-clock fa-1x mx-md-1"></i>
					<span class="m-0" style="font-size: 1.1rem;">최신</span>
			</button></form>
			
			</div>
						
						
			<div class="col-md-1 px-md-0" >
			<form action="<c:url value='/trending'/>" method="post">
			<c:if test="${recent==true}"><input type="hidden" name=fromR value="true"></c:if>
			<button type="submit" id="trend" class="btn z c lo p-0"
					style="background-color:transparent; border-color: transparent; <c:if test="${trending==true }">font-weight: bold; color: black;</c:if>"><i
						class="fa-solid fa-arrow-trend-up fa-1x mx-md-1"></i>
						<span class="m-0" style="font-size: 1.1rem;">트랜딩</span>
			</button></form>
			</div>
							
			<div class="col-md-2 px-md-3">
			
			
			<c:if test="${trending==true }">	
				
				<button type="button" class="btn c rounded-circle p-0 position-relative"
					style="background-color:transparent; border-color: transparent;" data-bs-toggle="collapse"
					href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample3">
					<span id ="period" class="m-0" id="dateT" style="font-size: 1.1rem;">
					<c:choose>
						<c:when test="${period=='year'}">올해</c:when>
						<c:when test="${period=='month'}">이번 달</c:when>
						<c:when test="${period=='week'}">이번 주</c:when>
						<c:when test="${period=='day'}">오늘</c:when>
						<c:otherwise>이번 주</c:otherwise>
					</c:choose>
					<i class="fa-solid fa-caret-down mx-md-1"></i></span>

					<div class="collapse" id="collapseExample3"
						style="position: absolute; width: 10rem; top:2.5rem; left: -3.6rem; z-index: 1000;">
						<div class="card" style="width: 8rem;">

							<div class="card-body cc" id="day">
								<div style="text-align: right;">
									<span class="card-text"><strong>오늘</strong></span>
								</div>
							</div>

							<div class="card-body cc" id="week">
								<div style="text-align: right;">
									<span class="card-text"><strong>이번 주</strong></span>
								</div>
							</div>

							<div class="card-body cc" id="month">
								<div style="text-align: right;">
									<span class="card-text"><strong>이번 달</strong></span>
								</div>
							</div>


							<div class="card-body cc" id="year">
								<div style="text-align: right;">
									<span class="card-text"><strong>올해</strong></span>
								</div>
							</div>
						</div>	
					</div>
				</button>
			</c:if>

			
			
			
			
			<c:if test="${recent==true }">	
				<c:if test="${sessionScope.loginSession != null}">
				<button type="button" class="btn c rounded-circle p-0 position-relative"
					style="background-color:transparent; border-color: transparent;" data-bs-toggle="collapse"
					href="#collapseExample4" role="button" aria-expanded="false" aria-controls="collapseExample4">
					<span id="allChk" class="m-0" style="font-size: 1.1rem;">
					<c:choose>
						<c:when test="${allChk=='fol'}">팔로워</c:when>
						<c:when test="${allChk=='all'}">모든 사람</c:when>
						<c:otherwise>팔로워</c:otherwise>
					</c:choose>
					
					<i class="fa-solid fa-caret-down mx-md-1"></i></span>

					<div class="collapse" id="collapseExample4"
						style="position: absolute; width: 10rem; top:2.5rem; left: -3.6rem; z-index: 1000;">
						<div class="card" style="width: 8rem;">

							<div class="card-body cc" id="all">
								<div style="text-align: right;">
									<span class="card-text"><strong>모든 사람</strong></span>
								</div>
							</div>

							<div class="card-body cc" id="fol">
								<div style="text-align: right;">
									<span class="card-text"><strong>팔로워</strong></span>
								</div>
							</div>

							
						</div>	
					</div>
				</button>
				</c:if>
			</c:if>
			
			
			
			
			
			
			</div>
		</div>
	<!-- 최신, 트랜딩 밑줄 애니매이션 -->
	<div id="tot"  style="<c:choose><c:when test="${trending==true && fromR==false}">margin-left:7.7rem;</c:when>
		<c:otherwise>margin-left:0.7rem;</c:otherwise></c:choose>width: 5rem; height: 0.1rem; background-color: black;" >
	</div>
	
	</div>	
		
	<!-- Button trigger modal -->
	<div class="container" style="margin-top: 2rem;" id="posterbox">
	
	<c:if test="${not empty Posters }">
	<div class="row py-md-3" id="start">
	<c:forEach var="Poster" items="${Posters }">
			<div class="col-md-4 px-md-4 py-md-4">
				<div class="card poster" style="width: 100%; height: 27rem;" data-bno="${Poster.boardId }" data-lno="${Poster.likes }">
					<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
					<a href="${pageContext.request.contextPath}/boardController/board?boardId=${Poster.boardId}" class="stretched-link"></a>
					<!--썸네일 이미지-->
					<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
					<!--제목 내용-->
					<div class="card-body ">
						<strong>${Poster.title }</strong>
						<p class="card-text" style="padding-top: 0.3rem;">${Poster.preview }

						</p>
					</div>
					<div class="card-footer my-md-0 py-md-0"
						style="font-size: 0.8rem; border-top: 0; background-color: white;">

						<p class="card-text"
							style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
							<fmt:formatDate value="${Poster.regDate }" pattern="yy/MM/dd"/>
							</p>

							<!--계정사진 계정명 댓글수 좋아요수-->
						<div>

							<div style="margin-top: 0.3rem;">
							
								<div style="display: inline-block; float: left;">
									<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
										<a href="${pageContext.request.contextPath}/user/userpage/${Poster.userId}" class="stretched-link" style="position: relative; text-decoration: none;"><img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem"></a>
									</div>

								</div>
								<div  style="display: inline-block; float: left; margin-top: 0.13rem;">
									<a href="${pageContext.request.contextPath}/user/userpage/${Poster.userId}" class="stretched-link" style="position: relative; text-decoration: none;"><span class="mx-md-1" style="color: gray;">by</span><span>${Poster.writer }</span></a>
								</div>
								
								
								<div  style="display: inline-block; float: right; margin-top: 0.13rem">
									<i class="fa-solid fa-comment" style=""></i>
									<span style="margin-right: 0.5rem;" class="">3</span>
									<i class="fa-solid fa-heart"></i><span class="mx-md-1">${Poster.likes }</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
		</div>
	</c:if>
	
	

	



	<!-- bootstrap js -->
	


<script defer="defer">


         /*최신, 트랜딩 밑줄 애니매이션*/
         $(document).ready(function () {
              function test2(name, date) { console.log(`프로젝트명: ${name} 일자: ${date}`); } test2('print', '2019-05-13');

		
			if(${recent}==true){
				if(${fromT}==true ){
					$("#tot").removeClass('toto');
					$("#tot").addClass('toto2')
				}				
			}
		
			if(${trending}==true){
				if(${fromR}==true){
					$("#tot").removeClass('toto2');
					$("#tot").addClass('toto')
				}
			}	
			
			
			
			$('#collapseExample3').click(function(e){
				var target = $(e.target);
				var date="";
				if(target.is('#day')){
					date="day";
				}else if(target.is('#week')){
					date="week";

				}
				else if(target.is('#month')){
					date="month";

				}
				else if(target.is('#year')){
					date="year";

				}
				
				console.log("date는 "+date);
				
				var form = document.createElement('form');

				var objs;

				objs = document.createElement('input');
				
				objs.setAttribute('type', 'hidden');

				objs.setAttribute('name', 'period');

				objs.setAttribute('value', date);
				
				form.appendChild(objs);

				form.setAttribute('method', 'post');

				form.setAttribute('action', "/codelog/trending");

				document.body.appendChild(form);

				form.submit();
				
				
			});
			
			
			$('#collapseExample4').click(function(e){
				var target = $(e.target);
				var allChk="";
				if(target.is('#all')){
					allChk="all";
				}else if(target.is('#fol')){
					allChk="fol";
				}
			
				
				console.log("allChk는 "+allChk);
				
				var form = document.createElement('form');

				var objs;

				objs = document.createElement('input');
				
				objs.setAttribute('type', 'hidden');

				objs.setAttribute('name', 'allChk');

				objs.setAttribute('value', allChk);
				
				form.appendChild(objs);

				form.setAttribute('method', 'post');

				form.setAttribute('action', "/codelog/");

				document.body.appendChild(form);

				form.submit();
				
				
			});
			
			
			/*화면 클릭시 날짜토글 숨기기*/
			var LayerPopup3 = $("#collapseExample3");
			var LayerPopup4 = $("#collapseExample4");


         $(document).click(function (e){


				if(LayerPopup3.hasClass("show")){
				LayerPopup3.removeClass("show");
				}
				
				if(LayerPopup4.hasClass("show")){
					LayerPopup4.removeClass("show");
					}



         });
         
        
         
         });

   		
      
      
/*화면 클릭시 열려있는 토글창 닫기*/



/*무한스크롤*/
		var i = 0;
		console.log('기간은 ${period}');
		
		
	$(window).scroll(function() { 
  	if(Math.round($(window).scrollTop()) === $(document).height() - $(window).height()) { 
  		var boardId = $("#posterbox .poster").last().data('bno');
  		var likes = $("#posterbox .poster").last().data('lno');
  		var period = $("#period").text;
  		var allChk = $("#allChk").text;
  		

  		
		var lastPoster = $("#start");
  		console.log(lastPoster);

		console.log("보드아이디: "+boardId);
		console.log("좋아요: "+likes);
  		 
  		 console.log("i값은 "+i);
     	const info = {
						"i" : i,
						"boardId" : boardId,
						"likes" : likes,
						"period" : period,
						"allChk" : allChk
				};
     	
     	var url = $(location).attr('href');
     	console.log(url);
     	
     	if(url=="http://localhost:8181/codelog/"){
     		console.log("RECENT");
     	
		
				$.ajax({
					type : 'POST',
					url : '/codelog/radd',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(info),
					success : function(RPosters) {
						 i = i+1;
				     		console.log("RECENT:ADD 통신 성공");
				     		console.log(RPosters);

						if(RPosters != ""){
							$(RPosters).each(function(){  
                                
								console.log('-------------------');
								console.log(this.boardId);
                                console.log(boardId);
                                console.log('-------------------');
                                
								   var str ="";
								   str += "<div class=" + "'col-md-4 px-md-4 py-md-4'"+">"
									+ "<div class="+"'card poster'"+" style="+"'width: 100%; height: 27rem;'"+ "data-bno='"+this.boardId+"'"+"data-lno='"+this.likes+"'>"
	                				+ "<a href="+"${pageContext.request.contextPath}/boardController/board?boardId=${Poster.boardId}"+" class="+"'stretched-link'"+"></a>"
                             		+ "<img src="+"'img/cat.jpg'"+ "class="+"'card-img-top'"+" alt="+"'...'"+">"
                					+ "<div class="+"'card-body'"+ " >"
                					+ "<strong>타이틀"+this.title+"보드아이디"+this.boardId+"</strong>"
									+ "<p class="+"'card-text'"+" style="+"'padding-top: 0.3rem;'"+">"+this.preview+"</p></div>"
                              
									
									+ "<div class="+"'card-footer my-md-0 py-md-0'"+"style="+"'font-size: 0.8rem; border-top: 0; background-color: white;'"+">"
									+ "<p class="+"'card-text'"+"style="+"'border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;'"+">"
									+ this.regDate+"</p>"
									+ "<div>"

        							+ "<div style="+"'margin-top: 0.3rem;'"+">"
        							+ "<div style="+"'display: inline-block; float: left;'"+">"
        							+ "<div style="+"'border-radius: 70%; overflow: hidden; display: inline-block;'"+">"
        							+ "<img src="+"'img/pome3.jpg'"+" class="+"'img-rounded'"+" width="+"'25rem'"+">"
        							+ "</div>"	
        							+ "</div>"	
        							
        							+"<div style="+"'display: inline-block; float: left; margin-top: 0.13rem;'"+">"
									+"<span class="+"'mx-md-1'"+" style="+"'color: gray;'"+">by</span><span>"+this.writer+"</span>"
									+ "</div>"	
									+"<div style="+"'display: inline-block; float: right; margin-top: 0.13rem'"+">"
                					+ "<i class="+"'fa-solid fa-comment'"+"></i>"
                					+"<span style="+"'margin-right: 0.5rem;'"+">3</span>"	
                					+"<i class="+"'fa-solid fa-heart'"+"></i><span class="+"'mx-md-1'"+">"+this.likes+"</span>"		
                					+ "</div>"	
        							+ "</div>"	
        							+ "</div>"	
        							+ "</div>"	
        							+ "</div>"	
        							+ "</div>"	;
        							
        							lastPoster.append(str);
        							
								     //     document.querySelector('#posterbox').appendChild(addContent);

                             });

						}
					  
					},
					error : function() {
						console.log('통신 실패!');
					}
					
				}); //end ajax (로그인 비동기 처리) 
     	}
     	
     	else if(url=="http://localhost:8181/codelog/trending"){
     		
     		console.log("TRENDING");
     		
    		$.ajax({
				type : 'POST',
				url : '/codelog/tadd',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(info),
				success : function(TPosters) {
					 i = i+1;
			     	 console.log("성공")
					if(TPosters != ""){
						$(TPosters).each(function(){  
                            
							console.log('-------------------');
							console.log(this.boardId);
                            console.log(boardId);
                            console.log('-------------------');
                            
							   var str ="";
							   str += "<div class=" + "'col-md-4 px-md-4 py-md-4'"+">"
								+ "<div class="+"'card poster'"+" style="+"'width: 100%; height: 27rem;'"+ "data-bno='"+this.boardId+"'"+"data-lno='"+this.likes+"'>"
                				+ "<a href="+"'aa'"+" class="+"'stretched-link'"+"></a>"
                         		+ "<img src="+"'img/cat.jpg'"+ "class="+"'card-img-top'"+" alt="+"'...'"+">"
            					+ "<div class="+"'card-body'"+ " >"
            					+ "<strong>타이틀"+this.title+"보드아이디"+this.boardId+"</strong>"
								+ "<p class="+"'card-text'"+" style="+"'padding-top: 0.3rem;'"+">"+this.preview+"</p></div>"
                          
								
								+ "<div class="+"'card-footer my-md-0 py-md-0'"+"style="+"'font-size: 0.8rem; border-top: 0; background-color: white;'"+">"
								+ "<p class="+"'card-text'"+"style="+"'border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;'"+">"
								+ this.regDate+"</p>"
								+ "<div>"

    							+ "<div style="+"'margin-top: 0.3rem;'"+">"
    							+ "<div style="+"'display: inline-block; float: left;'"+">"
    							+ "<div style="+"'border-radius: 70%; overflow: hidden; display: inline-block;'"+">"
    							+ "<img src="+"'img/pome3.jpg'"+" class="+"'img-rounded'"+" width="+"'25rem'"+">"
    							+ "</div>"	
    							+ "</div>"	
    							
    							+"<div style="+"'display: inline-block; float: left; margin-top: 0.13rem;'"+">"
								+"<span class="+"'mx-md-1'"+" style="+"'color: gray;'"+">by</span><span>"+this.writer+"</span>"
								+ "</div>"	
								+"<div style="+"'display: inline-block; float: right; margin-top: 0.13rem'"+">"
            					+ "<i class="+"'fa-solid fa-comment'"+"></i>"
            					+"<span style="+"'margin-right: 0.5rem;'"+">3</span>"	
            					+"<i class="+"'fa-solid fa-heart'"+"></i><span class="+"'mx-md-1'"+">"+this.likes+"</span>"		
            					+ "</div>"	
    							+ "</div>"	
    							+ "</div>"	
    							+ "</div>"	
    							+ "</div>"	
    							+ "</div>"	;
    							
    							lastPoster.append(str);
    							
							     //     document.querySelector('#posterbox').appendChild(addContent);

                         });

					}
				  
				},
				error : function() {
					console.log('통신 실패!');
				}
				
			}); //end ajax (로그인 비동기 처리) 

     	}
     	
     
  	 }
	});

	</script>
</div>
</body>

</html>