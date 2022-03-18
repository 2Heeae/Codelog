package com.spring.codelog.user.service;

import com.spring.codelog.user.commons.FollowingVO;

public interface IFollowService {
	
	//팔로우기능
	void follow(FollowingVO fvo);
	
	//언팔로우
	void unfollow(FollowingVO fvo);
}
