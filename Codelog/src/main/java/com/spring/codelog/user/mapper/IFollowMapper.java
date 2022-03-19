package com.spring.codelog.user.mapper;

import java.util.List;

import com.spring.codelog.user.commons.FollowVO;

public interface IFollowMapper {
	
	//팔로우기능
	void follow(FollowVO fvo);
	
	//언팔로우
	void unfollow(FollowVO fvo);
	
	//팔로우 유무
	int isFollow(FollowVO fvo);
	
	//팔로우 리스트 조회
	List<FollowVO> selectActiveUserList(String userId);
	
	//팔로워 리스트 조회
	List<FollowVO> selectPassiveUserList(String toId);
	
	
}
