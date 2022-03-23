package com.spring.codelog.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.codelog.board.model.ReplyVO;
import com.spring.codelog.board.service.ReplyService;


@RequestMapping("/reply")
@Controller
public class ReplyController {
	
	@Autowired
	ReplyService service;
	// 모댓글 작성
	@ResponseBody
	@RequestMapping(value = "/replyWrite")
	public void replyWrite(ReplyVO vo, HttpSession session) {
		service.replyWrite(vo);
	}

	// 답글 작성
	@ResponseBody
	@RequestMapping(value = "/rereplyWrite")
	public void rereplyWrite(ReplyVO vo, HttpSession session) {
		service.rereplyWrite(vo);   
	}

	// 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "/replyList")
	public List<ReplyVO> replyList(int boardId, HttpSession session) {
	    return service.replyList(boardId);
	}

	// 모댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteReply")
	public void deleteReply(int no) {
	    service.DeleteReply(no);
	}

	// 답글 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteReReply")
	public void deleteReReply(int no) {
		   service.DeleteReReply(no);
	}

}
