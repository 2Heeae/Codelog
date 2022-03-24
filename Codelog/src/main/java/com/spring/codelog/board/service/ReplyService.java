package com.spring.codelog.board.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.codelog.board.mapper.IReplyMapper;
import com.spring.codelog.board.model.ReplyVO;



@Service
public class ReplyService {

	@Autowired
	private IReplyMapper mapper;
	
	// 댓글 작성
	public void replyWrite(ReplyVO vo) {
		// p_reply 테이블에 값 추가
		mapper.replyWrite(vo.getBno(), vo.getGrp(), vo.getWriter(), vo.getContent());
		
		// proj_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅			
		mapper.replyUp(vo.getNo());
	}
	
	// 대댓글 작성
	public void rereplyWrite(ReplyVO vo) {
		// p_reply 테이블에 값 추가
		mapper.rereplyWrite(vo.getNo(), vo.getGrp(),vo.getGrpl(), vo.getWriter(), vo.getContent());
		
		// proj_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅			
				mapper.replyUp(vo.getNo());
	}
	
	// 댓글 리스트
	public List<ReplyVO> replyList(int boardId){
	//List에 댓글 넣기	
		List<ReplyVO> replyList = new ArrayList<ReplyVO>();
		
		replyList = mapper.replyList(boardId);
		
		return replyList;
	}
	
	// 모댓글 삭제
	public void DeleteReply(int no) {
		// proj_board 테이블에 해당 게시물의 reply수를 -1 하기위한 to세팅		
			mapper.replyDown(no);
			
			// 모댓글 삭제  
			mapper.replyNotDelete(no);			
	}
	
	// 대댓글 삭제
	public void DeleteReReply(int no) {
		// proj_board 테이블에 해당 게시물의 reply수를 -1 하기위한 to세팅		
		mapper.replyDown(no);
		
		// 대댓글 삭제  
		mapper.replyNotDelete(no);	
	}
	
	
	
	
}