package com.spring.codelog.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.codelog.board.model.PictureTO;
import com.spring.codelog.board.model.ReplyTO;
import com.spring.codelog.board.service.ReplyDAO;

@Controller
public class PictureController {
	ReplyDAO dao = new ReplyDAO();
	// 모댓글 작성
	@ResponseBody
	@RequestMapping(value = "/picture_write_reply.do")
	public PictureTO write_reply(@RequestParam String no, @RequestParam String content, HttpSession session) {

	    ReplyTO to = new ReplyTO();
	    

	    // 게시물 번호 세팅
	    to.setBno(no);

	    // 댓글 내용 세팅
	    to.setContent(content);

	    // 댓글작성자 nick을 writer로 세팅
	    to.setWriter((String) session.getAttribute("nick"));

	    // +1된 댓글 갯수를 담아오기 위함
	    PictureTO pto = dao.pictureWriteReply(to);

	    return pto;
	}

	// 답글 작성
	@ResponseBody
	@RequestMapping(value = "/picture_write_rereply.do")
	public PictureTO write_rereply(@RequestParam String no, @RequestParam String bno, @RequestParam String content,
	        HttpSession session) {

	    ReplyTO to = new ReplyTO();

	    // 게시물 번호 세팅
	    to.setBno(bno);

	    // grp, grps, grpl 은 ReplyTO에 int로 정의되어 있기 때문에 String인 no를 int로 변환해서 넣어준다.
	    // 모댓글 번호 no를 grp으로 세팅한다.
	    to.setGrp(Integer.parseInt(no));

	    // 답글은 깊이가 1이되어야 하므로 grpl을 1로 세팅한다.
	    to.setGrpl(1);

	    // 답글 내용 세팅
	    to.setContent(content);

	    // 답글작성자 nick을 writer로 세팅
	    to.setWriter((String) session.getAttribute("nick"));

	    // +1된 댓글 갯수를 담아오기 위함
	    PictureTO pto = dao.pictureWriteReReply(to);

	    return pto;
	}

	// 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "/picture_replyList.do")
	public ArrayList<ReplyTO> reply_list(@RequestParam String no, HttpSession session) {

	    ReplyTO to = new ReplyTO();

	    // 가져올 댓글 리스트의 게시물번호를 세팅
	    to.setBno(no);

	    ArrayList<ReplyTO> replyList = new ArrayList();

	    replyList = dao.replyList(to);

	    return replyList;
	}

	// 모댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/picture_delete_reply.do")
	public PictureTO picture_delete_reply(@RequestParam String no, @RequestParam String bno ) {

	    ReplyTO to = new ReplyTO();

	    // 모댓글 번호 세팅
	    to.setNo(no);

	    // 게시물 번호 세팅
	    to.setBno(bno);

	    // 갱신된 댓글 갯수를 담아오기 위함
	    PictureTO pto = dao.pictureDeleteReply(to);

	    return pto;
	}

	// 답글 삭제
	@ResponseBody
	@RequestMapping(value = "/picture_delete_rereply.do")
	public PictureTO delete_rereply(@RequestParam String no, @RequestParam String bno, @RequestParam int grp) {

	    ReplyTO to = new ReplyTO();

	    // 답글 번호 세팅 - 답글 삭제하기 위해서 필요함
	    to.setNo(no);

	    // 게시물 번호 세팅 - p_board 의 reply+1하기 위해 필요함
	    to.setBno(bno);

	    // grp 세팅(모댓글이 뭔지) - 모댓글은 삭제를 해도 답글이 있으면 남아있게 되는데 답글이 모두 삭제되었을 때 모댓글도 삭제하기 위해
	    // 필요함
	    to.setGrp(grp);

	    // 갱신된 댓글 갯수를 담아오기 위함
	    PictureTO pto = dao.pictureDeleteReReply(to);

	    return pto;
	}

}
