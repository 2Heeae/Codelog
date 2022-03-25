package com.spring.codelog.board.mapper;

import java.util.List;

import com.spring.codelog.board.commons.TagVO;
import com.spring.codelog.board.model.BoardVO;

public interface ITagMapper {
	
	//태그 등록
	void registTags(int boardId);
	
	//태그 조회
	List<TagVO> list(String userId);
	
	//태그삭제
	void deleteTags(int tagNo);
	
	//태그검색
	List<BoardVO> searchTags(String tagName);
}
