<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <style>
    /* 회원정보수정 페이지 css */
    @import url("<c:url value='/css/editProfile.css'/>");
  </style>
</head>

<body>
  

  <!-- 회원정보 수정 페이지 바디 시작 -->
  <div class="container px-1 py-5 mt-5" id="user-modify-container">
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-3">
        <div class="row mb-5">
          <div class="col-md-12">
            <!-- 프로필 이미지 -->
            <c:choose>
	            <c:when test="${loginSession.userImg eq null || loginSession.userImg eq 'null'}">
	            	<img src="<c:url value='/img/user_icon.png' />" id="img-preview" class="img-circle" alt="" width="130px" height="130px">
	            </c:when>
	            <c:otherwise>
	            	<img src="<c:url value='/user/display' />" id="img-preview" class="img-circle" alt="" width="130px" height="130px">
	            </c:otherwise>
            </c:choose>
            <!-- 이미지 업로드 버튼 -->
            <label for="img_upload" class="upload-btn">이미지 업로드</label>
            <input type="file" class="img-upload" id="img_upload">
            <!-- 이미지 삭제 버튼 -->
            <button type="button" id="img-del-btn" class="btn btn-light del-btn">이미지 삭제</button>
          </div>
        </div>
      </div>
      <!-- 닉네임, 자기소개 영역 -->
      <div class="col-md-8 info-area">
        <div class="row">
          <h3 class="nickname">${loginSession.nickname}</h3>
          <p class="profile">${loginSession.userInfo}</p>
        </div>
        <div class="row">
          <div class="col-md-2">
            <button class="btn btn-primary" id="nick-mod-btn">수정</button>
          </div>
        </div>
      </div>
      <!-- 수정 버튼 눌렀을 때 보일 화면 -->
      <div class="col-md-8 mod-info">
        <input type="text" id="nick-input" value="${loginSession.nickname}"> <br>
        <textarea name="" id="profile-input" cols="50" rows="4" class="mt-3">${loginSession.userInfo}</textarea>
        <div class="row">
          <div class="col-md-2">
            <button class="btn btn-primary" id="nick-save-btn">저장</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 회원정보 수정 폼 시작 -->
    <form action="<c:url value='/user/updateUser' />" method="post" id="updateForm" class="user-info">
      <div class="mb-3 row">
        <div class="col-md-1"></div>
        <div class="col-md-3">
          <label for="id" class="col-md-12 col-form-label"><b>아이디</b></label>
        </div>
        <div class="col-md-4">
          <input type="text" readonly class="form-control-plaintext" name="userId" id="userId" value="${loginSession.userId}">
        </div>
        <div class="col-md-4"></div>
      </div>
      <hr>
      <div class="mb-3 row">
        <div class="col-md-1"></div>
        <div class="col-md-3">
          <label for="pw" class="col-md-12 col-form-label"><b>비밀번호</b></label>
        </div>
        <div class="col-md-3">
          <input type="password" class="form-control" name="userPw" id="pw" value="${loginSession.userPw}">
        </div>
        <div class="col-md-5"></div>
      </div>
      <hr>
      <div class="mb-3 row">
        <div class="col-md-1"></div>
        <div class="col-md-3">
          <label for="pwChk" class="col-form-label"><b>비밀번호 확인</b></label>
        </div>
        <div class="col-md-3">
          <input type="password" class="form-control" id="pw-check" value="">
        </div>
        <div class="col-md-5"></div>
      </div>
      <hr>      
      <div class="mb-3 row">
        <div class="col-md-1"></div>
        <div class="col-md-3">
          <label for="email" class="col-md-12 col-form-label"><b>이메일</b></label>
        </div>
        <div class="col-md-8">
          <input type="text" class="form-control email-id" name="email1" value="${loginSession.email1}" id="">
          <span class="at">@</span>
          <select name="email2" id="" class="form-select mail-select">
            <option value="naver.com" ${loginSession.email2 == 'naver.com' ? 'selected' : ''}>naver.com</option>
            <option value="google.com" ${loginSession.email2 == 'google.com' ? 'selected' : ''}>google.com</option>
            <option value="hanmail.net" ${loginSession.email2 == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
          </select>
        </div>
        <div class="col-sm-7"></div>
      </div>
      <!-- 수정, 취소 버튼 -->
      <div class="mb-3 row text-center">
        <div class="col-md-3"></div>
        <div class="col-md-6 mt-5">
          <button type="button" id="update-form-btn" class="btn btn-primary mod-submit-btn">수정</button>
          <button type="button" id="cancel-btn" class="btn btn-light mod-cancel-btn">취소</button>
        </div>
        <div class="col-md-3"></div>
      </div>
      <!-- 회원탈퇴 버튼 -->
      <div class="mb-3 row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
          <button type="button" id="del-user-btn" class="btn btn-dark" style="float: right;">회원탈퇴</button>
        </div>
      </div>
    </form>
  </div>
  
 <%@ include file="../include/footer.jsp" %>

  <script>
    // start jQuery
    $(document).ready(function () {
    	
      //프로필 이미지 업로드 버튼 클릭 이벤트
      $('#img_upload').change(function() {
    	  upload();
	  });
    	
      //이미지 업로드를 담당하는 함수
      function upload() {
    	  //자바스크립트의 파일 확장자 체크 검색
    	  let file = $('#img_upload').val();
    	  
    	  console.log(file);
    	  
    	  file = file.slice(file.indexOf('.') + 1).toLowerCase();
    	  console.log(file);
    	  if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
    		  alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
    		  $('#img_upload').val('');
			  return;    		  
    	  }
    	  
    	  //ajax 폼 전송의 핵심 FormData 객체
    	  const formData = new FormData();
    	  const data = $('#img_upload');
    	  
    	  console.log('폼 데이터: ' + formData);
    	  console.log('data: ' + data);
    	  
    	  //FormData 객체에 사용자가 업로드한 파일의 정보들이 들어있는 객체에 전달
		  formData.append('file', data[0].files[0]);
    	  
    	  //비동기 방식으로 파일 업로드 및 게시글 등록을 진행
    	  //ajax 시작
    	  $.ajax({
    		  url : '<c:url value="/user/editUser/imgUpload" />',
    		  type : 'POST',
    		  data : formData,
    		  contentType : false,
    		  processData : false,
    		  
    		  success : function(result) {
    			  if(result === 'success') {
    				  $('#img_upload').val('');
    			  } else {
    				  alert('업로드에 실패했습니다.');
    			  }
				
			  },
			  error : function(request, status, error) {
				  console.log('code: ' + request + '\n' + 'message: ' + request.responseText + '\n' + 'error: ' + error);
				
			  }
    	  }); //ajax 끝
	  } //프로필 이미지 업로드 버튼 클릭 이벤트 끝
    	
      // 닉네임/자기소개 수정 인풋창 보여주기
      $('#nick-mod-btn').click(function () {
	      console.log('수정버튼 클릭됨');
	      $('.info-area').hide();
	      $('.mod-info').show();
      }); // 닉네임/자기소개 수정 인풋창 보여주기 끝

      //닉네임&자기소개 저장 버튼 클릭 이벤트 처리
      $('#nick-save-btn').click(function () {
          console.log('저장버튼 클릭됨');
          var nick = $('#nick-input').val();
          var profile = $('#profile-input').val();
          var user_id = $('#userId').val();
          console.log(nick);
          console.log(profile);
          $('.nickname').text(nick);
          $('.profile').text(profile);
          $('.mod-info').hide(); //인풋창 숨겨주기
          $('.info-area').show(); //닉네임, 자기소개 보여주기
          
          const user = {
        		  	"userId" :  user_id,
					"nickname" : nick,
					"userInfo" : profile,
			};
          
          console.log(user);
			
			//비동기 통신 시작!
			$.ajax({
				type : 'POST',
				url : '/codelog/user/nickChange',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(user),
				success : function(result) {
					console.log('통신 성공!: ' + result);
					alert('수정되었습니다.');
				},
				error : function() {
					alert('수정 실패!');
				}
			}); //end ajax(회원가입 처리)
          
      }); //닉네임&자기소개 저장 버튼 클릭 이벤트 처리 끝

      //프로필 이미지 업로드 시 미리보기
      $('#img_upload').change(function () {
          readURL(this);
      });

      function readURL(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                  $('#img-preview').attr('src', e.target.result);
              }
              reader.readAsDataURL(input.files[0]);
              
           }
      } ////프로필 이미지 업로드 시 미리보기 끝

      //프로필 이미지 삭제
      $('#img-del-btn').click(function() {
    	  img_del();
    	  function img_del() {
              
              //프로필 이미지 삭제 ajax 시작
              $.ajax({
            	  type : 'POST',
            	  url : '<c:url value="/user/editUser/imgDel" />',
            	  dataType : 'text',
            	  data : '',
            	  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            	  
           		  success : function(result) {
           			  if(result === 'success') {
           				$('#img-preview').attr('src', '<c:url value="/img/user_icon.png" />');
           			  } else {
           				  alert('프로필 이미지를 먼저 등록해주세요.');
           			  }
       				
       			  },
       			  error : function(request, status, error) {
       				  console.log('code: ' + request + '\n' + 'message: ' + request.responseText + '\n' + 'error: ' + error);
       				
       			  }
            	  
              }); //ajax 끝
    	  }
          
      }); //프로필 이미지 삭제 끝
      
      //회원정보 수정 (비밀번호, 이메일) 버튼 이벤트
      $('#update-form-btn').click(function() {
    	  if(confirm('수정하시겠습니까?')) {
    		  $('#updateForm').submit();
    	  } else {
    		  return;
    	  }
	  }); //회원정보 수정 (비밀번호, 이메일) 버튼 이벤트 끝
      
      //회원정보수정 취소 버튼 클릭 이벤트 처리
      $('#cancel-btn').click(function() {
    	  location.href = "<c:url value='/user/mypage' />";	 
	  }); //회원정보수정 취소 버튼 클릭 이벤트 처리 끝
      
      //회원탈퇴 버튼 클릭 이벤트 처리
      $('#del-user-btn').click(function() {
    	  const result = confirm('정말 탈퇴하시겠습니까?');
    	  
    	  if(result) {
    		  location.href = "<c:url value='/user/delete' />";			
    	  } else {
    		  
    	  }
    	  
	  }); //회원탈퇴 버튼 클릭 이벤트 처리 끝

    }); // end jQuery
  </script>
  <!-- 회원정보 수정 페이지 바디 끝 -->
</body>

</html>