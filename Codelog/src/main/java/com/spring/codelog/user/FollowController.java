package com.spring.codelog.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.codelog.user.commons.FollowVO;
import com.spring.codelog.user.model.UserVO;
import com.spring.codelog.user.service.IFollowService;
import com.spring.codelog.user.service.IUserService;

@Controller
public class FollowController {
	
	@Autowired
	private IFollowService fservice;
	
	@Autowired 
	private IUserService uservice;
	
	//팔로우기능
	@ResponseBody
	@PostMapping("/follow/{id}")
	public String follow(@PathVariable String id, HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("loginSession");
		UserVO followUser = uservice.selectOne(id);
		FollowVO following = new FollowVO();
		following.setUserId(user.getUserId());
		following.setFromId(id);
		fservice.follow(following);
		return "followOK";
	}
	
	//언팔로우 기능
	@ResponseBody
	@PostMapping("/unfollow/{id}")
	public String unfollow(@PathVariable String id, HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("loginSession");
		UserVO followUser = uservice.selectOne(id);
		FollowVO following = new FollowVO();
		following.setUserId(user.getUserId());
		following.setFromId(id);
		fservice.unfollow(following);
		return "unfollowOk";
	}
	
//	//팔로우리스트 보여주기
//	@GetMapping("/followList/{id}")
//	public String followList(@PathVariable String id, HttpSession session) {
//		UserVO user = uservice.selectOne(id);
//		UserVO loginUser = (UserVO) session.getAttribute("loginSession");
//		
//		FollowVO follow = new FollowVO();
//
//		int followCheck = fservice.isFollow(follow);
//		
		
//	}
	
	
}







