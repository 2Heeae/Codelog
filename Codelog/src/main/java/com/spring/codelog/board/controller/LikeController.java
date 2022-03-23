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
	public Map<String, Integer> likeUpdate(@RequestBody PostLikeVO vo) {
		System.out.println("/likeUpdate: PUT");
		System.out.println("좋아요 컨트롤러 값: " + vo);
		
		int checkLike = 0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		String viewUserId = vo.getViewUserId();
		int boardId = vo.getBoardId();
		
		try {
			service.likeUpdate(vo);
			checkLike = service.getLikeInfo(viewUserId, boardId);
			map.put("result", checkLike);
			
		} catch (Exception e) {
			e.printStackTrace();
			//map.put("result", checkLike);
		}
		
		return map;
		
	}

}