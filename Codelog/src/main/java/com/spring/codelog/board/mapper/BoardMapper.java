package com.spring.codelog.board.mapper;

import com.spring.codelog.board.commons.ImgVO;
import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.model.UploadVO;

public interface BoardMapper {
 public void write(BoardVO vo);

 public void image(ImgVO vo);
}