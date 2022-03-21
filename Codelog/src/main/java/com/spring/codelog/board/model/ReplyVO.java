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
    private Integer boardId;        // 게시글 번호
    private String replytext;    // 댓글 내용
    private String replyer;        // 댓글 작성자
    private String userName;    // 댓글 작성자의 이름(회원의 이름)
    private Date regdate;        // 댓글 작성일자
    private Date updatedate;    // 댓글 수정일자
    
    
    // toString()
    @Override
    public String toString() {
        return "ReplyVO [rno=" + rno + ", boardId=" + boardId + ", replytext=" + replytext + ", replyer=" + replyer
                + ", userName=" + userName + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
    }
    
}
