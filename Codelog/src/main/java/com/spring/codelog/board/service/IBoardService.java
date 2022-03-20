package com.spring.codelog.board.service;

import javax.servlet.http.HttpServletRequest;

import com.spring.codelog.board.commons.ImgVO;
import com.spring.codelog.board.model.BoardVO;

public interface IBoardService {
	//글 등록
	void write(BoardVO vo);
	
	void image(ImgVO vo);
    
	
	

    
}
