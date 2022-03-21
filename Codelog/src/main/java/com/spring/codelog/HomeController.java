package com.spring.codelog;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.codelog.board.model.BoardVO;
import com.spring.codelog.board.service.HomeService;
import com.spring.codelog.user.model.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    		  
	@Autowired
	private	HomeService service;
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model, String fromT, HttpServletRequest request, String allChk) {    
	   
	   System.out.println("---------------------------GET:/ HOME:RECENT-------------------------");
	 
	   
	   System.out.println("formT?: "+fromT); 
	      model.addAttribute("recent", true);
	      model.addAttribute("trending", false);
	      model.addAttribute("i", 3);
	      if(fromT!=null) {
	      if(fromT.equals("true")) {
	    	  model.addAttribute("fromT", true);
	    	  model.addAttribute("fromR", false);

	      }
	      }
	      else {
	    	  model.addAttribute("fromT", false);
	    	  model.addAttribute("fromR", false);
	      }    
	      
	   
	   HttpSession session = request.getSession();
	   if(session.getAttribute("loginSession")!=null) {
		   UserVO login = (UserVO)session.getAttribute("loginSession");
		 		   
		   System.out.println("로그인 중 id: "+login.getUserId());
		   System.out.println("들어온 allChk"+allChk);
		   
		   if(allChk == null) {
			   System.out.println("출력:팔로워");
			   model.addAttribute("allChk", "fol");
			   System.out.println("Posters: "+service.FPosters(login.getUserId()));		  
			   model.addAttribute("Posters", service.FPosters(login.getUserId()));
		   }
		   else
		   {
			   if(allChk.equals("fol")) {
				   System.out.println("출력:팔로워");
				   model.addAttribute("allChk", "fol");
				   System.out.println("Posters: "+service.FPosters(login.getUserId()));		  
				   model.addAttribute("Posters", service.FPosters(login.getUserId()));

			   }else if(allChk.equals("all")) {
				   System.out.println("출력:모든사람");
				   model.addAttribute("allChk", "all");
				   System.out.println("Posters: "+service.RPosters()); 
				   model.addAttribute("Posters", service.RPosters());
		    }

				   
				   }
			   
		   System.out.println("------------------------------------------------------");

		   
		   return "home";
		   
		   
	   }
	   
	   System.out.println("Posters: "+service.RPosters()); 
	   model.addAttribute("Posters", service.RPosters());
	  
     
	   System.out.println("------------------------------------------------------");

      return "home";
   }
   
   @ResponseBody
   @RequestMapping(value = "/radd", method = RequestMethod.POST)
   public List<BoardVO> RHome(Model model, @RequestBody Map<String,Integer> info,
		   HttpServletRequest request, 
			HttpServletResponse response) {
	   
	   System.out.println("--------------------POST:/radd HOME:RECENT:ADD--------------------");

	   
	   List<BoardVO> list = new ArrayList<BoardVO>();
	   
	   
	   HttpSession session = request.getSession();
	   if(session.getAttribute("loginSession")!=null) {
		   UserVO login = (UserVO)session.getAttribute("loginSession");
		 
		   System.out.println("출력:팔로우");
		   System.out.println("로그인 중 id: "+login.getUserId());
		   System.out.println("Posters: "+service.FAPosters(info.get("boardId"), login.getUserId()));
		   list = service.FAPosters(info.get("boardId"),login.getUserId());
		   System.out.println("-----------------------------------------------------------------------");

		   return list;

		   
	   }
	   
	   
	   
	   list = service.RAPosters(info.get("i"),info.get("boardId"));
	   
	   System.out.println("추가 리스트는 "+list);
	   
	   
	   System.out.println("-----------------------------------------------------------------------");

	return list;

   }
   
   
   @ResponseBody
   @RequestMapping(value = "/tadd", method = RequestMethod.POST)
   public List<BoardVO> THome(Model model, @RequestBody Map<String,Integer> info,
		   HttpServletRequest request, 
			HttpServletResponse response,String period) {
	   
	   System.out.println("--------------------POST:/TAdd HOME:TRENDING:ADD--------------------");

	   
	   List<BoardVO> list = new ArrayList<BoardVO>();
	   
	   

	   System.out.println("기간은?: "+period);
	   Calendar calendar = Calendar.getInstance();
	   if(period == null) {
		   calendar.add(Calendar.DATE, -7);
		   model.addAttribute("period", "week");

	   }else  {
	   if(period == "week") {
	   calendar.add(Calendar.DATE, -7);
	   model.addAttribute("period", "week");

	   }else if(period == "month") {
	   calendar.add(Calendar.MONTH, -1);
	   model.addAttribute("period", "month");


	   }else if(period == "year") {
	   calendar.add(Calendar.YEAR, -1);
	   model.addAttribute("period", "year");

	   
	   }else if(period == "day") {
	   calendar.add(Calendar.DATE, -1);
	   model.addAttribute("period", "day");
	   }
	   }
	   Date date = calendar.getTime();
	   
	   String pattern = "yyyy-MM-dd";
	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	   String start = simpleDateFormat.format(date);
	   String end = simpleDateFormat.format(new Date());
	   System.out.println("끝 날짜: "+end);
	   System.out.println("시작 날짜: "+start);
	   
	   System.out.println("추가 리스트는 : "+service.TAPosters(info.get("likes"),start, end));
	   list = service.TAPosters(info.get("likes"),start, end);

	   System.out.println("-----------------------------------------------------------------------");

	   
	return list;

   }
   
   @RequestMapping(value = "/", method = RequestMethod.POST)
   public String home2(Locale locale, Model model, String fromT, HttpServletRequest request, String allChk) {
	   
	   System.out.println("---------------------------POST:/ HOME:RECENT-------------------------");

	   System.out.println("포스트 formT "+fromT);      
	      model.addAttribute("recent", true);
	      model.addAttribute("trending", false);
	      if(fromT!=null) {
	      if(fromT.equals("true")) {
	    	  model.addAttribute("fromT", true);
	    	  model.addAttribute("fromR", false);
	      }
	      }
	      else {
	    	  model.addAttribute("fromT", false);
	    	  model.addAttribute("fromR", false);     
	      }     
	   
	   HttpSession session = request.getSession();
	   if(session.getAttribute("loginSession")!=null) {
		   UserVO login = (UserVO)session.getAttribute("loginSession");
		   
		   if(allChk == null) {
			   System.out.println("출력:팔로워");
			   model.addAttribute("allChk", "fol");
			   System.out.println("Posters: "+service.FPosters(login.getUserId()));		  
			   model.addAttribute("Posters", service.FPosters(login.getUserId()));
		   }
		   else
		   {
			   if(allChk.equals("fol")) {
				   System.out.println("출력:팔로워");
				   model.addAttribute("allChk", "fol");
				   System.out.println("Posters: "+service.FPosters(login.getUserId()));		  
				   model.addAttribute("Posters", service.FPosters(login.getUserId()));

			   }else if(allChk.equals("all")) {
				   System.out.println("출력:모든사람");
				   model.addAttribute("allChk", "all");
				   System.out.println("Posters: "+service.RPosters()); 
				   model.addAttribute("Posters", service.RPosters());
		    }

		   
		   }
		   
		   System.out.println("로그인 중 id: "+login.getUserId());
		   System.out.println("Posters: "+service.FPosters(login.getUserId()));
		   model.addAttribute("Posters", service.FPosters(login.getUserId()));
		   System.out.println("-----------------------------------------------------------------------");

		   return "home";

		   
	   }
	   System.out.println("Posters: "+service.RPosters());
	   model.addAttribute("Posters", service.RPosters());
	 
    
	   System.out.println("-----------------------------------------------------------------------");

      return "home";
   }
   
   @RequestMapping(value = "/trending", method = RequestMethod.GET)
   public String trending(Locale locale, Model model, String fromR, String period) {
	   
	   //service.TPosters(); 
	   System.out.println("기간은?: "+period);
	   Calendar calendar = Calendar.getInstance();
	   if(period ==null) {
		   calendar.add(Calendar.DATE, -7);
		   model.addAttribute("period", "week");

	   }else  {
		   if(period.equals("week")) {
			   calendar.add(Calendar.DATE, -7);
			   model.addAttribute("period", "week");

			   }else if(period.equals("month")) {
			   calendar.add(Calendar.MONTH, -1);
			   model.addAttribute("period", "month");


			   }else if(period.equals("year")) {
			   calendar.add(Calendar.YEAR, -1);
			   model.addAttribute("period", "year");

			   
			   }else if(period.equals("day")) {
	   calendar.add(Calendar.DATE, -1);
	   model.addAttribute("period", "day");
	   }
	   }
	   Date date = calendar.getTime();
	   
	   String pattern = "yyyy-MM-dd";
	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	   String start = simpleDateFormat.format(date);
	   String end = simpleDateFormat.format(new Date());
	   System.out.println("끝 날짜: "+end);
	   System.out.println("시작 날짜: "+start);

	   System.out.println("Posters: "+service.TPosters(start, end));
	   model.addAttribute("Posters", service.TPosters(start, end));
	 
	  System.out.println("겟 formR "+fromR);      
      model.addAttribute("trending", true);
      model.addAttribute("recent", false);
      if(fromR!=null) {
      if(fromR.equals("true")) {
    	  model.addAttribute("fromR", true);
          model.addAttribute("fromT", false);

      }
      }
      else {
    	  model.addAttribute("fromR", false);
          model.addAttribute("fromT", false);    
      }
      return "home";
   }
   
   @RequestMapping(value = "/trending", method = RequestMethod.POST)
   public String trending2(Locale locale, Model model, String fromR, String period) {	
	   
	   
	   System.out.println("--------------------POST:/trending HOME:TRENDING--------------------");

	   
	   System.out.println("기간은?: "+period);
	   Calendar calendar = Calendar.getInstance();
	   if(period == null) {
		   calendar.add(Calendar.DATE, -7);
		   model.addAttribute("period", "week");

	   }else  {
	   if(period.equals("week")) {
	   calendar.add(Calendar.DATE, -7);
	   model.addAttribute("period", "week");

	   }else if(period.equals("month")) {
	   calendar.add(Calendar.MONTH, -1);
	   model.addAttribute("period", "month");


	   }else if(period.equals("year")) {
	   calendar.add(Calendar.YEAR, -1);
	   model.addAttribute("period", "year");

	   
	   }else if(period.equals("day")) {
	   calendar.add(Calendar.DATE, -1);
	   model.addAttribute("period", "day");
	   }
	   }
	   Date date = calendar.getTime();
	   
	   String pattern = "yyyy-MM-dd";
	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	   String start = simpleDateFormat.format(date);
	   String end = simpleDateFormat.format(new Date());
	   System.out.println("끝 날짜: "+end);
	   System.out.println("시작 날짜: "+start);
	   
	 
	   System.out.println("Posters: "+service.TPosters(start, end));
	   model.addAttribute("Posters", service.TPosters(start, end));
	 
	  System.out.println("포스트 formR "+fromR);
      model.addAttribute("trending", true);
      model.addAttribute("recent", false);
      if(fromR!=null) {
      if(fromR.equals("true")) {
    	  model.addAttribute("fromR", true);
          model.addAttribute("fromT", false);
      }
      }
      else {
    	  model.addAttribute("fromR", false);
          model.addAttribute("fromT", false);
      }
      
	   System.out.println("-----------------------------------------------------------------------");

      return "home";
   }
 
}
