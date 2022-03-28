package com.spring.codelog.board.service;

import java.util.List;

import com.spring.codelog.board.model.BoardVO;

public interface ISearchService {

	//검색 결과 리스트 보여주기
	List<BoardVO> search(String keyword);
	
	List<BoardVO> searchId(String userId);

	
}
