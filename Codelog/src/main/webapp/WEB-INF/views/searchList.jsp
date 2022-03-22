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
   <!-- 
<!-- 최신, 트랜딩 메뉴판 날짜설정메뉴는은 트랜딩메뉴 적용시만 활성 
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
	<!-- 최신, 트랜딩 밑줄 애니매이션 
	<div id="tot"  style="<c:choose><c:when test="${trending==true && fromR==false}">margin-left:7.7rem;</c:when>
		<c:otherwise>margin-left:0.7rem;</c:otherwise></c:choose>width: 5rem; height: 0.1rem; background-color: black;" >
	</div>
	
	</div>
	 -->	
		
	<!-- Button trigger modal -->
	<div class="container" style="margin-top: 2rem;" id="posterbox">
	
	<c:if test="${not empty searchList}">
	<div class="row py-md-3" id="start">
	<c:forEach var="s" items="${searchList}">
			<div class="col-md-4 px-md-4 py-md-4">
				<div class="card poster" style="width: 100%; height: 27rem;" data-bno="${s.boardId}" data-lno="${s.likes}">
					<!--포스터카드 아무대나 클릭해도 링크 걸리기-->
					<a href="${pageContext.request.contextPath}/boardController/board?boardId=${s.boardId}" class="stretched-link"></a>
					<!--썸네일 이미지-->
					<img src="<c:url value='/img/cat.jpg'/>" class="card-img-top" alt="...">
					<!--제목 내용-->
					<div class="card-body ">
						<strong>${s.title},보드아이디: ${s.boardId}</strong>
						<p class="card-text" style="padding-top: 0.3rem;">${s.preview}

						</p>
					</div>
					<div class="card-footer my-md-0 py-md-0"
						style="font-size: 0.8rem; border-top: 0; background-color: white;">

						<p class="card-text"
							style="border-bottom: 1px solid rgba(128, 128, 128, 0.178); margin-bottom: 0.4rem; padding-bottom: 0.3rem;">
							${s.regDate}</p>

							<!--계정사진 계정명 댓글수 좋아요수-->
						<div>

							<div style="margin-top: 0.3rem;">
								<div style="display: inline-block; float: left;">
									<div style="border-radius: 70%; overflow: hidden; display: inline-block;">
										<img src="<c:url value='/img/${s.userId}'/>" class="img-rounded" width="25rem">
									</div>

								</div>
								<div style="display: inline-block; float: left; margin-top: 0.13rem;">
									<span class="mx-md-1" style="color: gray;">by</span><span>${s.writer}</span>
								</div>
								<div style="display: inline-block; float: right; margin-top: 0.13rem">
									<i class="fa-solid fa-comment" style=""></i>
									<span style="margin-right: 0.5rem;" class="">3</span>
									<i class="fa-solid fa-heart"></i><span class="mx-md-1">${s.likes}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
		</div>
	</c:if>

</div>
</div>
</body>

</html>