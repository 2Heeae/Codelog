package com.spring.codelog.board.mapper;

import java.util.List;

import com.spring.codelog.board.model.BoardVO;

public interface ISearchMapper {

	//검색 게시글 보여주는 기능
	List<BoardVO> searchList(String keyword);
	
}
