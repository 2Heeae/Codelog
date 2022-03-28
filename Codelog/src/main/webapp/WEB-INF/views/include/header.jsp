<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- jQuery -->
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   
<!-- bootstrap css -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <!-- bootstrap icon -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
   <!-- fontawesome -->
   <script src="https://kit.fontawesome.com/7b2a04da3a.js" crossorigin="anonymous"></script>
   <style type="text/css">
      @import url("<c:url value='/css/header.css'/>");
   </style>

   <title>Document</title>
</head>

<body style="margin-top: 1rem; font-family: ONE-Mobile-Regular;">
   <div class="container">
      <div class="row px-md-4">
         <!--로고 부분-->
         <div class="col-md-2 px-md-0 my-md-0 pb-md-4">
            <button id="logo-btn">
            <span class="logo">CodeLog
            </span>
            </button>
            <c:choose>
	            <c:when test="${not empty userInfo.nickname}">
	            	<span class="logo" style="font-size: 25px;">/</span> 
	            	<button id="nick-logo-btn">
	            		<span class="logo nick-logo">
	            		 ${userInfo.nickname}
	            		</span>
	            	</button>
	            </c:when>
	            <c:when test="${not empty dto.writer}">
	            	<span class="logo" style="font-size: 25px;">/</span> 
	            	<button id="nick-logo-btn">
	            		<span class="logo dto-logo">
	            		 ${dto.writer}
	            		</span>
	            	</button>
	            </c:when>
            </c:choose>
            <!--<span style="font-size: 2rem; color: rgba(241, 31, 129, 0.897);">log</span>
            <i class="fa-solid fa-heart" style="color: red;"></i>
            <span style="font-size: 1.7rem; color: rgb(241, 31, 129);">g</span>-->
         </div>

		<!-- 검색 창 -->
        <div class="col-md-3 offset-1" style="padding-top:15px;">
            <form action="<c:url value='/search' />" class="form-inline my-2 my-lg-0 input-group">
               <input class="form-control mr-sm-2" name="keyword" type="search" value="${keyword}" placeholder="Search" aria-label="Search" onfocus="this.value='';">
               <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit" style="background-color: rgb(148, 180, 159); border-color:rgb(148, 180, 159);"><i class="bi bi-search" style="color:white;"></i></button>
             </form>
         <div class="" id="toast_area" style="z-index: 1000;"></div>
         </div>
         

            <!--해,알림,검색,글작성,메뉴토글 바-->
         <div class="col-md-3 offset-2 p-0">
            <!--해(다크모드)-->
            <button type="button" id="theme-btn" class="btn c rounded-circle my-md-3 mx-md-1 px-md-2 hc" >
            	<i class="fa-regular fa-sun ic" id="theme-icon"></i>
            </button>
            <!--알림,알림 목록 토글-->  
            <c:if test="${loginSession != null}">    
            <button type="button" class="btn rounded-circle position-relative c mx-md-1 my-md-3 px-md-3 hc" style=""
               data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
               aria-controls="collapseExample">
            <!--알림 아이콘, 알림개수-->
               <i class="fa-regular fa-bell ic"></i>
               <span class="position-absolute top-0 translate-middle badge rounded-pill bg-danger" style="left: 2.8rem;">
                  2+
                  <span class="visually-hidden">unread messages</span>
               </span>
            <!--알림,알림 목록 토글-(위에 거랑 세트)-->   
               <div class="collapse" id="collapseExample"
                  style="position: absolute; width: 20rem; top:2.7rem; right: 0rem; z-index: 1000;">
                  <div class="card" style="width: 100%;">

                     <!--알림 목록 내용-->
                     <div class="card-body cc" style=" height: 6rem; " id="so">
                        <div class="row">
                           <div class="col-md-3">
                              <img width="50rem" src="<c:url value='/img/cat2.jpg'/>" class="card-img-right rounded-circle"
                                 alt=".">
                           </div>
                           <div class="col-md-9" style=" text-align: left;">
                              <span class="card-text"><strong>홍길동abcd</strong>님이 좋아요를 눌렀습니다.</span>


                              <p class="pt-1" style="font-size: 0.8rem;">3시간 전.</p>

                           </div>
                        </div>
                     </div>

                     <div class="card-body cc" style=" height: 6rem; ">
                        <div class="row">
                           <div class="col-md-3">
                              <img width="50rem" src="<c:url value='/img/pome3.jpg'/>" class="card-img-right rounded-circle"
                                 alt=".">
                           </div>
                           <div class="col-md-9" style=" text-align: left;">
                              <span id="msgStack" class="card-text"></span>

                              <p class="pt-1" style="font-size: 0.8rem; margin: auto 0;">19시간 전.</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </button>
            </c:if>

            

            <!-- 로그인 안했을 때 보여주기 -->
            <c:if test="${loginSession == null}">
            <!-- 로그인 버튼 누르면 모달창 열림-->
                <button style="background-color: rgb(148, 180, 159); border-color: rgb(148, 180, 159);"type="button" class="btn btn-primary mx-md-4 px-md-2 hclogin" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
            </c:if>
            <!-- 로그인 안했을 때 보여주기 끝 -->
            <!-- 로그인하면 보여주기 -->
            <c:if test="${loginSession != null}">            
            <!--메뉴, 메뉴 토글-->      
            <div style="display: inline; float: right;">
               <button type="button" class="btn c rounded-circle px-md-0 my-md-2 pb-md-4 pt-md-0 position-relative"
                   data-bs-toggle="collapse" style="background-color:transparent; border-color: transparent;"
                  href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2">
                  <!--메뉴 이미지+화살표 아래 아이콘-->
                  <!-- 프로필 이미지 -->
                  <c:choose>
                     <c:when test="${loginSession.userImg eq null || loginSession.userImg eq 'null'}">
                        <img width="50rem" id="small-profile-img" src="<c:url value='/img/user_icon.png'/>" class="card-img-right rounded-circle mx-md-1"
                           alt="."><i class="fa-solid fa-caret-down"></i>
                     </c:when>
                     <c:otherwise>
                           <img width="50rem" id="small-profile-img" src="<c:url value='/user/display'/>" class="card-img-right rounded-circle mx-md-1"
                           alt="."><i class="fa-solid fa-caret-down"></i>
                     </c:otherwise>
                  </c:choose>
            <!--메뉴, 메뉴 토글(위에꺼랑 세트)-->   
                  <div class="collapse" id="collapseExample2"
                     style="position: absolute; top:3.8rem; left: -3.6rem; z-index: 1000;">
               <!--메뉴 토글 내용-->      
                     <div class="card" style="width: 8rem;">

                        <div class="card-body cc" id="mycodelog">
                           <div style="text-align: right;">
                              <span class="card-text"><strong>내 코드로그</strong></span>
                           </div>
                        </div>

                        <div class="card-body cc" id="edit-profile">
                           <div style="text-align: right;">
                              <span class="card-text"><strong>프로필 수정</strong></span>
                           </div>
                        </div>

                        <div class="card-body cc" id="logout">
                           <div style="text-align: right;">
                              <span class="card-text"><strong>로그아웃</strong></span>
                           </div>
                        </div>   
                     </div>   
                  </div>   
               </button>
            </div>
            </c:if>
            <!-- 로그인하면 보여주기 -->
            <c:if test="${loginSession != null}">
            <!--글 작성-->

            <button type="button" class="btn btn-light rounded-circle my-md-3 px-md-1 bc" onclick="location='/codelog/boardController/getWrite'">새 글 작성</button>
            </c:if>
            <!-- 로그인하면 보여주기 끝 -->
         </div>
      </div>
   </div>   
   <!-- Button trigger modal -->

   <%@ include file="../user/login-modal.jsp" %>

   <!-- bootstrap js -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
   </script>
   <!-- sockJS -->
   <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
   
   <script>
	// 전역변수 설정
	var socket = null;
	$(document).ready(function(){
	    	// 웹소켓 연결
		    sock = new SockJS('<c:url value="/websocket"/>');
		   	socket = sock;
			console.log('소켓연결!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
			
		    // 데이터를 전달 받았을때 
		    socket.onmessage = onMessage; // toast 생성
	    
	});

	// toast생성 및 추가
	function onMessage(evt){
	    var data = evt.data;
	   	console.log(data);
	 	// toast
	    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
	    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
	    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
	    toast += "<span aria-hidden='true'>&times;</span></button>";
	    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
	    //let toast = data;
	    $("#toast_area").append(toast);   // msgStack toast 추가
	    $(".toast").toast({"animation": true, "autohide": true});
	    $('.toast').toast('show');
	};	
   
      //자바스크립트 시작
      //다크모드 토글 이벤트 처리
      const theme_btn = document.querySelector('#theme-btn');
      
      const current_theme = localStorage.getItem('theme');
      if(current_theme === 'dark') {
         document.body.classList.add("dark-theme");
      }
      
      theme_btn.addEventListener("click", function() {
         document.body.classList.toggle('dark-theme');
         
         let theme = 'light';
         if(document.body.classList.contains('dark-theme')) {
            theme = 'dark';
         }
         localStorage.setItem('theme', theme);
      }); //다크모드 토글 이벤트 처리 끝
      //자바스크립트 끝
      
      //start jQuery
         /*메뉴바들 링크 기능(임시)*/
         $(document).ready(function() {
        	 
        	$('#theme-icon').click(function() {
				if($('#theme-icon').attr('class') == 'fa-regular fa-sun ic') {
					$('#theme-icon').attr('class', 'bi bi-moon-fill');
				} else {
					$('#theme-icon').attr('class', 'fa-regular fa-sun ic');
				}
			});
        	 
            $("#so").click(function() {
               $(location).attr("href", "https://www.naver.com/")
            });               
            
            $("#so4").click(function() {
               $(location).attr("href", "https://www.naver.com/")
            });
            
            //새 글 작성 버튼 클릭 시 글쓰기페이지 이동 이벤트 처리
            //$('#write-btn').click(function() {
            	//location.href = "<c:url value='/write' />";				
			//}); //새 글 작성 버튼 클릭 시 글쓰기페이지 이동 이벤트 처리 끝
            
            //로고버튼 클릭 시 메인페이지 이동 이벤트 처리
            $('#logo-btn').click(function() {
               location.href = "<c:url value='/' />";
            }); //로고버튼 클릭 이벤트 끝

            /*화면 클릭시 알람,프로필 토글 숨김*/
            var LayerPopup = $("#collapseExample");
            var LayerPopup2 = $("#collapseExample2");

            $(document).click(function(e) {
               if (LayerPopup.hasClass("show")) {
                  LayerPopup.removeClass("show");
               }

               if (LayerPopup2.has(e.target).length === 0) {
                  LayerPopup2.removeClass("show");
               }
            });
            
            //내 코드로그(마이페이지) 클릭 이벤트 처리
            $('#mycodelog').click(function() {
               location.href = "<c:url value='/user/mypage' />";
            }); //내 코드로그 이벤트 끝
            
            //프로필 수정 클릭 이벤트 처리
            $('#edit-profile').click(function() {
               location.href = "<c:url value='/user/editUser' />";
            }); //프로필 수정 클릭 이벤트 끝
            
            //로그아웃 클릭 이벤트 처리
            $('#logout').click(function() {
               const result = confirm('정말 로그아웃 하시겠어요?');
               
               if(result) {
                  location.href = "<c:url value='/user/logout' />";
               } else {
                  
               }
            }); //로그아웃 이벤트 끝
			
            //헤더 닉네임 누를 시 페이지 이동 이벤트 처리 
            $('.nick-logo').click(function() {
            	
            	location.href= "<c:url value='/user/userpage/${userInfo.userId}'/>";
            });
			$('.dto-logo').click(function() {
            	
            	location.href= "<c:url value='/user/userpage/${dto.userId}'/>";
            });	
            
     }); //end jQuery     
         
         
   </script>


</body>

</html>