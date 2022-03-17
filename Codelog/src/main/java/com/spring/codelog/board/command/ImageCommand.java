package com.spring.codelog.board.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.codelog.board.commons.ImgVO;
import com.spring.codelog.board.mapper.BoardMapper;
import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.util.BoardUtil;
@Component
public class ImageCommand implements Command{
	@Autowired
	private BoardMapper mapper;
	private BoardUtil util;
        public void execute(HttpServletRequest hsr, BoardVO vo, ImgVO vo2) {
        	vo2.setImgPath(hsr.getParameter("thumbnail")); // write.jsp 페이지의 썸네일 이미지 파일의 주소
    		mapper.image(vo2); // 넘긴 주소값을 ImageMapper에게 넘긴 뒤 image 테이블에 insert 구문 실행
    		System.out.println("썸네일 등록 완료");
    		
    		if(util.ContainImage(hsr))
    		{
    			vo2 = null;
    			vo2.setImgPath(hsr.getParameter("image"));
    			mapper.image(vo2);
    		}
    		System.out.println("작성 완료");
        }
}
