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
@AllArgsConstructor
@ToString
public class BoardVO {
	private int boardId;        // 게시글 번호
	private String userId;
	private String title;
	private String writer;
	private String tags;
	private String content;
	private String imgPath;
	private int likes;
	private Timestamp regDate;
	private String preview;
	private String thumbnail;
	private String  viewAll;
	private int hit;        // 게시글 조회수
	private int recnt;            // **게시글 댓글의 수 추가
	private int userNo;
	
	public int getboardId() {
        return boardId;
    }
    public void setboardId(int boardId) {
        this.boardId = boardId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public Timestamp getRegDate() {
        return regDate;
    }
    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }
    public int getHit() {
        return hit;
    }
    public void setHit(int hit) {
        this.hit = hit;
    }
    public int getRecnt() {
        return recnt;
    }
 
    public void setRecnt(int recnt) {
        this.recnt = recnt;
    }
  
	
}

