package com.spring.codelog.board.model;



import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BoardVO2 {
	private int rn;
	private int boardId;
	private String userId;
	private String title;
	private String writer;
	private String tags;
	private String content;
	private String imgPath;
	private int hit;
	private int likes;
	private Timestamp regDate;
	private String preview;
	private String thumbnail;
	private String  viewAll;
	
}
