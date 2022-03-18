package com.spring.codelog.user.service;

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

}
