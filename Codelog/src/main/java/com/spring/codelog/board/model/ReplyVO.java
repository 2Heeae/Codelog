package com.spring.codelog.board.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVO {
	private Integer rno;        // 댓글 번호
    private Integer board_id;        // 게시글 번호
    private String replytext;    // 댓글 내용
    private String replyer;        // 댓글 작성자
    private String userName;    // 댓글 작성자의 이름(회원의 이름)
    private Date regdate;        // 댓글 작성일자
    private Date updatedate;    // 댓글 수정일자
    
    // Getter/Setter
    public Integer getRno() {
        return rno;
    }
    public void setRno(Integer rno) {
        this.rno = rno;
    }
    public Integer getBoard_id() {
        return board_id;
    }
    public void setBoard_id(Integer board_id) {
        this.board_id = board_id;
    }
    public String getReplytext() {
        return replytext;
    }
    public void setReplytext(String replytext) {
        this.replytext = replytext;
    }
    public String getReplyer() {
        return replyer;
    }
    public void setReplyer(String replyer) {
        this.replyer = replyer;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    public Date getUpdatedate() {
        return updatedate;
    }
    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }
    
    // toString()
    @Override
    public String toString() {
        return "ReplyVO [rno=" + rno + ", board_id=" + board_id + ", replytext=" + replytext + ", replyer=" + replyer
                + ", userName=" + userName + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
    }
    
}
