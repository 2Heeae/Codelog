package com.spring.codelog;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.codelog.board.mapper.IBoardMapper;
import com.spring.codelog.board.mapper.IHomeMapper;
import com.spring.codelog.board.model.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mvc-config.xml")
public class FreeBoardMapperTest {
	@Autowired
	   private IBoardMapper mapper;
	   
	   @Test
	   public void registTest() {
		   
		   Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      for(int i=1; i<=30; i++) {
	         BoardVO vo = new BoardVO();
	         
	         vo.setUserId("qweasdzxc"+i);
	         vo.setTitle("테스트 제목 " + i);
	         vo.setWriter("작성자"+i);
	         vo.setContent("테스트 글쓰기 내용입니다. " + i);
	         vo.setTags("태그"+i);
	         vo.setImgPath("이미지경로"+i);
	         vo.setHit(i);
	         vo.setLikes(i);
	         vo.setRegDate(null);
	         vo.setPreview("미리보기"+i);
	         vo.setThumbnail("썸네일경로"+i);
	         vo.setViewAll("1");
	         mapper.write(vo);
	      }
	   }


}
