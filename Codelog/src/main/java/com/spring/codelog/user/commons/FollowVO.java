package com.spring.codelog.user.commons;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FollowVO {
	private int id;
	private int activeUser;
	private int passiveUser;
	private Timestamp regDate;
	
	private String activeUserId;
	private String passiveUserId;
	
	
	
}
