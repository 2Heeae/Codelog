package com.spring.codelog.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.service.ISearchService;

@Controller
public class SearchController {
	
	@Autowired
	private ISearchService service;
	
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
	
	//검색 결과 처리
	@GetMapping("/searchList")
	public void searchList() {}

}
