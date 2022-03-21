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
	
	@GetMapping("/search")
	public List<BoardVO> search(String keyword) {
		List<BoardVO> list = new ArrayList<>();
		list = service.search(keyword);
		return list;
	}

}
