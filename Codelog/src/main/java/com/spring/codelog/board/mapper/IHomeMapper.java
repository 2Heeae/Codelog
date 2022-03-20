
package com.spring.codelog.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.codelog.board.model.BoardVO;

public interface IHomeMapper {

	List<BoardVO> TPosters(int i);

	List<BoardVO> RPosters();
	
	List<BoardVO> RAPosters(@Param("i") int keyword,
			@Param("boardId") int boardId);

	

	List<BoardVO> FPosters(String userId);
	
	//BoardVO SelectOne(int i);
	
//	BoardVO SelectOneT(int i);

	
	int FPCount(String userId);
	
	int PCount();

}
