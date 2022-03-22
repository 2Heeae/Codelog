package com.spring.codelog.board.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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

		@RequestMapping(value = "/getWrite", method = RequestMethod.GET)
	public String write(HttpServletRequest request ,Model model)
	{

		return "board/write";

	}

	@RequestMapping(value = "/write", method = {RequestMethod.POST})
	public String write(BoardVO vo, RedirectAttributes ra, HttpServletRequest hsr) {

		
		System.out.println("글 작성 요청");
		service.write(vo);
		ra.addFlashAttribute("msg", "글 작성 완료");

		return "redirect:/";
	}
	
	// 게시글 상세내용 조회, 게시글 조회수 증가 처리
    // @RequestParam : get/post방식으로 전달된 변수 1개
    // HttpSession 세션객체
    @RequestMapping(value="/board", method=RequestMethod.GET)
    public ModelAndView home(@RequestParam int boardId, HttpSession session) {
        // 조회수 증가 처리
        service.increaseHit(boardId, session);
        // 모델(데이터)+뷰(화면)를 함께 전달하는 객체
        ModelAndView mav = new ModelAndView();
        // 뷰의 이름
        mav.setViewName("board/board");
        // 뷰에 전달할 데이터
        mav.addObject("dto", service.read(boardId));
        return mav;
    }
	
 //  게시글 수정
    // 폼에서 입력한 내용들은 @ModelAttribute BoardVO vo로 전달됨
    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public String update(@ModelAttribute BoardVO vo) {
        service.update(vo);
        return "redirect:/";
    }
    
    //  게시글 삭제
    @RequestMapping("delete.do")
    public String delete(@RequestParam int boardId) {
        service.delete(boardId);
        return "redirect:/";
    }
	


	

}
