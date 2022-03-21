package com.spring.codelog.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.codelog.board.mapper.ISearchMapper;
import com.spring.codelog.board.model.BoardVO;

@Service
public class SearchService implements ISearchService {
	
	@Autowired
	private ISearchMapper mapper;

	@Override
	public List<BoardVO> searchList(String keyword) {
		return mapper.searchList(keyword);
	}

}
