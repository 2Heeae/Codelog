package com.spring.codelog.board.mapper;

import java.util.List;

import com.spring.codelog.board.commons.ImgVO;
import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.user.model.UserVO;

public interface BoardMapper {
 public void write(BoardVO vo);

 public void image(ImgVO vo);
 
 public List<BoardVO> getList();
 
 public BoardVO test(int board_id);
}
