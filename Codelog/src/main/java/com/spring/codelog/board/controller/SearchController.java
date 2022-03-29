package com.spring.codelog.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.service.ISearchService;
import com.spring.codelog.board.service.ITagService;
import com.spring.codelog.user.commons.FollowVO;
import com.spring.codelog.user.model.UserVO;
import com.spring.codelog.user.service.IFollowService;
import com.spring.codelog.user.service.IUserService;

@Controller
public class SearchController {
	
	@Autowired
	private ISearchService service;
	
	@Autowired
	private IUserService uservice;

	@Autowired
	private IFollowService fservice;
	
	@Autowired
	private ITagService tagService;
	//검색 요청 처리
	@GetMapping("/search")
	public String search(@RequestParam String keyword, Model model) {
		

		System.out.println("검색어: " + keyword);
		//검색 결과 게시물 리스트
		List<BoardVO> list = new ArrayList<>();
		list = service.search(keyword);
		model.addAttribute("searchList", list);
		model.addAttribute("keyword", keyword);
		System.out.println("검색 게시물 리스트: " + list);
		return "searchList";
	}
	
	
	//검색 요청 처리
		@ResponseBody
		@PostMapping("/search/searchId")
		public List<BoardVO> searchId(@RequestBody  Map<String, String> info) {
			
			System.out.println("검색아이디: " + info.get("userId"));
			//검색 결과 게시물 리스트
			List<BoardVO> list = new ArrayList<>();
			list = service.searchId(info.get("userId"));
			
			System.out.println("검색 아이디 리스트: " + list);
			return list;
		}
		
	
	//검색 결과 처리
	@GetMapping("/searchList")
	public void searchList() {}
	
	//태그 검색 요청 처리
	@GetMapping("/searchByTag")
	public String searchByTag(@RequestParam String keyword, Model model) {
		System.out.println("태그검색어: " + keyword);
		//검색 결과 게시물 리스트
		List<BoardVO> list = new ArrayList<>();
		list = service.searchByTag(keyword);
		model.addAttribute("searchList", list);
		model.addAttribute("keyword", keyword);
		System.out.println("검색 게시물 리스트: " + list);
		return "searchList";
	}
	
	//마이페이지 검색 요청 처리 
	@GetMapping("/search/{userId}")
	public String search(@RequestParam String keyword, @PathVariable String userId, Model model, HttpSession session) {
		System.out.println("키워드/아이디"+keyword+ userId);
		List<BoardVO> searchList = new ArrayList<>();
		searchList = service.searchMypage(keyword, userId);
		
		String id = ((UserVO) session.getAttribute("loginSession")).getUserId();
		UserVO userInfo = uservice.getInfo(id);

		//팔로우 리스트 보내기
		UserVO user = uservice.selectOne(id);
		FollowVO follow = new FollowVO();
		if(session.getAttribute("loginSession") != null) {
			UserVO loginUser = (UserVO) session.getAttribute("loginSession");
			int loginUserNo = loginUser.getUserNo();
			follow.setActiveUser(loginUserNo);

		}

		int userNo = user.getUserNo();

		follow.setPassiveUser(userNo);
		int followCheck = fservice.isFollow(follow);
		System.out.println("팔로우 유무 체크:"+ followCheck);

		//팔로워리스트
		List<FollowVO> followerList = fservice.selectPassiveUserList(userNo);
		System.out.println("userNO:"+userNo);
		System.out.println("followerList: "+followerList);
		//팔로잉리스트
		List<FollowVO> followingList = fservice.selectActiveUserList(userNo);
		System.out.println("followinglist: "+ followingList);
		System.out.println("userInfo: "+userInfo);
		System.out.println("userInfo의 보드리스트: "+userInfo.getBoardList());

		
		//태그리스트 부르기
		List<String> tagList =tagService.listbyuId(id);
		
		ModelAndView mv = new ModelAndView();
		model.addAttribute("userInfo", userInfo);//사용자 정보 보내기 
		model.addAttribute("user", user);
		model.addAttribute("followCheck", followCheck);
		model.addAttribute("followerList", followerList);
		model.addAttribute("followingList", followingList);
		model.addAttribute("id", user.getUserId());
		model.addAttribute("tagList", tagList);
		
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("word", keyword);
		return "user/page";
	}
}
