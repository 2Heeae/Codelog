<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
	<%@include file="../include/header.jsp"%>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>board</title>

	<style>
		/* 글 상세보기 페이지 css */
		@import url("<c:url value='/css/board.css'/>");
		/* 글 상세보기 페이지 font */
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap');
	</style>

</head>

<body>
	<form name="form1" method="post">
	<div style="height: 20px;"></div>
	<!-- 글 상세보기 페이지 시작 -->
	<!--col1/1(좋아요,프로필)/7(본문)/2(책갈피)/1-->
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>

			<!--좌측 고정메뉴-->
			<div class="col-md-1">
				<aside>
					<div class="sidebutton">
					<nav>
						<a class="likes" onclick='count("plus")'>♥</a>
						<div id='result' style="margin-left: 28px;">0</div>

						<!-- 글쓴이 프로필 사진 -->
						<a href="${pageContext.request.contextPath}/user/userpage/${dto.userId}">
							<img src="<c:url value='/img/${dto.userId }'/>" class="sharing"  alt="profile" >
							
						</a>
						<!-- 프로필사진 끝 -->
					</nav>
					</div>
				</aside>
			</div>

			<!--글 상세보기 내용-->
			<div class="col-md-7">
				<div class="container detail-main">
					<h1>${dto.title}</h1>
					<div class="info">
						<a class="writer" href="${pageContext.request.contextPath}/user/userpage/${dto.userId}">${dto.writer}</a>					
						<div class="slash"> | </div>
						<div class="date"> date: <fmt:formatDate value="${dto.regDate}" pattern="yy/MM/dd"/></div>
						<div class="slash"> | </div>						
						<span>view: ${dto.hit} </span>
					</div>
					
					<br>
					<div id="hashtag">
						<a href="${pageContext.request.contextPath}//search?keyword=${dto.tags}">#${dto.tags}</a>
					</div>

					<!-- 로그인시 수정,삭제 버튼 활성화 -->
					
     					<c:if test="${loginSession.nickname == dto.writer}">
         					<span class="modify">
					 		<!-- 게시물번호를 hidden 으로 처리 -->
							<input type="hidden" name="bno" value="${dto.boardId}">
							<button class="left btn btn-default" id="btnUpdate">수정</button>
							<button class="right btn btn-primary" id="btnDelete">삭제</button>
							</span>
    					 </c:if>
					

					<section>
						<div class="target" id="1">
							<a name="content1"></a>
							<!-- <div id="mini-title">소제목</div><br> -->
							<div>${dto.content}</div>
						</div>

					</section>

					
				</div>


			</div>
			<!--우측 고정메뉴-->
			<div class="col-md-2">
				<div class="bd-toc mt-4 mb-5 my-md-0 ps-xl-3 mb-lg-5 text-muted">
					<strong class="d-block h6 my-2 pb-2 border-bottom">On this Page</strong>
					<nav id="TableOfContents" style="border-left: 1px solid rgb(182, 182, 182);">
						<div class="content-menu">
							<a href="#1" class="active">프롤로그</a><br>
							<a href="#2">MS: 내가 원래 개발언어와 IDE 개발의 원조지!</a><br>
							<a href="#3">Typescript의 고질적인 문제1: 속도!</a><br>
							<a href="#4">Typescript의 고질적인 문제2: 잘 동작하던건데 전부 에러가 뜨데요?</a><br>
							<a href="#5">🔥 그러니 그냥 하세요. 안해야 할 이유가 없습니다.</a><br>
						</div>
					</nav>
				</div>
			</div>

			<div class="col-md-1"></div>
		</div>
	</div>
	
	
	
	<!-- 댓글  -->
<div class="collapse" id="reply_card${tmp.no }">
    <section class="modal-section">
        <div class="card card-body">
            <!-- 댓글 목록 -->
            <div class="reply-list reply-list${tmp.no }">
                <!-- 댓글이 목록이 들어가는 곳 -->
            </div>
            <!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
            <c:if test="${not empty sessionScope.nick }">
                <div class="row reply_write">
                    <div class="col-1">
                        <a href="other_profile.do?other_nick=${tmp.writer }">
                            <img id="write_reply_profileImage"
                                src="./upload/profile/${sessionScope.profile }" />
                        </a>
                    </div>
                    <div class="col-8" class="input_reply_div">
                        <input class="w-100 form-control" id="input_reply${tmp.no}"
                            type="text" placeholder="댓글입력...">
                    </div>
                    <div class="col-3 ">
                        <button type="button" idx="${tmp.no }"
                            class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
                    </div>
                </div>
            </c:if>
        </div>
    </section>
</div>


<!-- 댓글  -->
<div class="collapse" id="reply_card${tmp.no }">
댓글 시작
    <section class="modal-section">
        <div class="card card-body">
            <!-- 댓글 목록 -->
            <div class="reply-list reply-list${tmp.no }">
                <!-- 댓글이 목록이 들어가는 곳 -->
            </div>
            <!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
            <c:if test="${not empty sessionScope.userId }">
                <div class="row reply_write">
                    <div class="col-1">
                        <a href="#">
                            <img id="write_reply_profileImage"
                                src="/img/pome3.jpg" />
                        </a>
                    </div>
                    <div class="col-8" class="input_reply_div">
                        <input class="w-100 form-control" id="input_reply${tmp.no}"
                            type="text" placeholder="댓글입력...">
                    </div>
                    <div class="col-3 ">
                        <button type="button" id="${tmp.no }"
                            class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
                    </div>
                </div>
            </c:if>
        </div>
    </section>
</div>


	<%@include file="../include/footer.jsp"%>


	<script>
		function view() {
			if (hiddenReply.style.display == "none") {
				hiddenReply.style.display = "block";
				BT.value = "숨기기";
			} else {
				hiddenReply.style.display = "none";
				BT.value = "답글 열기";
			}
		}
	</script>

	<!--책갈피-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script>
		$('#TableOfContents .content-menu a').on('click', function (event) {
			$(this).parent().find('a').removeClass('active');
			$(this).addClass('active');
		});

		$(window).on('scroll', function () {
			$('.target').each(function () {
				if ($(window).scrollTop() >= $(this).offset().top) {
					var id = $(this).attr('id');
					$('#TableOfContents .content-menu a').removeClass('active');
					$('#TableOfContents .content-menu a[href=#' + id + ']').addClass('active');
				}
			});
		});
	</script>

	<!--좋아요 기능-->
	<script>
	function count(type)  {
		//<!--결과를 표시할 element-->
		const resultElement = document.getElementById('result');
		
		//<!--현재 화면에 표시된 값-->
		let number = resultElement.innerText;
		
		//<!--더하기/빼기-->
		if(type === 'plus') {
		  number = parseInt(number) + 1;
		}else if(type === 'minus')  {
		  number = parseInt(number) - 1;
		}

		//<!--결과 출력-->
		resultElement.innerText = number;
	  }
	</script>
	
	<!-- 수정/삭제 버튼 -->
	<script>
	$(document).ready(function(){
        $("#btnDelete").click(function(){
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = "${pageContext.request.contextPath}/boardController/delete?boardId=${dto.boardId}";
                document.form1.submit();
            }
        });
        $(document).ready(function(){
            $("#btnUpdate").click(function(){
                if(confirm("수정하시겠습니까?")){
                	$(location).attr("href", "write")
                }
            });
        });
	  });
</script>

	
	
	
	<!-- 글 상세보기 페이지 끝 -->
</body>

</html>