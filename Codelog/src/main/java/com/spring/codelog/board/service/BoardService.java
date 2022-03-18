package com.spring.codelog.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.codelog.board.commons.ImgVO;
import com.spring.codelog.board.mapper.BoardMapper;
import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.util.BoardUtil;




@Service
public class BoardService implements IBoardService {
	@Autowired
       private BoardMapper mapper;
       private BoardUtil util;
	@Override
	public void write(BoardVO vo) {
	    mapper.write(vo);

	}

	@Override
	public void imageUpload(HttpServletRequest hsr, ImgVO vo) {
	      vo.setImgPath(hsr.getParameter("img"));
          mapper.image(vo);
          if(util.ContainThumbnail(hsr)) {
         	 vo.setImgPath(hsr.getParameter("thumbnail"));
         	 mapper.image(vo);
         	 
             }
	}

}
