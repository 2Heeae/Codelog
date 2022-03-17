package com.spring.codelog.board.service;

import java.util.List;

import com.spring.codelog.board.model.BoardVO;

public interface IHomeService {
	
	
	List<BoardVO> TPosters(int i);

	List<BoardVO> RPosters(int i);

	List<BoardVO> FPosters(String startDate, String endDate, String userId);
	
	BoardVO SelectOne(int i);
	
	BoardVO SelectOneT(int i);

	
	int FPCount(String userId);
	
	int PCount();

}