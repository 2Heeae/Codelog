package com.spring.codelog.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.codelog.board.commons.PostLikeVO;
import com.spring.codelog.board.service.IPostLikeService;

@RestController
public class LikeController {
	
	private IPostLikeService service;
	
	@PutMapping("/likeUpdate")
	public Map<String, String> likeUpdate(@RequestBody PostLikeVO vo) {
		System.out.println("/likeUpdate: PUT");
		System.out.println("좋아요 컨트롤러 값: " + vo);
		
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			service.likeUpdate(vo);
			map.put("result", "success");
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
		
	}

}