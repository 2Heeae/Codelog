package com.spring.codelog.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.service.BoardService;



@Controller
@RequestMapping("/boardController")
public class BoardController {

	@Autowired
	BoardService service;
	
	@GetMapping("/test")
	public String test() {
		return "home";
	}
	
	@GetMapping("/write")
	public String write(BoardVO vo, RedirectAttributes ra) {
		
		System.out.println("글 작성 요청");
		service.write(vo);
		ra.addFlashAttribute("msg", "글 작성 완료");

		return "redirect:/";
	}
	
	

}
