package com.spring.codelog.board.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.codelog.board.service.IBoardService;
import com.spring.codelog.board.service.ITagService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/tag")
public class TagController {
	
	@Autowired
	ITagService service;
	
	@ResponseBody
	@PostMapping("/regist")
	public String regist(@RequestBody String tags) {
		System.out.println("태그들: "+ tags);
		//태그 나눠주기
		String str = tags.replace(" ", "");
		String st = str.replace("\"", "");
		System.out.println("정제한 문자열"+st);
		String[] eachTag = st.split(",");
		System.out.println(Arrays.toString(eachTag));
		System.out.println(eachTag[0]);
		
		
		
		
//		service.registTags(boardId);
		
		
		return "tag";
	}
	
	
}
