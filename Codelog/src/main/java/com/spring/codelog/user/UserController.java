package com.spring.codelog.user;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.codelog.user.commons.FollowVO;
import com.spring.codelog.user.commons.profileImgVO;
import com.spring.codelog.user.model.UserVO;
import com.spring.codelog.user.service.IFollowService;
import com.spring.codelog.user.service.IUserService;


@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService uservice;
	
	@Autowired
	private IFollowService fservice;
	
	//아이디 중복 확인 처리
	@PostMapping("/checkId")
	public String checkId(@RequestBody String userId) {
		System.out.println("/user/checkId: POST");
		System.out.println("param: " + userId);
		
		int checkNum = uservice.checkId(userId);
		
		if(checkNum == 1) {
			System.out.println("아이디가 중복됨!");
			return "duplicated";
		} else {
			System.out.println("아이디 사용 가능!");
			return "available";
		}
	}
	
	//회원가입 요청 처리
	@PostMapping("/")
	public String join(@RequestBody UserVO vo) {
		System.out.println("/user/: POST");
		uservice.join(vo);
		return "joinSuccess";
	}
	
	//로그인 요청 처리
	@PostMapping("/login")
	public String login(@RequestBody UserVO vo, HttpSession session) {
		System.out.println("/user/login: POST");
		System.out.println("param: " + vo);
		
		UserVO dbData = uservice.selectOne(vo.getUserId());
		
		if(dbData != null) {
			if(vo.getUserPw().equals(dbData.getUserPw())) {
				session.setAttribute("loginSession", dbData);
				return "loginSuccess";
			} else {
				return "wrongPw";
			}
		} else {
			return "wrongId";
		}
	}
	
	//마이페이지 이동 처리
	@GetMapping("/mypage")
	public ModelAndView mypage(HttpSession session, Model model) {
		System.out.println("/user/mypage: GET");
		String id = ((UserVO) session.getAttribute("loginSession")).getUserId();
		UserVO userInfo = uservice.getInfo(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("userInfo", userInfo);
		mv.setViewName("/user/mypage");
		
		//팔로우 리스트 보내기
		UserVO user = uservice.selectOne(id);
		UserVO loginUser = (UserVO) session.getAttribute("loginSession");
		
		int userNo = user.getUserNo();
		int loginUserNo = loginUser.getUserNo();
		
		FollowVO follow = new FollowVO();
		int followCheck = fservice.isFollow(follow);
		
		//팔로워리스트
		List<FollowVO> followerList = fservice.selectPassiveUserList(userNo);
		//팔로잉리스트
		List<FollowVO> followingList = fservice.selectActiveUserList(userNo);
		
		model.addAttribute("user", user);
		model.addAttribute("followCheck", followCheck);
		model.addAttribute("followerList", followerList);
		model.addAttribute("followingList", followingList);
	
		
		return mv;
	}
	
	//다른사람 페이지 이동 처리
	@GetMapping("/userpage/{userId}")
	public ModelAndView userpage(@PathVariable String id ,String nickname) {
		System.out.println("user/userpage: get");
		UserVO vo =uservice.selectUser(nickname);
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", vo.getUserId());
		mv.setViewName("user/userpage");
		return mv;
	}
	
	//회원정보수정 페이지 이동 처리
	@GetMapping("/editUser")
	public ModelAndView editUser() {
		System.out.println("/user/editUser: GET");
		return new ModelAndView("/user/editProfile");
	}
	
	//프로필 이미지 업로드 처리
	@PostMapping("/editUser/imgUpload")
	public String upload(MultipartFile file, HttpSession session) {
		
		try {
			String userId = ((UserVO)session.getAttribute("loginSession")).getUserId();
			
			//저장할 폴더 경로
			String uploadPath = "C:\\test\\upload";
			
			String fileRealName = file.getOriginalFilename();
			
			//파일명을 고유한 랜덤 문자로 생성
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			
			//확장자 추출
			String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
			
			System.out.println("저장할 폴더 경로: " + uploadPath);
			System.out.println("실제 파일명: " + fileRealName);
			System.out.println("확장자: " + fileExtension);
			System.out.println("고유랜덤문자: " + uuids);
			
			String fileName = uuids + fileExtension;
			System.out.println("변경해서 저장할 파일명: " + fileName);
			
			//업로드한 파일을 서버 컴퓨터의 저장한 경로 내에 실제로 저장
			File saveFile = new File(uploadPath + "\\" + fileName);			
			file.transferTo(saveFile);
			
			profileImgVO vo = new profileImgVO(userId, fileName);
			uservice.updateProfileImg(vo);
			
			UserVO user = (UserVO) session.getAttribute("loginSession");
			String uId = vo.getUserId();
			UserVO dbData = uservice.selectOne(uId);
			session.setAttribute("loginSession", dbData);
			
			return "success";
		} catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "fail";
		}
		
	}
	
	//프로필 이미지 파일 보여주기 요청
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(HttpSession session) {
		String fileName = ((UserVO)session.getAttribute("loginSession")).getUserImg();
		System.out.println("fileName: " + fileName);
		
		File file = new File("C:\\test\\upload\\" + fileName);
		System.out.println(file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	//프로필 이미지 삭제 요청
	@PostMapping("/editUser/imgDel")
	public String imgDel(HttpSession session) {
		
		try {
			String userId = ((UserVO)session.getAttribute("loginSession")).getUserId();
			
			//삭제할 폴더 경로
			String uploadPath = "C:\\test\\upload";
			//삭제할 파일 이름
			String delFileName = ((UserVO)session.getAttribute("loginSession")).getUserImg();
			System.out.println("삭제할 파일 이름: " + delFileName);
			
			//서버 컴퓨터에 업로드 했던 파일 실제로 삭제
			File saveFile = new File(uploadPath + "\\" + delFileName);			
			saveFile.delete();
			
			String fileName = "null";
			
			profileImgVO vo = new profileImgVO(userId, fileName);
			uservice.updateProfileImg(vo);
			
			UserVO user = (UserVO) session.getAttribute("loginSession");
			String uId = vo.getUserId();
			UserVO dbData = uservice.selectOne(uId);
			session.setAttribute("loginSession", dbData);
			
			return "success";
		} catch (Exception e) {
			System.out.println("프로필 이미지 파일 삭제 중 에러 발생: " + e.getMessage());
			return "fail";
		}
		
	}
	
	//닉네임 & 자기소개 수정 처리
	@PostMapping("/nickChange")
	public String nickChange(@RequestBody UserVO vo) {
		System.out.println("/user/nickChange: POST");
		System.out.println(vo.getNickname());
		System.out.println(vo.getUserInfo());
		uservice.nickChange(vo);
		return "changed";
	}
	
	
	//회원정보 수정 처리
	@PostMapping("/updateUser")
	public ModelAndView updateUser(UserVO vo) {
		System.out.println("/user/updateUser: POST");
		System.out.println("param: " + vo);
		uservice.updateUser(vo);
		System.out.println("회원정보 수정 성공!");
		return new ModelAndView("redirect:/user/mypage");
	}
	
	//회원탈퇴 처리
	@GetMapping("/delete")
	public ModelAndView delete(HttpSession session) {
		System.out.println("/user/delete: GET");
		UserVO vo = (UserVO) session.getAttribute("loginSession");
		uservice.delete(vo.getUserId());
		session.invalidate();
		return new ModelAndView("redirect:/");
	}
	
	//로그아웃 처리
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		System.out.println("/user/logout: GET");
		session.invalidate();
		System.out.println("로그아웃 성공!");
		return new ModelAndView("redirect:/");
	}
	
}