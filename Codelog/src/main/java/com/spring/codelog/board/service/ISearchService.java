package com.spring.codelog.board.service;

import java.util.List;

import com.spring.codelog.board.model.BoardVO;

public interface ISearchService {
	
	//검색 게시글 보여주는 기능
	List<BoardVO> searchList(String keyword);

}
