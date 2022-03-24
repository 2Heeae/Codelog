<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>


<style>

/* ========== lec-detail ========== */
.detail-info {
	margin-bottom: 120px;
}
.detail-info .detail-title {
	font-size: 24px;
}
.detail-info .detail-price {
	font-size: 30px;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}

.detail-star{
	color: orange;
	font-size: xx-large;
}

.detail-info .detail-delivery {
	color: #888;
}

.detail-control .left {
	float: left;
}
.detail-control .right {
	float: right;
}
.detail-control .detail-total-price .total-left {
	font-size: 18px;
	line-height: 45px;
}
.detail-control .detail-total-price .total-right {
	font-size: 30px;
}

.detail-control .detail-order .left,
.detail-control .detail-order .right {
	width: 50%;
	height: 60px;
	font-size: 18px;
}

/* ========== content ==========*/
.detail-reply .detail-content-wrap {
	margin: 0 auto;
	float: none;
}

.detail-content-wrap #content {
	resize: none;
}


/* ========== 댓글 ========== */
.detail-reply-wrap {
	background: #f5f5f5;
	padding: 15px;
	border: 1px solid #ddd;
	position: relative;
	width: 877.5px;
	margin-left: -15.2px;
}

.detail-reply-wrap .detail-reply-image {
	position: absolute;
	left: 15px;
	top: 15px;
}

.detail-reply-wrap .detail-reply-content {
	padding-left: 60px;
}

.detail-reply-content textarea {
	resize: none;
	width: 100%;
	margin-bottom: 10px;
}

.detail-reply-input > .form-control {
	width: 200px;
	margin-bottom: 5px;
}

.detail-reply-input {
	float: left;
}

.detail-reply-group button {
	float: right;
}

.detail-reply-group small {
	margin-left: 10px;
	height: 20px;
	line-height: 20px;
}

.detail-reply-group a {
	text-decoration: none;
	color: #777;
	float: right;
}

.reply-star-point{
	background: #f5f5f5;
	float: left;
	width: 277.5px;
	height: 167.5px;
	padding-top: 15px;
	text-align: center;
	border: 1px solid #ddd;
	margin: 0 auto;
	position: relative;
	
}

.reply-star {
	color: orange;
	font-size: large;
	
}

.reply-star-graph{
	background: #f5f5f5;
	padding-top: 15px;
	border: 1px solid #ddd;
	padding-right: 0;
	width: 600px;
	position: relative;

}

#graph-point{
	float: left;
	margin-right: 10px;
	
}

#graph {
	margin-bottom: 10px;
}

.reply-star-graph > .progress > .progress-bar {
	height: 10px;
	float: left;
	width: 70%;

}

.video {
	margin-top: 40px;
	scale: 0.5;
}

#detail-middle{
	margin: 0; 
	padding: 0;
}

.detail-order,
.detail-text{
	float: right;
}

.detail-text {
	margin-top: 30px;
	margin-bottom: 40px;
	padding-right: 0;
}

.user-star{
	text-align: center;
	margin: 10px 0;
}

.user-star-check{
	color: orange;
	font-size: large;
  
}
</style>







<div id="wrapper">
				
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h2>상세보기<small>(강의예제)</small></h2>
                        <hr>
                    </div>

                    <div class="col-md-6 col-xs-12">
                        <img src="<c:url value='/lecture/lectureDisplay?thumbnailFileLoca=${lectureArticle.thumbnailFileLoca}&thumbnailFilename=${lectureArticle.thumbnailFilename}' />" alt="Detail">
                    </div>
                    <div class="col-md-6 col-xs-12">
                        <div class="detail-info">
                            <p class="detail-title">${lectureArticle.lectureTitle }</p>
                            <p class="detail-price"><strong>${lectureArticle.lecturePrice} </strong></p>
                            <span class="glyphicon glyphicon-star detail-star"></span>
                            <span class="glyphicon glyphicon-star detail-star"></span>
                            <span class="glyphicon glyphicon-star detail-star"></span>
                            <span class="glyphicon glyphicon-star detail-star"></span>
                            <span class="glyphicon glyphicon-star detail-star"></span>
                            <p class="detail-delivery">
                                무료배송<br>
                                상품별배송 | 택배배송 | 당일출고, 12시 이전 결제 건까지 해당 (주말, 공휴일 제외)
                            </p>
                        </div>

                        <div class="detail-control">
                            <div class="detail-total-price clearfix">
                                <p class="left total-left">총 상품금액</p>
                                <p class="right total-right"><strong>0원</strong></p>
                            </div>
                            <div class="detail-order clearfix">
                                <button class="left btn btn-default detail-btn">장바구니</button>
                                <button class="right btn btn-primary detail-btn">구매하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hr>
        <section>
            <div class="container">
                <div class="row">
                    <!-- 16:9 aspect ratio -->
                    <div class="embed-responsive embed-responsive-16by9 video">
                        <iframe class="embed-responsive-item" src="<c:url value='/lecture/videoDisplay?videoFileLoca=${lectureArticle.videoFileLoca}&videoFilename=${lectureArticle.videoFilename}' />"></iframe>
                    </div>
                    
                    
                    
                <div class="row clearfix">
                    <div class="container" id="detail-middle">
                        
                        
                        <div class="col-md-12 detail-text"> 
                        	<div id="viewer"></div>
                        		 
                            	<input type="hidden" id="view" value="${lectureArticle.lectureContent }">
                            	
                        </div>
                        
                    </div> 
                </div>
                    

                </div>
            </div>
        </section>

        <section class="detail-reply">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-xs-12 detail-content-wrap">
                        <!-- 평점 공간-->
                        <div class="row">
                            <div>
                                <div class="col-md-4 reply-star-point">
                                    <p><h2>5.0</h2></p>
                                    <p>

                                        <span class="glyphicon glyphicon-star reply-star"></span>
                                        <span class="glyphicon glyphicon-star reply-star"></span>
                                        <span class="glyphicon glyphicon-star reply-star"></span>
                                        <span class="glyphicon glyphicon-star reply-star"></span>
                                        <span class="glyphicon glyphicon-star reply-star"></span>
                                    </p>
                                    <p>
                                        수강평수: <span> 50</span>
                                    </p>
                                </div><!-- 평점 별 있는 곳-->

                                <div class="col-md-8 reply-star-graph clearfix">
                                    <div>                                    
                                        <div id="graph-point"><span>5점</span></div>
                                        <div class="progress" id="graph">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div>                                    
                                        <div id="graph-point"><span>4점</span></div>
                                        <div class="progress" id="graph">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div>                                    
                                        <div id="graph-point"><span>3점</span></div>
                                        <div class="progress" id="graph">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div>                                    
                                        <div id="graph-point"><span>2점</span></div>
                                        <div class="progress" id="graph">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div>                                    
                                        <div id="graph-point"><span>1점</span></div>
                                        <div class="progress" id="graph">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>        

                        </div> <!--평점공간 close-->

                        <!-- 댓글 작성 공간 -->
                        <div class="detail-reply-wrap">
                            
                            <div class="detail-reply-content">
                                <div class="user-star"> 
                                    <span class="glyphicon glyphicon-star user-star-check"></span>
                                    <span class="glyphicon glyphicon-star user-star-check"></span>
                                    <span class="glyphicon glyphicon-star user-star-check"></span>
                                    <span class="glyphicon glyphicon-star user-star-check"></span>
                                    <span class="glyphicon glyphicon-star user-star-check"></span> &nbsp;
                                    <p> 체크해 주세요</p>
                                </div>
                                       
                                <textarea class="form-control" rows="3" placeholder="수강평을 써주세요"></textarea>
                                        
                                <div class="detail-reply-group clearfix">
                                    <div class="reply-input">
                                        
                                    </div>
                                    <button class="btn btn-info">등록하기</button>
                                </div>
                            </div>
                        </div>
                        <!-- 댓글이 달릴 공간 -->
                        <div class="detail-reply-wrap">
                          
                            <div class="detail-reply-content">
                                <div class="detail-reply-group clearfix">
                                    <strong class="left">honggildong</strong>
                                    <small class="left">2022/01/06</small>
    
                                    <a class="right" href="#"><span class="glyphicon glyphicon-pencil"></span>수정</a>
                                    <a class="right" href="#"><span class="glyphicon glyphicon-remove"></span>삭제</a>
                                </div>
                                <p>여기는 댓글 영역</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

 </div> <!-- wrapper close -->
 
 <script>
 	var view = $('#view').val()
 
 	const viewer = toastui.Editor.factory({
 		  el: document.querySelector('#viewer'),
          viewer: true,
          height: '500	px',
          initialValue: view
 	});
 	
 	console.log(view)
 
 	
 	
 	 function ToView()
     {
         viewer.getMarkdown(viewer.setHTML());
     };	</script>


	
<%@ include file="../include/footer.jsp" %>
