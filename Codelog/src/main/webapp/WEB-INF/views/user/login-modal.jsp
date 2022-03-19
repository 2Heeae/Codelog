<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 로그인 모달 시작 -->
<div class="modal fade" tabindex="-1" role="dialog" id="loginModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h5 class="modal-title">Modal title</h5> -->
        <h2 class="fw-bold mb-0">로그인</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body p-5 pt-0">
        <form>
          <div class="form-floating mb-3">
            <input type="text" class="form-control rounded-4" id="login-id">
            <label for="floatingInput">아이디</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control rounded-4" id="login-pw">
            <label for="floatingPassword">비밀번호</label>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="button" id="login-btn">로그인</button>
          <hr class="my-4">
          <small class="text-muted">아직 회원이 아니신가요?</small>
          <h2 class="fs-5 fw-bold mb-3"></h2>
          <!-- 회원가입 버튼 클릭 시 회원가입 모달 열림-->
          <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4" type="button" data-bs-toggle="modal"
            data-bs-target="#joinModal">
            회원가입
          </button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 로그인 모달 끝 -->

<!-- 회원가입 모달 시작 -->
<div class="modal fade" tabindex="-1" role="dialog" id="joinModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h5 class="modal-title">Modal title</h5> -->
        <h2 class="fw-bold mb-0">회원가입</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body p-5 pt-0">
        <form>
          <label for="basic-url" class="form-label">아이디</label>
          <div class="form-floating mb-3">
            <input class="form-control rounded-4" id="user-id">
            <label for="floatingInput" id="id-msg">아이디 블라블라~~~</label>
          </div>
          <label for="basic-url" class="form-label">비밀번호</label>
          <div class="form-floating mb-3">
            <input type="password" class="form-control rounded-4" id="user-pw">
            <label for="floatingPassword">비밀번호 블라블라~~~</label>
          </div>
          <label for="basic-url" class="form-label">비밀번호 확인</label>
          <div class="form-floating mb-3">
            <input type="password" class="form-control rounded-4" id="user-pw-check">
            <label for="floatingPassword">비밀번호 일치하지 않을 때 블라블라~~~</label>
          </div>
          <label for="basic-url" class="form-label">닉네임</label>
          <div class="form-floating mb-3">
            <input class="form-control rounded-4" id="user-nick">
            <label for="floatingInput">닉네임 몇자 블라블라~~~</label>
          </div>
          <label for="basic-url" class="form-label">이메일</label>
          <div class="form-floating input-group mb-3">
            <input type="text" class="form-control rounded-4" id="email1">
            <span class="input-group-text">@</span>
            <input type="text" class="form-control rounded-4" id="email2-input" placeholder="Server"
              aria-label="Server" style="display: none;">
            <select name="" id="email2" class="form-select email2-select">
              <option selected value="naver">naver.com</option>
              <option value="google">google.com</option>
              <option value="daum">hanmail.net</option>
              <option value="self">직접 입력</option>
            </select>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="button" id="join-btn">회원가입</button>
          <hr class="my-4">
          <small class="text-muted">계정이 이미 있으신가요?</small>
          <h2 class="fs-5 fw-bold mb-3"></h2>
          <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4" type="button" data-bs-toggle="modal"
            data-bs-target="#loginModal">
            <svg class="bi me-1" width="16" height="16">
              <use xlink:href="#facebook" /></svg>
            로그인
          </button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 회원가입 모달 끝 -->

<script>
	
	//start jQuery
	$(function() {
		//회원가입
		/*
		//각 입력값들의 유효성 검증을 위한 정규표현식을 변수로 선언
		const get_id_check = RegExp(/^[a-z0-9]{4,14}$/);
		const get_pw_check = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~]{8,16}$)|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9]{8,16}$)/);
		const get_name_check = RegExp(/([가-힣a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[가-힣a-zA-Z0-9])/);
		
		//입력값 중 하나라도 만족하지 못한다면 회원가입 처리를 막기 위한 논리형 변수 선언
		let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
		
		//1. ID 입력값 검증
		$('#user-id').keyup(function() {
			if($(this).val() === '') {
				$(this).css('border-color', 'red');
				$('#id-msg').html('<b style="font-size: 14px; color: red">[아이디를 입력하세요.]</b>');
				chk1 = false;
			}
			//아이디 입력값 유효성 검사
			else if(!get_id_check.test($(this).val())) {
				$(this).css('border-color', 'red');
				$('#id-msg').html('<b style="font-size: 14px; color: red">[아이디는 영문, 숫자 조합으로 4~14자로 입력하세요.]</b>');
				chk1 = false;
			}
		}); //ID 입력값 검증 끝
		*/
		
		
		//회원가입 창 이메일 셀렉트 직접 입력 옵션
		//평상시에는 직접 입력 인풋박스 안보이는 상태
		$('#email2-input').hide();

		//메일 선택 셀렉트 변화가 생기면
		$('.email2-select').change(function() {
			//직접 입력을 선택했을 경우
			if ($('.email2-select').val() == 'self') {
				//직접 입력 인풋창 보여준다.
				$('#email2-input').show();
			} else {
				$('#email2-input').hide();
			}
		}); //회원가입 창 이메일 셀렉트 직접 입력 옵션 끝
		
		
		//회원가입 버튼 클릭 이벤트
		$('#join-btn').click(function() {
			//아이디
			const id = $('#user-id').val();
			//비밀번호
			const pw = $('#user-pw').val();
			//닉네임
			const nick = $('#user-nick').val();
			//이메일1
			const email1 = $('#email1').val();
			//이메일2
			const email2 = $("#email2 option:selected").text();
			
			console.log(id);
			console.log(pw);
			console.log(nick);
			console.log(email1);
			console.log(email2);
			
			const user = {
					"userId" : id,
					"userPw" : pw,
					"nickname" : nick,
					"email1" : email1,
					"email2" : email2,
			};
			
			//비동기 통신 시작!
			$.ajax({
				type : 'POST',
				url : 'user/',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(user),
				success : function(result) {
					console.log('통신 성공!: ' + result);
					alert('회원 가입을 환영합니다.');
					document.location.reload();
				},
				error : function() {
					alert('회원 가입 실패!');
				}
			}); //end ajax(회원가입 처리)
			
		}); //회원가입 처리 끝
		
		
		//로그인 버튼 클릭 이벤트
		$('#login-btn').click(function() {
			const id = $('#login-id').val();
			const pw = $('#login-pw').val();
			
			console.log('id: ' + id);
			console.log('pw: ' + pw);
			
			const loginInfo = {
				"userId" : id,
				"userPw" : pw
			};
			
			//비동기 통신 시작!
			$.ajax({
				type : 'POST',
				url : 'user/login',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(loginInfo),
				success : function(data) {
					if(data === 'wrongId') {
						console.log('없는 아이디임');
						alert('존재하지 않는 아이디 입니다.');
						$('#login-id').val('');
						$('#login-pw').val('');
						$('#login-id').focus();
					} else if(data === 'wrongPw') {
						console.log('비번 틀림');
						alert('비밀번호를 다시 확인해주세요.');
						$('#login-pw').val('');
						$('#login-pw').focus();
					} else {
						console.log('로그인 성공!');
						document.location.reload();
					}
				},
				error : function() {
					console.log('통신 실패!');
				}
			}); //end ajax 로그인 비동기 처리
			
			
			
		}); //로그인 버튼 클릭 이벤트 처리 끝!
		
		
		
		
	}); //end jQuery
	
</script>