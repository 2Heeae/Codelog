package com.spring.codelog.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.codelog.user.commons.FollowingVO;
import com.spring.codelog.user.mapper.IFollowMapper;

@Service
public class FollowService implements IFollowService {

	@Autowired
	private IFollowMapper mapper;
	
	@Override
	public void follow(FollowingVO fvo) {
		mapper.follow(fvo);

	}

	@Override
	public void unfollow(FollowingVO fvo) {
		mapper.unfollow(fvo);

	}

	@Override
	public int isFollow(FollowingVO fvo) {
		return mapper.isFollow(fvo);
	}

	@Override
	public List<FollowingVO> selectActiveUserList(String userId) {
		return mapper.selectActiveUserList(userId);
	}

	@Override
	public List<FollowingVO> selectPassiveUserList(String toId) {
		return mapper.selectPassiveUserList(toId);
	}

}
