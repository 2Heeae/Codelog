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
	private int board_id;        // 게시글 번호
	private String user_id;
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
	private int viewcnt;        // 게시글 조회수
	private int recnt;            // **게시글 댓글의 수 추가
	
	public int getBoard_id() {
        return board_id;
    }
    public void setBoard_id(int board_id) {
        this.board_id = board_id;
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
    public int getViewcnt() {
        return viewcnt;
    }
    public void setViewcnt(int viewcnt) {
        this.viewcnt = viewcnt;
    }
    public int getRecnt() {
        return recnt;
    }
 
    public void setRecnt(int recnt) {
        this.recnt = recnt;
    }
  
	
}

