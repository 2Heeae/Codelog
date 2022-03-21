package com.spring.codelog.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.service.ISearchService;

@Controller
public class SearchController {
	
	@Autowired
	private ISearchService service;
	
	//검색 결과 화면
	@GetMapping("/search")
	public List<BoardVO> search(String keyword) {
		
		List<BoardVO> list = new ArrayList<>();
		list = service.searchList(keyword);
		System.out.println("검색 결과 리스트: " + list);
		
		return list;
		
	}

}
