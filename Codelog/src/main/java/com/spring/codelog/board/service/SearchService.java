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
	public List<BoardVO> search(String keyword) {
		return mapper.search(keyword);
	}
	
	@Override
	public List<BoardVO> searchId(String userId) {
		// TODO Auto-generated method stub
		return mapper.searchId(userId);
	}

}
