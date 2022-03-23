package com.spring.codelog.board.service;

import com.spring.codelog.board.commons.PostLikeVO;

public interface IPostLikeService {
	
	//좋아요 카운트(좋아요 눌러있는지 확인?)
	public int likeCount(String viewUserId, int boardId);
	
	//좋아요 정보(좋아요 누른 사람, 게시물)
	public int getLikeInfo(String viewUserId, int boardId);
	
	//좋아요 올려주기
	public void likePlus(String viewUserId, int boardId);
	
	//좋아요 업데이트?
	public void likeUpdate(PostLikeVO vo);

}