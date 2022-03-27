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
					
				
	
					
					
					
			  
                
          
                
                
                
            
					



<h3 id=recnt>${dto.recnt }개의 댓글</h3>

  <c:if test="${not empty loginSession.nickname}">
                <div class="row reply_write">
                    <div class="col-1">
                        <a href="#">
                            <img id="write_reply_profileImage" style=" border-radius: 70%;
    overflow: hidden;" width="40rem" src="<c:url value='../img/pome3.jpg'/>"/>
                        </a>
                    </div>
                    <div class="col-11" class="input_reply_div">
                        <input class="w-100 form-control" id="input_reply${dto.boardId}"
                            type="text" placeholder="댓글입력...">
                    </div>
                    </div>
                    <div class="row reply_write">
                    
                    <div class="offset-10 col-2 my-md-3">
                        <button type="button" userNo="${loginSession.userNo}" writer="${loginSession.nickname}" bno="${dto.boardId}" style="background-color: #B4CFB0; border-color: #B4CFB0; font-weight: bold;" idx="${dto.boardId}"
                            class="btn btn-success mb-1 write_reply">댓글&nbsp;작성</button>
                    </div>
                    </div>
               
            </c:if> 
            
            
             <button onclick='ReplyList("${dto.boardId}")' type="button" class="btn btn-success position-relative"
					style="margin-top:0rem; background-color:#B4CFB0; border-color: #B4CFB0; font-weight: bold;" >
					댓글&nbsp;보기</button>

<div class="" id="replyBox" style="display: none;">
    <section class="modal-section" style="margin: 1rem 0 0 0">
    
        <div class="card card-body">
            <!-- 댓글 목록 -->
            <div class="reply-list reply-list${dto.boardId}">
                <!-- 댓글이 목록이 들어가는 곳 -->
                댓글목록
            </div>
            <!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
            
        </div>
    </section>
</div>
               
             
                
                
      
                
                
<!-- 댓글  -->








					
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
	
	
	
<span id="nickname">${loginSession.nickname}</span>	
	<span id="userNo">${loginSession.userNo}</span>	
	

<!-- 댓글  -->




	<%@include file="../include/footer.jsp"%>

	<script>
	
	
	
	
	var loginWriter = "${loginSession.nickname}";
	var loginUserNo = "${loginSession.userNo}";

	//var loginUserNo = $('#userNo').text();
	console.log(loginWriter);
	console.log(loginUserNo);
	
	// [댓글]
	// 게시물의 댓글 목록을 불러오는 함수입니다.
	const ReplyList = function(bno) {
	    $.ajax({
	        url : '/codelog/reply/replyList',
	        type : 'get',
	        contentType : 'application/json',
			dataType : 'json',
	        data : {
	        	"bno" : bno
	        },
	        success : function(data) {
	        	 alert('성공');
	        	 
	        	 // 댓글 목록을 html로 담기
	             let listHtml = "";
	             for(const i in data){
	                 let no = data[i].no;
	                 let bno = data[i].bno;
	                 let grp = data[i].grp;
	                 let grps = data[i].grps;
	                 let grpl = data[i].grpl;
	                 let writer = data[i].writer;
	                 let content = data[i].content;
	                 let wdate = data[i].wdate;
	                 var date1 = new Date(wdate);
	                 wdate = formatDate(date1);  	                 
	                
	                 
	                 listHtml += "<div class='row replyrow reply" + no + "'>";
	                 if(grpl == 0){	// 모댓글일때
	                        listHtml += "	<div class='col-1'>";
	                        listHtml += "		<a href='#'> ";
	                        listHtml += "			<img class='reply_list_profileImage' style='border-radius: 70%; overflow: hidden; margin-top:1rem;' width='40rem' src='../img/kmj2.jpg'/>";
	                        listHtml += "		</a> ";
	                        listHtml += "	</div>";
	                        listHtml += "	<div class='reply-content"+ no +" col-8'>";
	                        listHtml += "		<div>";
	                        listHtml += "			<span>";
	                        listHtml += "				<b>"+ writer +"</b>";
	                        listHtml += "			</span>";
	                        listHtml += "			<input type='text' style='margin:0.2rem 0 0.5rem 0;' class='w-100 form-control reply_content"+ no +"' value='"+content+"' readonly>";
	                        listHtml += "			</input>";
	                        listHtml += "		</div>";
	                        // 현재 로그인 상태일때 답글작성 버튼이 나온다.
	                        if("${loginSession.nickname}" != ""){
	                            listHtml += "		<div>";
	                            // 함수에 게시글번호(bno), 모댓글번호(no), 모댓글 작성자(writer)를 인자로 담아서 넘긴다.
	                            // 이때 모댓글 작성자 writer는 string인데 string을 인자에 넣기 위해선''나""로 감싸줘야한다.
	                            // 여기선 ''와 ""가 이미 둘다 쓰이고 있는데  href를 감싸고 있는 ''와 겹치지 않는 ""를 \" 처리해서 넣어줬다.
	                            listHtml += "			<a href='#' style='font-weight:bold;' bno='"+ bno +"' grp='"+ grp +"' class='write_reply_start' data-bs-toggle='collapse' data-bs-target='#re_reply"+ grp +"' aria-expanded='false' aria-controls='collapseExample'><i class='fa-regular fa-square-plus'></i>&nbsp;답글&nbsp;달기</a>";
	                            listHtml += "		</div>";
	                        }
	                        listHtml += "	</div>";

	                    }else{	// 답글일때
	                        listHtml += "	<div class='col-1'>"
	                        listHtml += "	</div>"
	                        listHtml += "	<div class='col-1'>";
	                        listHtml += "		<img class='reply_list_profileImage' style='border-radius: 70%; overflow: hidden; margin-top:1rem;' width='40rem' src='../img/pome3.jpg'/>";
	                        listHtml += "	</div>";
	                        listHtml += "	<div class='rereply-content"+ no +" col-7'>";
	                        listHtml += "		<div>";
	                        listHtml += "			<span>";
	                        listHtml += "				<b>"+ writer +"</b>";
	                        listHtml += "			</span>";
	                        listHtml += "			<input type='text' style='margin:0.2rem 0 0.5rem 0;' class='w-100 form-control reply_content"+ no +"' value='"+content+"' readonly>";
	                        listHtml += "			</input>";
	                        listHtml += "		</div>";

	                        listHtml += "	</div>";
	                    }
	                 
	                 	listHtml += "	<div class='col-3 reply-right'>";
	                    listHtml += "		<div";
	                    	if("${loginSession.nickname}" != writer){
	                    		
	    	            listHtml += " style='margin-top:2rem; '";
		
	                    	};
	                    
	                    listHtml += ">";
	                    if(content != "삭제된 댓글입니다."){
	                    listHtml += 			wdate;
	                    }
	                    listHtml += "		</div>";
	                    // 책갈피
	                    // 현재 로그인 상태이고..
	                    if("${loginSession.nickname}" != ""){

	                        //현재 사용자가 이 댓글의 작성자일때 삭제 버튼이 나온다.
	                        if("${loginSession.nickname}" == writer && content != "삭제된 댓글입니다."){
	                            listHtml += "		<div>";
	                            // 수정할 댓글의 no를 grpl과 함께 넘긴다. 
	                            // 모댓글 수정칸과 답글 수정칸을 화면에 다르게 나타내야하기 때문에 모댓글과 답글을 구분하는 grpl을 함께 넘겨주어야한다.
	                            //listHtml += "			<a href='javascript:' no='"+ no +"' grpl='"+ grpl +"' class='reply_modify'>수정</a>";
	                            //listHtml += "			&nbsp;|&nbsp;";
	                            // 삭제는 no만 넘겨주면 된다.
	                            listHtml += "			<button type='button' style='background-color: #B4CFB0; border-color: #B4CFB0; font-weight: bold;' onclick='javascript:' no='"+ no +"' grpl='"+ grpl + "' bno='"+ bno +"' grp='"+ grp +"' class='btn btn-success reply_modify'>수정</button>";


	                            listHtml += "			<button type='button' style='background-color: #B4CFB0; border-color: #B4CFB0; font-weight: bold;' onclick='javascript:' no='"+ no +"' grpl='"+ grpl + "' bno='"+ bno +"' grp='"+ grp +"' class='btn btn-success reply_delete'>삭제</button>";
	                            listHtml += "		</div>";
	                        }
	                        
    
	                    }
	                    
	                    
	                    
	                    listHtml += "	</div>";
	                    // 댓글에 답글달기를 누르면 답글입력란이 나온다.
	                    // ---- 답글입력란
	                    listHtml += "	<div class='collapse row rereply_write' style='margin-bottom:3rem;'  id='re_reply"+ no +"'>";
	                    listHtml += "		<div class='col-1'>"
	                    listHtml += "		</div>"
	                    listHtml += "		<div class='col-1'>"
	                    listHtml += "			<a href='#'> ";
	                    listHtml += "				<img id='write_reply_profileImage' style='border-radius: 70%; overflow: hidden; margin-top:1rem;' width='40rem' src='../img/pome3.jpg'//>"
	                    listHtml += "			</a> ";
	                    listHtml += "		</div>"
	                    listHtml += "		<div class='col-7'>"
	                    listHtml += "			<span>";
                        listHtml += "				<b>"+ loginWriter +"</b>";
                        listHtml += "			</span>";
	                    listHtml +=  "  		<input class='w-100 input_rereply_div form-control' style='margin:0.2rem 0 0.5rem 0;' id='input_rereply"+ grp +"' type='text' placeholder='댓글입력...'>"
	                    listHtml += "		</div>"
	                    listHtml += "		<div class='col-3'>"
	                    // 답글달기 버튼이 눌리면 모댓글 번호(no)와 게시물번호(bno)를 함수에 전달한다.

	                    // 동적으로 넣은 html태그에서 발생하는 이벤트는 동적으로 처리해줘야한다 !!!!!
	                    // 예를들어, 동적으로 넣은 html태그에서 발생하는 click 이벤트는 html태그 안에서 onclick으로 처리하면 안되고, jquery에서 클래스명이나 id값으로 받아서 처리하도록 해야한다.
	                    // 아래코드를 보자~~~~
	                    // listHtml += "			<button onclick='javascript:WriteReReply("+ no +","+ bno +")' type='button' class='btn btn-success mb-1 write_rereply' >답글&nbsp;달기</button>"
	                    // 위 코드는 클릭되어도 값이 넘겨지지 않는다. 값이 undefined가 된다.
	                    // 아래코드처럼 짜야한다. click이벤트를 처리하지 않고 데이터(no, bno)만 속성으로 넘겨주도록 작성한다.
	                    listHtml += "			<button type='button' style='background-color: #B4CFB0; border-color: #B4CFB0; font-weight: bold; margin-top:1.5rem;'  class='btn btn-success mb-1 write_rereply' grp='" + grp + "' bno='" + bno + "'>답글&nbsp;달기</button>"
	                    listHtml += "		</div>";
	                    listHtml += "	</div>";
	                    // ---- 답글입력란 끝
	                    
	                    
	                       
	                    
	             
	             listHtml += "</div>";
	        
	                    
	    		 $('#replyBox').css('display','block');
    
	                 
	             }; ///////////// 동적으로 넣어준 html에 대한 이벤트 처리는 같은 함수내에서 다 해줘야한다.
	             ///////////// $(document).ready(function(){}); 안에 써주면 안된다.

	             // 댓글 리스트 부분에 받아온 댓글 리스트를 넣기
	             
	             $(".reply-list"+bno).html(listHtml);

	             
	             
	             // 답글에서 답글달기를 누르면 input란에 "@답글작성자"가 들어간다.
	             //$('.write_re_reply_start').on('click', function(){
	             //	$('#input_rereply'+ $(this).attr('no')).val("@"+$(this).attr('writer')+" ");
	             //});
	             //답글을 작성한 후 답글달기 버튼을 눌렀을 때 그 click event를 아래처럼 jquery로 처리한다.
	             $('.write_reply_start').on( 'click', function() {
	            	 console.log("대댓글 작성 클릭")
	                 console.log( 'bno', $(this).attr('bno') );
	            	 console.log( 'grp', $(this).attr('grp') );
	            	 console.log("#input_rereply" + $(this).attr('grp'));
	            	 $("#input_rereply" + $(this).attr('grp')).focus();
	                 // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
	             });

$('.write_rereply').on( 'click', function() {
	 console.log("대댓글 작성 완료");
   
    // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
    WriteReReply($(this).attr('bno'), $(this).attr('grp'));
});
	             // 삭제버튼을 클릭했을 때
	             $('.reply_delete').on('click', function(){
	                 // 모댓글 삭제일때
	                 		    	console.log($(this).attr('no'), $(this).attr('bno'));

	                     DeleteReReply($(this).attr('no'), $(this).attr('bno'));
	                 

	             });
	             
	          
                 
                 
	             
	             $('.reply_modify').on( 'click', function() {
	         		console.log("수정 클릭")
	         	    console.log( 'no', $(this).attr('no') );
	         		
	         	//	$(this).text('수정완료');
	         		$(this).css('display','none');
	         		
	         		let modiHtml = ""
                      // 수정할 댓글의 no를 grpl과 함께 넘긴다. 
                      // 모댓글 수정칸과 답글 수정칸을 화면에 다르게 나타내야하기 때문에 모댓글과 답글을 구분하는 grpl을 함께 넘겨주어야한다.
                      //listHtml += "			<a href='javascript:' no='"+ no +"' grpl='"+ grpl +"' class='reply_modify'>수정</a>";
                      //listHtml += "			&nbsp;|&nbsp;";
                      // 삭제는 no만 넘겨주면 된다.
                      modiHtml += "			<button type='button' style='background-color: #B4CFB0; border-color: #B4CFB0; font-weight: bold;' onclick='javascript:' no='"+ $(this).attr('no') +"' class='btn btn-success reply_comModify'>완료</button>";


                      modiHtml += "			<button type='button' style='background-color: #B4CFB0; border-color: #B4CFB0; font-weight: bold;' onclick='javascript:' no='"+ $(this).attr('no') +"' class='btn btn-success reply_conModify'>취소</button>";
                      
	         		$(this).closest('div').html(modiHtml);

	         	//	$(this).siblings().text('취소');
	         	//	$(this).siblings().attr('class','reply_conModify');
	         		ModifyReply($(this).attr('no'), $(this).attr('bno') );
		
	         	    // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
	         	    
	         	});
	             
	             
	     
	         	

	            
	         },
	        error : function() {
	            alert('서버 에러');
	        }
	    });
	};
	
	
	$('.write_rereply').on( 'click', function() {
		console.log("대댓글2 작성 클릭")
	    console.log( 'bno', $(this).attr('bno') );
		console.log( 'grp', $(this).attr('grp') );
	    // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
	    WriteReReply($(this).attr('bno'), $(this).attr('grp'));
	});

	// 삭제버튼을 클릭했을 때
	$('.reply_delete').on('click', function(){
	    // 모댓글 삭제일때
	    	console.log($(this).attr('no'), $(this).attr('bno'));
	        DeleteReReply($(this).attr('no'), $(this).attr('bno'));
	    

	});
	
	$('.write_reply').on( 'click', function() {
		console.log("댓글 작성 클릭")
	    console.log( 'bno', $(this).attr('bno') );

	    // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
	    WriteReply($(this).attr('bno'));
	});
	
	
	
	
	
	
	
	const WriteReply = function(bno) {
		console.log("댓글작성 함수 시작")
	    console.log(bno);

	    console.log("댓글내용"+$("#input_reply" + bno).val());

	    // 댓글 입력란의 내용을 가져온다. 
	    let content = $("#input_reply" + bno).val();

	    let writer = $(".write_reply").attr('writer');
	    let userNo = $(".write_reply").attr('userNo');
	    
	    console.log("글작성자"+writer);
	    if(content == ""){	// 입력된게 없을때
	        alert("댓글을 입력하세요!");
	    }else{	
	        // 입력란 비우기
	        $("#input_reply" + bno).val("");

	        const info = {
                "bno" : bno,
                "content": content,
                "writer" : writer,
                "userNo" :userNo
            };
	        // reply+1 하고 그 값을 가져옴
	        $.ajax({
	            url : '/codelog/reply/replyWrite',
	            type : 'post',
	            contentType : 'application/json',
				dataType : 'text',
	            data : JSON.stringify(info),
	            success : function(pto) {

	              
	                console.log("댓글 작성 성공");
	               	console.log(pto);
	               	$('#recnt').text(pto+"개의 댓글");


	                // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
	                ReplyList(bno);
	            },
	            error : function() {
	                alert('서버 에러');
	            }
	        });

	    };
	};
	
	
	const WriteReReply = function(bno,grp) {
		 console.log('WriteReReply함수 진입');
	    console.log(bno);
	    console.log(grp);

	   // console.log($("#input_rereply" + no).val());

	   // let content = $("#input_rereply" + grp).val();
	    	    
	    let writer = loginWriter;
	    let userNo = loginUserNo;
	    let content = $("#input_rereply" + grp).val();


	    
	    let grps = $(".write_rereply").attr('grps');
	    
	    
		console.log(content);
		console.log(userNo);
		console.log(writer);

	   // content = content.trim();

	        const info = {
                "bno" : bno,
                "grp" :grp,
                "content": content,
                "writer" : writer,
                "userNo" :userNo
            };
		console.log("대댓글 여기까지 실행")
	    if(content == ""){	// 입력된게 없을때
	        alert("글을 입력하세요!");
	    }else{	
	        // 입력란 비우기
	        $("#input_rereply" + grp).val("");

	        // reply+1 하고 그 값을 가져옴
	        $.ajax({
	        	url : '/codelog/reply/rereplyWrite',
	            type : 'post',
	            contentType : 'application/json',
				dataType : 'text',
	            data : JSON.stringify(info),
	            success : function(pto) {

	              
	                console.log("대댓글 작성 성공");
	             	console.log(pto);
	               	$('#recnt').text(pto+"개의 댓글");
	                // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
	                ReplyList(bno);
	            },
	            error : function() {
	                alert('서버 에러');
	            }
	        });

	    };
	};
	
	
	
	const ModifyReply = function(no, bno) {
		 console.log('ModifyReply 함수 진입');
	    console.log(no);

	   $(".reply_content" + no).attr("readonly",false);
	   $(".reply_content" + no).focus();
	  
	   
	   console.log("사라졌니?");
	   
	
	   
       // 댓글 수정완료버튼
       $('.reply_comModify').on('click', function(){
           
           		    	console.log($(this).attr('no'));

           		    	ComModifyReply(no, bno);
           

       });
       
       
       
       //댓글 수정 취소버튼
       
       $('.reply_conModify').on('click', function(){
    	   ReplyList(bno);
           

       });


       
       
       

	   // let content = $("#input_rereply" + grp).val();
	    	/*    
	    let writer = loginWriter;
	    let userNo = loginUserNo;
	    let content = $("#input_rereply" + grp).val();


	    
	    let grps = $(".write_rereply").attr('grps');
	    
	    
		console.log(content);
		console.log(userNo);
		console.log(writer);

	   // content = content.trim();

	        const info = {
               "bno" : bno,
               "grp" :grp,
               "content": content,
               "writer" : writer,
               "userNo" :userNo
           };
		console.log("대댓글 여기까지 실행")
	    if(content == ""){	// 입력된게 없을때
	        alert("글을 입력하세요!");
	    }else{	
	        // 입력란 비우기
	        $("#input_rereply" + grp).val("");

	        // reply+1 하고 그 값을 가져옴
	        $.ajax({
	        	url : '/codelog/reply/rereplyWrite',
	            type : 'post',
	            contentType : 'application/json',
				dataType : 'text',
	            data : JSON.stringify(info),
	            success : function(pto) {

	              
	                console.log("대댓글 작성 성공");
	             	console.log(pto);
	               	$('#recnt').text(pto+"개의 댓글");
	                // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
	                ReplyList(bno);
	            },
	            error : function() {
	                alert('서버 에러');
	            }
	        });

	    };
	    */
	};
	
	
	

	const ComModifyReply = function(no, bno) {
		 console.log('ComModifyReply 함수 진입');
	    console.log(no);
	    console.log(bno);

	   // console.log($("#input_rereply" + no).val());

	   // let content = $("#input_rereply" + grp).val();
	    	    
	 
	    let content = $(".reply_content" + no).val();

	    
	    
		console.log(content);
	

	   // content = content.trim();

	        const info = {
                "no" : no,
                "content": content,
            };
		console.log("댓글수정 여기까지 실행")
	    if(content == ""){	// 입력된게 없을때
	        alert("글을 입력하세요!");
	    }else{	
	      
	        $.ajax({
	        	url : '/codelog/reply/replyModify',
	            type : 'post',
	            contentType : 'application/json',
				dataType : 'text',
	            data : JSON.stringify(info),
	            success : function() {

	              
	                console.log("댓글 수정 성공");
	          
	                ReplyList(bno);
	            },
	            error : function() {
	                alert('서버 에러');
	            }
	        });

	    };
	};
	
	
	
	
	// 모댓글 삭제일때
	const DeleteReply = function(no, bno){
	    // grp이 no인 댓글이 있는 경우 content에 null을 넣고 없으면 삭제한다.
	    console.log("no는 "+no+"bno는 "+bno);
	     const info = {
                "bno" : bno,
                "no": no
            };
	    
	    $.ajax({
	        url : '/codelog/reply/deleteReply',
	        type : 'post',
            contentType : 'application/json',
			dataType : 'text',
            data : JSON.stringify(info),
	        success : function(pto) {

	          
	            console.log("모댓글 삭제 성공");
	            console.log(pto);
               	$('#recnt').text(pto+"개의 댓글");

	            // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
	            ReplyList(bno);
	        },
	        error : function() {
	            alert('서버 에러');
	        }
	    });
	};

	// 답글 삭제일때
	const DeleteReReply = function(no, bno){
	    console.log("no는 "+no+"bno는 "+bno);

	    //console.log("grp : " + grp);

	     const info = {
                "bno" : bno,
                "no": no
            };
	     
	    // 답글을 삭제한다.
	    $.ajax({
	        url : '/codelog/reply/deleteReReply',
	        type : 'post',
            contentType : 'application/json',
			dataType : 'text',
            data : JSON.stringify(info),
	        success : function(pto) {

	           
	            console.log("대댓글 삭제 성공");
	            console.log(pto);
               	$('#recnt').text(pto+"개의 댓글");

	            // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
	            ReplyList(bno);
	        },
	        error : function() {
	            alert('서버 에러');
	        }
	    });

	};
	
	function formatDate(date) {
	    
	    var d = new Date(date),
	    
	    month = '' + (d.getMonth() + 1) , 
	    day = '' + d.getDate(), 
	    year = d.getFullYear();
	    hour = d.getHours();
        minute = d.getMinutes();
	    
	    if (month.length < 2) month = '0' + month; 
	    if (day.length < 2) day = '0' + day; 
	    
	    let y = [year, month, day].join('-');
	    let m = [hour, minute].join(':')
	    return y+" "+m;
	    
	    };

	
	
	
	
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