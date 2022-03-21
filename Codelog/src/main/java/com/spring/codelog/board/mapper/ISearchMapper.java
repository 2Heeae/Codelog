package com.spring.codelog.board.mapper;

import java.util.List;

import com.spring.codelog.board.model.BoardVO;

public interface ISearchMapper {
	
	//검색 결과 리스트 보여주기
	List<BoardVO> search(String keyword);

}
