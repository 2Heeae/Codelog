package com.spring.codelog.board.mapper;

import java.util.List;

import com.spring.codelog.board.commons.ImgVO;
import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.model.UploadVO;

public interface BoardMapper {
 public void write(BoardVO vo);

 public void image(ImgVO vo);
 
 public BoardVO test(int bno);
}
