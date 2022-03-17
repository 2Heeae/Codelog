package com.spring.codelog.board.command;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.codelog.board.commons.ImgVO;
import com.spring.codelog.board.mapper.BoardMapper;
import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.util.BoardUtil;



@Component
public class WriteCommand implements Command {
	@Autowired
	private BoardMapper mapper;
	private BoardUtil util;
	@Override
	public void execute(HttpServletRequest hsr, BoardVO vo, ImgVO vo2) {

		System.out.println("커맨드 객체 호출");

		mapper.write(vo); //form 태그로 전달받은 파라미터 값들을 BoardVO의 변수들과 각각 대응한 뒤 Mapper 호출
		System.out.println("BOARDID : "+vo.getBoardId());
		if(util.ContainThumbnail(hsr)) { //WriteVO에게 썸네일 값이 전달 되었을 경우(NULL이 아닐 경우), 이미지 데이터 처리 진행
		System.out.println("이미지 등록중");
		
		vo2.setImgPath(hsr.getParameter("thumbnail")); // write.jsp 페이지의 썸네일 이미지 파일의 주소
		mapper.image(vo2); // 넘긴 주소값을 ImageMapper에게 넘긴 뒤 image 테이블에 insert 구문 실행
		System.out.println("썸네일 등록 완료");
		}
		else if(hsr.getParameter("image") != null)
		{
			vo2 = null;
			vo2.setImgPath(hsr.getParameter("image"));
		}
		System.out.println("작성 완료");
	
        
	

	}

}
