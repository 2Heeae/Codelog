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
					<span class="m-0" style="font-size: 1.1rem;">이번 주<i class="fa-solid fa-caret-down mx-md-1"></i></span>

					<div class="collapse" id="collapseExample3"
						style="position: absolute; width: 10rem; top:2.5rem; left: -3.6rem; z-index: 1000;">
						<div class="card" style="width: 8rem;">

							<div class="card-body cc" id="so">
								<div style="text-align: right;">
									<span class="card-text"><strong>오늘</strong></span>
								</div>
							</div>

							<div class="card-body cc" id="so">
								<div style="text-align: right;">
									<span class="card-text"><strong>이번 주</strong></span>
								</div>
							</div>

							<div class="card-body cc" id="so">
								<div style="text-align: right;">
									<span class="card-text"><strong>이번 달</strong></span>
								</div>
							</div>


							<div class="card-body cc" id="so">
								<div style="text-align: right;">
									<span class="card-text"><strong>올해</strong></span>
								</div>
							</div>
						</div>	
					</div>
				</button>
			</c:if>

			
			
			
			
			<c:if test="${recent==true }">	
				<button type="button" class="btn c rounded-circle p-0 position-relative"
					style="background-color:transparent; border-color: transparent;" data-bs-toggle="collapse"
					href="#collapseExample4" role="button" aria-expanded="false" aria-controls="collapseExample4">
					<span class="m-0" style="font-size: 1.1rem;">팔로워<i class="fa-solid fa-caret-down mx-md-1"></i></span>

					<div class="collapse" id="collapseExample4"
						style="position: absolute; width: 10rem; top:2.5rem; left: -3.6rem; z-index: 1000;">
						<div class="card" style="width: 8rem;">

							<div class="card-body cc" id="so">
								<div style="text-align: right;">
									<span class="card-text"><strong>모든 사람</strong></span>
								</div>
							</div>

							<div class="card-body cc" id="so">
								<div style="text-align: right;">
									<span class="card-text"><strong>팔로워</strong></span>
								</div>
							</div>

							
						</div>	
					</div>
				</button>
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
	<div class="row py-md-3">
	<c:forEach var="Poster" items="${Posters }">
			<div class="col-md-4 px-md-4 py-md-4">
				<div class="card poster" style="width: 100%; height: 27rem;" data-bno="${Poster.boardId }">
					<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
					<a href="aa" class="stretched-link"></a>
					<!--썸네일 이미지-->
					<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
					<!--제목 내용-->
					<div class="card-body ">
						<strong>${Poster.title }</strong>
						<p class="card-text" style="padding-top: 0.3rem;">${Poster.content }

						</p>
					</div>
					<div class="card-footer my-md-0 py-md-0"
						style="font-size: 0.8rem; border-top: 0; background-color: white;">

						<p class="card-text"
							style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
							${Poster.regDate }</p>

							<!--계정사진 계정명 댓글수 좋아요수-->
						<div>

							<div style="margin-top: 0.3rem;">
								<div style="display: inline-block; float: left;">
									<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
										<img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem">
									</div>

								</div>
								<div style="display: inline-block; float: left; margin-top: 0.13rem;">
									<span class="mx-md-1" style="color: gray;">by</span><span>${Poster.writer }</span>
								</div>
								<div style="display: inline-block; float: right; margin-top: 0.13rem">
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
			
	
	
	
		<!--포스터 카드 부분 한줄에 3개씩-->
		<div class="row py-md-3">

			<div class="col-md-4 px-md-4">
				<div class="card poster" style="width: 100%; height: 27rem;">
					<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
					<a href="aa" class="stretched-link"></a>
					<!--썸네일 이미지-->
					<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
					<!--제목 내용-->
					<div class="card-body ">
						<strong>한글 입숨</strong>
						<p class="card-text" style="padding-top: 0.3rem;">딴은 쓸쓸함과 별 까닭입니다. 멀듯이, 하나의 잠, 한 덮어 하나에 이름과,
							부끄러운 까닭입니다.

						</p>
					</div>
					<div class="card-footer my-md-0 py-md-0"
						style="font-size: 0.8rem; border-top: 0; background-color: white;">

						<p class="card-text"
							style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
							2022년 1월 5일</p>

							<!--계정사진 계정명 댓글수 좋아요수-->
						<div>

							<div style="margin-top: 0.3rem;">
								<div style="display: inline-block; float: left;">
									<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
										<img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem">
									</div>

								</div>
								<div style="display: inline-block; float: left; margin-top: 0.13rem;">
									<span class="mx-md-1" style="color: gray;">by</span><span>김철수1234</span>
								</div>
								<div style="display: inline-block; float: right; margin-top: 0.13rem">
									<i class="fa-solid fa-comment" style=""></i>
									<span style="margin-right: 0.5rem;" class="">3</span>
									<i class="fa-solid fa-heart"></i><span style="" class="mx-md-1">7</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-4 px-md-4">
				<div class="card poster" style="width: 100%; height: 27rem;">
					<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
					<a href="aa" class="stretched-link"></a>
					<!--썸네일 이미지-->
					<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
					<!--제목 내용-->
					<div class="card-body ">
						<strong>한글 입숨</strong>
						<p class="card-text" style="padding-top: 0.3rem;">딴은 쓸쓸함과 별 까닭입니다. 멀듯이, 하나의 잠, 한 덮어 하나에 이름과,
							부끄러운 까닭입니다.

						</p>
					</div>
					<div class="card-footer my-md-0 py-md-0"
						style="font-size: 0.8rem; border-top: 0; background-color: white;">

						<p class="card-text"
							style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
							2022년 1월 5일</p>

							<!--계정사진 계정명 댓글수 좋아요수-->
						<div>

							<div style="margin-top: 0.3rem;">
								<div style="display: inline-block; float: left;">
									<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
										<img src="<c:url value='/img/kmj.jpg'/>" class="img-rounded" width="25rem">
									</div>

								</div>
								<div style="display: inline-block; float: left; margin-top: 0.13rem;">
									<span class="mx-md-1" style="color: gray;">by</span><span>홍길동5678</span>
								</div>
								<div style="display: inline-block; float: right; margin-top: 0.13rem">
									<i class="fa-solid fa-comment" style=""></i>
									<span style="margin-right: 0.5rem;" class="">3</span>
									<i class="fa-solid fa-heart"></i><span style="" class="mx-md-1">7</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="col-md-4 px-md-4">
				<div class="card poster" style="width: 100%; height: 27rem;">
					<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
					<a href="aa" class="stretched-link"></a>
					<!--썸네일 이미지-->
					<img src="./img/cat.jpg" class="card-img-top" alt="...">
					<!--제목 내용-->
					<div class="card-body ">
						<strong>한글 입숨</strong>
						<p class="card-text" style="padding-top: 0.3rem;">딴은 쓸쓸함과 별 까닭입니다. 멀듯이, 하나의 잠, 한 덮어 하나에 이름과,
							부끄러운 까닭입니다.

						</p>
					</div>
					<div class="card-footer my-md-0 py-md-0"
						style="font-size: 0.8rem; border-top: 0; background-color: white;">

						<p class="card-text"
							style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
							2022년 1월 5일</p>

							<!--계정사진 계정명 댓글수 좋아요수-->
						<div>

							<div style="margin-top: 0.3rem;">
								<div style="display: inline-block; float: left;">
									<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
										<img src="./img/pome3.jpg" class="img-rounded" width="25rem">
									</div>

								</div>
								<div style="display: inline-block; float: left; margin-top: 0.13rem;">
									<span class="mx-md-1" style="color: gray;">by</span><span>김철수1234</span>
								</div>
								<div style="display: inline-block; float: right; margin-top: 0.13rem">
									<i class="fa-solid fa-comment" style=""></i>
									<span style="margin-right: 0.5rem;" class="">3</span>
									<i class="fa-solid fa-heart"></i><span style="" class="mx-md-1">7</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div class="row py-md-3">

			<div class="col-md-4 px-md-4">
				<div class="card" style="width: 100%; height: 27rem;">
					<a href="aa" class="stretched-link"></a>

					<img src="./img/cat.jpg" class="card-img-top" alt="...">
					<div class="card-body ">
						<strong>제목</strong>
						<p class="card-text">ㅁㄴasdasasdsadsadsadasd card's content.</p>
					</div>
					<div class="card-footer">
						<p class="card-text">댓글수 13.</p>
					</div>
				</div>
			</div>


			<div class="col-md-4 px-md-4">
				<div class="card" style="width: 100%; height: 27rem;">
					<img width="50px" src="./img/cat.jpg" class="card-img-top" alt="...">
					<div class="card-body h-100">
						<strong>제목</strong>
						<p class="card-text">Scard's content.</p>
					</div>
					<div class="card-footer">
						<p class="card-text">댓글수 13.</p>
					</div>
				</div>
			</div>



			<div class="col-md-4 px-md-4">
				<div class="card" style="width: 100%; height: 27rem;">
					<img width="50px" src="./img/cat.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<strong>제목</strong>
						<p class="card-text">rd title and makesdasda아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏdddkkdsdsaasd up the bulk
							of the card's content.</p>
					</div>
					<div class="card-footer">
						<p class="card-text">댓글수 13.</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row py-md-3">

			<div class="col-md-4 px-md-4">
				<div class="card" style="width: 100%; height: 27rem;">
					<a href="aa" class="stretched-link"></a>

					<img src="./img/cat.jpg" class="card-img-top" alt="...">
					<div class="card-body ">
						<strong>제목</strong>
						<p class="card-text">ㅁㄴasdasasdsadsadsadasd card's content.</p>
					</div>
					<div class="card-footer">
						<p class="card-text">댓글수 13.</p>
					</div>
				</div>
			</div>


			<div class="col-md-4 px-md-4">
				<div class="card" style="width: 100%; height: 27rem;">
					<img width="50px" src="./img/cat.jpg" class="card-img-top" alt="...">
					<div class="card-body h-100">
						<strong>제목</strong>
						<p class="card-text">Scard's content.</p>
					</div>
					<div class="card-footer">
						<p class="card-text">댓글수 13.</p>
					</div>
				</div>
			</div>



			<div class="col-md-4 px-md-4">
				<div class="card" style="width: 100%; height: 27rem;">
					<img width="50px" src="./img/cat.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<strong>제목</strong>
						<p class="card-text">rd title and makesdasda아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏdddkkdsdsaasd up the bulk
							of the card's content.</p>
					</div>
					<div class="card-footer">
						<p class="card-text">댓글수 13.</p>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- bootstrap js -->
	

<script>


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
		var i = 3;
	$(window).scroll(function() { 
  	if(Math.round($(window).scrollTop()) === $(document).height() - $(window).height()) { 
  		
  		
  		 
  		 console.log("i값은 "+i);
     	const info = {
						"i" : i			
				};
     	 i = i+1;
     	 
     	var url = $(location).attr('href');
     	console.log(url);
     	
     	if(url=="http://localhost:8181/codelog/"){
     		console.log("리센트");
     	
		
				$.ajax({
					type : 'POST',
					url : '/codelog/radd',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(info),
					success : function(RPosters) {
				
					     //console.log(RPosters.i1.title);
					     //console.log(RPosters.empty);

						if(RPosters.i1 != null) {
							console.log('추가 포스터를 가져옵니다');
							
							   setTimeout(function(){

								
										
								   var addContent = document.createElement("div");
	   
								      addContent.innerHTML = `
								      <div class="row py-md-3">
											<div class="col-md-4 px-md-4">
												<div class="card poster" style="width: 100%; height: 27rem;">
													<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
													<a href="aa" class="stretched-link"></a>
													<!--썸네일 이미지-->
													<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
													<!--제목 내용-->
													<div class="card-body ">
														<strong>\${RPosters.i1.title }</strong>
														<p class="card-text" style="padding-top: 0.3rem;">\${RPosters.i1.content }

														</p>
													</div>
													<div class="card-footer my-md-0 py-md-0"
														style="font-size: 0.8rem; border-top: 0; background-color: white;">

														<p class="card-text"
															style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
															</p>

															<!--계정사진 계정명 댓글수 좋아요수-->
														<div>

															<div style="margin-top: 0.3rem;">
																<div style="display: inline-block; float: left;">
																	<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
																		<img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem">
																	</div>

																</div>
																<div style="display: inline-block; float: left; margin-top: 0.13rem;">
																	<span class="mx-md-1" style="color: gray;">by</span><span>\${RPosters.i1.writer }</span>
																</div>
																<div style="display: inline-block; float: right; margin-top: 0.13rem">
																	<i class="fa-solid fa-comment" style=""></i>
																	<span style="margin-right: 0.5rem;" class="">3</span>
																	<i class="fa-solid fa-heart"></i><span class="mx-md-1">\${RPosters.i1.likes }</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="col-md-4 px-md-4">
											<div class="card poster" style="width: 100%; height: 27rem;">
												<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
												<a href="aa" class="stretched-link"></a>
												<!--썸네일 이미지-->
												<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
												<!--제목 내용-->
												<div class="card-body ">
													<strong>\${RPosters.i2.title }</strong>
													<p class="card-text" style="padding-top: 0.3rem;">\${RPosters.i2.content }

													</p>
												</div>
												<div class="card-footer my-md-0 py-md-0"
													style="font-size: 0.8rem; border-top: 0; background-color: white;">

													<p class="card-text"
														style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
														</p>

														<!--계정사진 계정명 댓글수 좋아요수-->
													<div>

														<div style="margin-top: 0.3rem;">
															<div style="display: inline-block; float: left;">
																<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
																	<img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem">
																</div>

															</div>
															<div style="display: inline-block; float: left; margin-top: 0.13rem;">
																<span class="mx-md-1" style="color: gray;">by</span><span>\${RPosters.i2.writer }</span>
															</div>
															<div style="display: inline-block; float: right; margin-top: 0.13rem">
																<i class="fa-solid fa-comment" style=""></i>
																<span style="margin-right: 0.5rem;" class="">3</span>
																<i class="fa-solid fa-heart"></i><span class="mx-md-1">\${RPosters.i2.likes }</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-md-4 px-md-4">
										<div class="card poster" style="width: 100%; height: 27rem;">
											<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
											<a href="aa" class="stretched-link"></a>
											<!--썸네일 이미지-->
											<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
											<!--제목 내용-->
											<div class="card-body ">
												<strong>\${RPosters.i3.title }</strong>
												<p class="card-text" style="padding-top: 0.3rem;">\${RPosters.i3.content }

												</p>
											</div>
											<div class="card-footer my-md-0 py-md-0"
												style="font-size: 0.8rem; border-top: 0; background-color: white;">

												<p class="card-text"
													style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
													</p>

													<!--계정사진 계정명 댓글수 좋아요수-->
												<div>

													<div style="margin-top: 0.3rem;">
														<div style="display: inline-block; float: left;">
															<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
																<img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem">
															</div>

														</div>
														<div style="display: inline-block; float: left; margin-top: 0.13rem;">
															<span class="mx-md-1" style="color: gray;">by</span><span>\${RPosters.i3.writer }</span>
														</div>
														<div style="display: inline-block; float: right; margin-top: 0.13rem">
															<i class="fa-solid fa-comment" style=""></i>
															<span style="margin-right: 0.5rem;" class="">3</span>
															<i class="fa-solid fa-heart"></i><span class="mx-md-1">\${RPosters.i3.likes }</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
										</div>`
								   
							          document.querySelector('#posterbox').appendChild(addContent);
							   }, 1000);
							        
								
							 
						
						} else if(RPosters.i1 == null) {
							console.log('더이상의 포스터는 없습니다');
							
						} 
					},
					error : function() {
						console.log('통신 실패!');
					}
					
				}); //end ajax (로그인 비동기 처리) 
     	}
     	
     	
     	else if(url=="http://localhost:8181/codelog/trending"){
     		console.log("트렌딩");
     	
		
				$.ajax({
					type : 'POST',
					url : '/codelog/tadd',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(info),
					success : function(TPosters) {
				
					     //console.log(RPosters.i1.title);
					     //console.log(RPosters.empty);

						if(TPosters.i1 != null) {
							console.log('추가 포스터를 가져옵니다');
							
							   setTimeout(function(){

								
										
								   var addContent = document.createElement("div");
	   
								      addContent.innerHTML = `
								      <div class="row py-md-3">
											<div class="col-md-4 px-md-4">
												<div class="card poster" style="width: 100%; height: 27rem;">
													<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
													<a href="aa" class="stretched-link"></a>
													<!--썸네일 이미지-->
													<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
													<!--제목 내용-->
													<div class="card-body ">
														<strong>\${TPosters.i1.title }</strong>
														<p class="card-text" style="padding-top: 0.3rem;">\${TPosters.i1.content }

														</p>
													</div>
													<div class="card-footer my-md-0 py-md-0"
														style="font-size: 0.8rem; border-top: 0; background-color: white;">

														<p class="card-text"
															style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
															</p>

															<!--계정사진 계정명 댓글수 좋아요수-->
														<div>

															<div style="margin-top: 0.3rem;">
																<div style="display: inline-block; float: left;">
																	<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
																		<img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem">
																	</div>

																</div>
																<div style="display: inline-block; float: left; margin-top: 0.13rem;">
																	<span class="mx-md-1" style="color: gray;">by</span><span>\${TPosters.i1.writer }</span>
																</div>
																<div style="display: inline-block; float: right; margin-top: 0.13rem">
																	<i class="fa-solid fa-comment" style=""></i>
																	<span style="margin-right: 0.5rem;" class="">3</span>
																	<i class="fa-solid fa-heart"></i><span class="mx-md-1">\${TPosters.i1.likes }</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="col-md-4 px-md-4">
											<div class="card poster" style="width: 100%; height: 27rem;">
												<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
												<a href="aa" class="stretched-link"></a>
												<!--썸네일 이미지-->
												<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
												<!--제목 내용-->
												<div class="card-body ">
													<strong>\${TPosters.i2.title }</strong>
													<p class="card-text" style="padding-top: 0.3rem;">\${TPosters.i2.content }

													</p>
												</div>
												<div class="card-footer my-md-0 py-md-0"
													style="font-size: 0.8rem; border-top: 0; background-color: white;">

													<p class="card-text"
														style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
														</p>

														<!--계정사진 계정명 댓글수 좋아요수-->
													<div>

														<div style="margin-top: 0.3rem;">
															<div style="display: inline-block; float: left;">
																<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
																	<img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem">
																</div>

															</div>
															<div style="display: inline-block; float: left; margin-top: 0.13rem;">
																<span class="mx-md-1" style="color: gray;">by</span><span>\${TPosters.i2.writer }</span>
															</div>
															<div style="display: inline-block; float: right; margin-top: 0.13rem">
																<i class="fa-solid fa-comment" style=""></i>
																<span style="margin-right: 0.5rem;" class="">3</span>
																<i class="fa-solid fa-heart"></i><span class="mx-md-1">\${TPosters.i2.likes }</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-md-4 px-md-4">
										<div class="card poster" style="width: 100%; height: 27rem;">
											<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
											<a href="aa" class="stretched-link"></a>
											<!--썸네일 이미지-->
											<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
											<!--제목 내용-->
											<div class="card-body ">
												<strong>\${TPosters.i3.title }</strong>
												<p class="card-text" style="padding-top: 0.3rem;">\${TPosters.i3.content }

												</p>
											</div>
											<div class="card-footer my-md-0 py-md-0"
												style="font-size: 0.8rem; border-top: 0; background-color: white;">

												<p class="card-text"
													style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
													</p>

													<!--계정사진 계정명 댓글수 좋아요수-->
												<div>

													<div style="margin-top: 0.3rem;">
														<div style="display: inline-block; float: left;">
															<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
																<img src="<c:url value='/img/pome3.jpg'/>" class="img-rounded" width="25rem">
															</div>

														</div>
														<div style="display: inline-block; float: left; margin-top: 0.13rem;">
															<span class="mx-md-1" style="color: gray;">by</span><span>\${TPosters.i3.writer }</span>
														</div>
														<div style="display: inline-block; float: right; margin-top: 0.13rem">
															<i class="fa-solid fa-comment" style=""></i>
															<span style="margin-right: 0.5rem;" class="">3</span>
															<i class="fa-solid fa-heart"></i><span class="mx-md-1">\${TPosters.i3.likes }</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
										</div>`
								   
							          document.querySelector('#posterbox').appendChild(addContent);
							   }, 1000);
							        
								
							 
						
						} else if(TPosters.i1 == null) {
							console.log('더이상의 포스터는 없습니다');
							
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

</body>

</html>