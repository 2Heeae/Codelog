package com.spring.codelog.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.codelog.user.commons.FollowVO;
import com.spring.codelog.user.mapper.IFollowMapper;

@Service
public class FollowService implements IFollowService {

	@Autowired
	private IFollowMapper mapper;
	
	@Override
	public void follow(FollowVO fvo) {
		mapper.follow(fvo);

	}

	@Override
	public void unfollow(FollowVO fvo) {
		mapper.unfollow(fvo);

	}

	@Override
	public int isFollow(FollowVO fvo) {
		return mapper.isFollow(fvo);
	}

	@Override
	public List<FollowVO> selectActiveUserList(String userId) {
		return mapper.selectActiveUserList(userId);
	}

	@Override
	public List<FollowVO> selectPassiveUserList(String toId) {
		return mapper.selectPassiveUserList(toId);
	}

}
