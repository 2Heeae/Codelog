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
 <link
      rel="stylesheet"
      href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css"
    />
	<style>
		/* 글 상세보기 페이지 css */
		@import url("<c:url value='/css/board.css'/>");
		/* 글 상세보기 페이지 font */
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap');
		/* 토스트 UI CSS */
		@import url("<c:url value='/css/toastTest.css'/>");
	</style>
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
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
					<!-- 좋아요 버튼 -->
					<c:choose>
						<c:when test="${loginSession != null}">
							<c:choose>
								<c:when test="${postLike == 0}">
									<a class="likes" id="like-btn">♥</a>
									<!-- 이 글을 보는 로그인한 유저가 좋아요 눌렀는지 확인 여부 체크 좋아요=1, 좋아요 안누름=0 -->
									<input type="hidden" id="like-check" value="${postLike}">
								</c:when>
								<c:otherwise>
									<a class="likes" id="like-btn" style="color: red;">♥</a>
									<input type="hidden" id="like-check" value="${postLike}">
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a class="likes" id="like-btn">♥</a>
							<input type="hidden" id="like-check">
						</c:otherwise>
					</c:choose>
					<!-- 좋아요 버튼 끝 -->
					
						<!-- 해당 게시글의 총 좋아요 개수 -->
						<div id='result' style="margin-left: 28px;">${dto.likes}</div>
						<!-- 이 글을 보는 사람이 로그인 했다면 여기에 로그인 세션에서 아이디 꺼내와놓기 -->
						<input type="hidden" id="view-user" value="${loginSession.userId}">

						<a href="${pageContext.request.contextPath}/user/userpage/${dto.userId}">
							<img width="55rem" src="<c:url value='/image/${dto.userId }'/>" class="card-img-right rounded-circle mx-md-1"  alt="profile" >
							
						</a>
						<!-- 프로필사진 끝 -->
					</nav>
					</div>
				</aside>
			</div>

			<!--글 상세보기 내용-->
			<div class="col-md-7">
				<div class="container detail-main">
					<div class="title">${dto.title}</div>
					<div class="info">
						<a class="writer" href="${pageContext.request.contextPath}/user/userpage/${dto.userId}">${dto.writer}</a>					
						<div class="slash"> | </div>
						<div class="date"> <fmt:formatDate value="${dto.regDate}" pattern="yy/MM/dd"/></div>
						<div class="slash"> | </div>						
						<span>view: ${dto.hit} </span>
					</div>
					
					<br>
					<div class="hashtag">
						<a style="color:rgb(120, 147, 149);" href="${pageContext.request.contextPath}//search?keyword=${dto.tags}">#${dto.tags}</a>
					</div>

					<!-- 로그인시 수정,삭제 버튼 활성화 -->
					
     					<c:if test="${loginSession.nickname == dto.writer}">
         					<span class="modify">
					 		<!-- 게시물번호를 hidden 으로 처리 -->
							<input type="hidden" name="bno" value="${dto.boardId}">
							<button type="button" class="left btn btn-default" id="btnUpdate">수정</button>
							<button type="button" class="right btn btn-primary" id="btnDelete">삭제</button>
							</span>
    					 </c:if>
					

					<section>
						<div id="viewer" style="width:700px; height:700px">
							${dto.content}
						</div>

<script>
var view1 = $('#view').val()

	const viewer = toastui.Editor.factory({
		  el: document.querySelector('#viewer'),
      viewer: true,
      height: '500px',
      initialValue: view1
	});
	
	console.log(view1)

	
	
	 function ToView()
 {
     viewer.getHTML(viewer.setHTML());
 };	</script>
		</section>

					<!--댓글 영역-->
					<section class="reply">
						<div class="reply-container">
							<div class="row">
								<div class="col-md-9 col-xs-12 content-wrap">
									<h2>${dto.recnt}개의 댓글</h2>
									<!-- 댓글 작성 공간 -->
									<div class="reply-wrap">
										<!-- 댓쓴이 프로필 이미지 -->
										<div class="reply-image">
											<c:choose>
                     							<c:when test="${loginSession.userImg eq null || loginSession.userImg eq 'null'}">
                        							<img width="50rem" id="small-profile-img" src="<c:url value='/img/user_icon.png'/>" class="card-img-right rounded-circle mx-md-1"
                           							alt=".">
                     							</c:when>
                     							<c:otherwise>
                          							 <img width="50rem" id="small-profile-img" src="<c:url value='/user/display'/>" class="card-img-right rounded-circle mx-md-1"
                           								alt=".">
                     							</c:otherwise>
                  							</c:choose>
										</div>
										<!-- 프로필 이미지 끝 -->
										<div class="reply-content">
											<textarea class="form-control" rows="3"></textarea>
											<div class="reply-group clearfix">
												<button class="btn btn-info">등록하기</button>
											</div>
										</div>
									</div>
									<!-- 댓글이 달릴 공간 -->
									<div id="listReply"></div>
									<div class="reply-wrap">
										<div class="reply-image">
											<img id=prof src="<c:url value='/img/profile4.png'/>" alt="prof">
											
										</div>
										<div class="reply-content">
											<div class="reply-group clearfix">
												<strong class="left">${dto.userId} <fmt:formatDate value="${dto.regDate}" pattern="yyyy-MM-dd"/></strong> <br>
												
												
											</div><br>
											<%-- <p>${dto.replytext}</p> --%>
										</div>

										<div class="hiddenDiv">
											<input id="BT" type="button" value="답글 열기" onclick="view()">
											<div id="hiddenReply" style="display:none">
												<div class="re-reply-image">
													<img id=prof src="<c:url value='/img/profile6.png'/> " alt="prof">
												</div>
												<div class="re-reply-content">
													<div class="reply-group clearfix">
														<strong class="left">helloworld</strong> <br>
														<small class="left">2022년 03월 04일</small>
													</div><br>
													<p>자바스크립트가 발전하는 과정에서 불편한 점을 해결하기 위해 OOscript가 나오고 좋은 기능은 JS로 편입되는
														변천사를 보았습니다. 적어도 Type에 관한 건 타입스크립트가 해결해주니 머지않아 해당 기능을 JS가 자연스레
														지원하는 방식으로 나아갈 것이라고 생각이 드네요.
														그렇다면 과연 TS가 JS와 다른 특장점으로 가져갈 것이 무엇이 남아있나라는 생각과 어디까지 JS로 편입될지도
														무척이나 궁금합니다.
														요런 격변기에 프론트엔드 개발자라는게 재밌고 설레네요.
														이번글도 어김없이 좋은글 감사합니다.</p>
												</div>
											</div>



										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>


			</div>
			<!--우측 고정메뉴-->
			<div class="col-md-2">
				<div class="bd-toc mt-4 mb-5 my-md-0 ps-xl-3 mb-lg-5 text-muted">
					<strong class="d-block h6 my-2 pb-2 border-bottom">On this Page</strong>
					<nav id="TableOfContents" style="border-left: 1px solid rgb(182, 182, 182);">
						<div  class="content-menu">
													
						</div>
					</nav>
				</div>
			</div>

			<div class="col-md-1"></div>
		</div>
			<%@include file="../include/footer.jsp"%>
	</div>




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

	<!--  
	<!--좋아요 기능
	<script>
	function count(type)  {
		//<!--결과를 표시할 element
		const resultElement = document.getElementById('result');
		
		//<!--현재 화면에 표시된 값
		let number = resultElement.innerText;
		
		//<!--더하기/빼기
		if(type === 'plus') {
		  number = parseInt(number) + 1;
		}else if(type === 'minus')  {
		  number = parseInt(number) - 1;
		}

		//<!--결과 출력
		resultElement.innerText = number;
	  }
	</script>
	-->
	
	<!-- 수정/삭제 버튼 -->
	<script>
	$(document).ready(function(){
        $("#btnDelete").click(function(){
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = "${pageContext.request.contextPath}/boardController/delete?boardId=${dto.boardId}";
                document.form1.submit();
            }
        });
            $("#btnUpdate").click(function(){
            	console.log('hi');
                 location.href="${pageContext.request.contextPath}/boardController/modify?boardId=${dto.boardId}";
                
            });
	  });
</script>

	<!-- 댓글 -->
	<script>
	 $(document).ready(function(){
	        
	        //listReply(); // **댓글 목록 불러오기
	        listReply2(); // ** json 리턴방식
	        
	        // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
	        $("#btnReply").click(function(){
	            var replytext=$("#replytext").val();
	            var bno="${dto.boardId}"
	            var param="replytext="+replytext+"&bno="+bno;
	            $.ajax({                
	                type: "post",
	                url: "${path}/reply/insert.do",
	                data: param,
	                success: function(){
	                    alert("댓글이 등록되었습니다.");
	                    listReply2();
	                }
	            });
	        });
	        
	     // Controller방식
	        // **댓글 목록1
	        function listReply(){
	            $.ajax({
	                type: "get",
	                url: "${path}/reply/list.do?bno=${Poster.bno}",
	                success: function(result){
	                // responseText가 result에 저장됨.
	                    $("#listReply").html(result);
	                }
	            });
	        }
	        // RestController방식 (Json)
	        // **댓글 목록2 (json)
	        function listReply2(){
	            $.ajax({
	                type: "get",
	                //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
	                url: "${path}/reply/listJson.do?bno=${dto.boardId}",
	                success: function(result){
	                    console.log(result);
	                    var output = "<table>";
	                    for(var i in result){
	                        output += "<tr>";
	                        output += "<td>"+result[i].userName;
	                        output += "("+changeDate(result[i].regdate)+")<br>";
	                        output += result[i].replytext+"</td>";
	                        output += "<tr>";
	                    }
	                    output += "</table>";
	                    $("#listReply").html(output);
	                }
	            });
	        }
	        // **날짜 변환 함수 작성
	        function changeDate(date){
	            date = new Date(parseInt(date));
	            year = date.getFullYear();
	            month = date.getMonth();
	            day = date.getDate();
	            hour = date.getHours();
	            minute = date.getMinutes();
	            second = date.getSeconds();
	            strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	            return strDate;
	        }
	 });
	</script>
	
	<!-- 좋아요 클릭 이벤트 처리 -->
	<script>
	$(document).ready(function() { //start jQuery
		
		$('#like-btn').click(function() {
			console.log('좋아요 버튼 눌림!');
			const view_user_id = $('#view-user').val();
			
			if($('#view-user').val() == '') { //로그인 안한 사람이 하트 누르면
				alert('로그인을 먼저 진행해주세요 :)');
			} else {
				like_update();
			}
			
		});
		
		function like_update() {
			const view_user_id = $('#view-user').val();
			const postLike = ${postLike};
			console.log(view_user_id);
			console.log(postLike);
			const data = {
				"viewUserId" : view_user_id,
				"boardId" : ${dto.boardId},
				"postLike" : postLike,	//너는 왜 값 전달이 안되는거니 ㅠ	
			};
			
			$.ajax({
				type : 'PUT',
				url : '<c:url value="/likeUpdate" />',
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(result) {
					console.log('좋아요 수정' + result);
					if(postLike == 1) {
						console.log('좋아요 취소');
						$('#like-check').val(0);
						location.reload();
						
					} else if(postLike == 0) {
						console.log('좋아요');
						$('#like-check').val(1);
						location.reload();
					}
				}, error : function(result) {
					console.log('좋아요 에러: ' + result);
				}
			}); //ajax 끝
			
				
			
		}
	
	}); //end jQuery
		
	</script>
	<!-- 좋아요 클릭 이벤트 처리 끝 -->
	
	
	<!-- 글 상세보기 페이지 끝 -->
</body>

</html>


















