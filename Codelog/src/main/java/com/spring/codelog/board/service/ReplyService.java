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
		System.out.println("서비스로 넘어온 값은 "+vo);
		mapper.replyWrite(vo.getBno(), vo.getWriter(), vo.getContent(), vo.getUserNo());
		
		// proj_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅			
		mapper.replyUp(vo.getBno());
	}
	
	// 대댓글 작성
	public void rereplyWrite(ReplyVO vo) {
		// p_reply 테이블에 값 추가
		int grps = mapper.getGrps(vo.getGrp());
		System.out.println("grps의 값은? "+grps);
		
		mapper.rereplyWrite(vo.getBno(), vo.getGrp(), grps, vo.getWriter(), vo.getContent(),vo.getUserNo());
		
		// proj_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅			
		mapper.replyUp(vo.getBno());
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