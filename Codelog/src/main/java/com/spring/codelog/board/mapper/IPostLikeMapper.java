package com.spring.codelog.board.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.codelog.board.commons.PostLikeVO;

public interface IPostLikeMapper {

	//좋아요 카운트(좋아요 눌러있는지 확인?)
	public int likeCount(@Param("viewUserId") String viewUserId, @Param("boardId") int boardId);

	//좋아요 정보(좋아요 누른 사람, 게시물)
	public int getLikeInfo(@Param("viewUserId") String viewUserId, @Param("boardId") int boardId);

	//좋아요 올려주기
	public void likePlus(@Param("viewUserId") String viewUserId, @Param("boardId") int boardId);

	//좋아요 업데이트?
	public void likeUpdate(PostLikeVO vo);

}