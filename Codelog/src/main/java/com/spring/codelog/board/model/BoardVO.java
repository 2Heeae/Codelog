package com.spring.codelog.board.model;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int bno;            // 게시글 번호
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
	private int viewcnt;        // 게시글 조회수
	private int recnt;            // **게시글 댓글의 수 추가
	
	public int getBno() {
        return bno;
    }
    public void setBno(int bno) {
        this.bno = bno;
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
    public Timestamp getRegdate() {
        return regDate;
    }
    public void setRegdate(Timestamp regDate) {
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
    // toString()
    @Override
    public String toString() {
        return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
                + regDate + ", viewcnt=" + viewcnt + ", recnt=\" + recnt + \"]";
    }
	
}

