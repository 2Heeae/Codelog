package com.spring.codelog.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.codelog.board.model.ReplyVO;
import com.spring.codelog.board.service.ReplyService;


@RequestMapping("/reply")
@RestController
public class ReplyController {
	
	@Autowired
	ReplyService service;
	// 모댓글 작성
	
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public void replyWrite(@RequestBody ReplyVO vo, HttpSession session) {
		System.out.println("진입은했다!");
		System.out.println("들어온 댓글 내용은? "+vo);
		
		//service.replyWrite(vo);
	}

	// 답글 작성
	
	@RequestMapping(value = "/rereplyWrite")
	public void rereplyWrite(@RequestBody ReplyVO vo, HttpSession session) {
		service.rereplyWrite(vo);   
	}

	// 댓글 리스트
	
	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public List<ReplyVO> replyList(int boardId, HttpSession session) {
		System.out.println("/reply/replyList");
		System.out.println("댓글 리스트"+ service.replyList(boardId));
	    return service.replyList(boardId);
	}

	// 모댓글 삭제
	
	@RequestMapping(value = "/deleteReply")
	public void deleteReply(int no) {
	    service.DeleteReply(no);
	}

	// 답글 삭제
	
	@RequestMapping(value = "/deleteReReply")
	public void deleteReReply(int no) {
		   service.DeleteReReply(no);
	}

}
