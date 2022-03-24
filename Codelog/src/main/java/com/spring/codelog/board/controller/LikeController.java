package com.spring.codelog.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.codelog.board.commons.PostLikeVO;
import com.spring.codelog.board.service.IPostLikeService;

@RestController
public class LikeController {
	
	@Autowired
	private IPostLikeService service;
	
	@PutMapping("/likeUpdate")
	public Map<String, String> likeUpdate(@RequestBody PostLikeVO vo) {
		System.out.println("/likeUpdate: PUT");
		
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("라이크컨트롤러...vo.getPlike: " + vo.getPLike());
		
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