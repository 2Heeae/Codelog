package com.spring.codelog.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.codelog.board.commons.PostLikeVO;
import com.spring.codelog.board.mapper.IPostLikeMapper;

@Service
public class PostLikeService implements IPostLikeService {
	
	@Autowired
	private IPostLikeMapper mapper;

	@Override
	public int likeCount(String viewUserId, int boardId) {
		return mapper.likeCount(viewUserId, boardId);
	}

	@Override
	public int getLikeInfo(String viewUserId, int boardId) {
		return mapper.getLikeInfo(viewUserId, boardId);
	}

	@Override
	public void likePlus(String viewUserId, int boardId) {
		mapper.likePlus(viewUserId, boardId);
	}

	@Override
	public void likeUpdate(PostLikeVO vo) {
		mapper.likeUpdate(vo);
	}

}