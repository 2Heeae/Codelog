package com.spring.codelog.user.mapper;

import java.util.List;

import com.spring.codelog.user.commons.FollowingVO;

public interface IFollowMapper {
	
	//팔로우기능
	void follow(FollowingVO fvo);
	
	//언팔로우
	void unfollow(FollowingVO fvo);
	
	//팔로우 유무
	int isFollow(FollowingVO fvo);
	
	//팔로우 리스트 조회
	List<FollowingVO> selectActiveUserList(String userId);
	
	//팔로워 리스트 조회
	List<FollowingVO> selectPassiveUserList(String toId);
	
	//
}
