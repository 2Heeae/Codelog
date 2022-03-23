package com.spring.codelog.board.mapper;

import java.util.List;

import com.spring.codelog.board.model.ReplyTO;

public interface INewReplyMapper {
	
	
	public ReplyTO replyWrite(int bno, int grp, String writer, String content);
	public void replyCheck(int grp);
	public	void replyDeleteAfterRereplyDelete(int grp);
	public ReplyTO	rereplyWrite(int bno, int grp, int grpl, String writer, String content);
	public void replyUp(int no);
	public	List<ReplyTO> replyList(int no);
	public int replyCount(int no);
	public int countRereply(int no);
	public int countRereplyFromrereply(int grp);
	public void replyDelete(int no);
	public void replyNotDelete(int no);
	public void replyDown(int no);
	
   
}
