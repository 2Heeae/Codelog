package com.spring.codelog.board.mapper;

import java.util.List;

import com.spring.codelog.board.model.ReplyVO;

public interface IReplyMapper {
	
	
	public void replyWrite(int bno, int grp, String writer, String content);
	public void	rereplyWrite(int bno, int grp, int grpl, String writer, String content);
	public void replyUp(int bno);
	public	List<ReplyVO> replyList(int bno);
	public void replyNotDelete(int no);
	public void replyDown(int bno);
	
   
}
