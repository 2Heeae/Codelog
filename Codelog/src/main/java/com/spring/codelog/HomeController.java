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
   public String home(Locale locale, Model model, String fromT, HttpServletRequest request) {    
	   Calendar calendar = Calendar.getInstance();
	   calendar.add(Calendar.DAY_OF_MONTH, -7);
	   Date date = calendar.getTime();
	   
	   String pattern = "yyyy-MM-dd";
	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	   String startDate = simpleDateFormat.format(date);
	   String endDate = simpleDateFormat.format(new Date());
	   System.out.println("끝 날짜: "+endDate);
	   System.out.println("시작 날짜: "+startDate);
	   
	   HttpSession session = request.getSession();
	   if(session.getAttribute("loginSession")!=null) {
		   UserVO login = (UserVO)session.getAttribute("loginSession");
		 
		  
		   
		   service.FPosters(login.getUserId());
		   
	   }
	   
	   System.out.println("Posters: "+service.RPosters());
	  
	   model.addAttribute("Posters", service.RPosters());
	  
      System.out.println("겟 formT "+fromT); 
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
      return "home";
   }
   
   @ResponseBody
   @RequestMapping(value = "/radd", method = RequestMethod.POST)
   public List<BoardVO> RHome(Model model, @RequestBody Map<String,Integer> info,
		   HttpServletRequest request, 
			HttpServletResponse response) {
	   
	   List<BoardVO> list = new ArrayList<BoardVO>();
	   
	   System.out.println("boardId는 " + info.get("boardId"));
	   
	   list = service.RAPosters(info.get("i"),info.get("boardId"));
	   
	   
	   /*
	   //int t = Integer.parseInt(i);
	   System.out.println("recent radd");
	   System.out.println("추가포스터 로드 i값은 "+i);
	   int t = i.get("i");
	   System.out.println("t값은 "+t);
	   Map<String, BoardVO> map = new HashMap<String, BoardVO>();
	
if(service.SelectOne(t*3+3) != null) {
		   System.out.println("추가할꺼있어");
		 //  map.put("title", service.SelectOne(t*3+1).getTitle());
		 //  map.put("content", service.SelectOne(t*3+1).getContent());
		   System.out.println(service.SelectOne(t*3+1));
		//  	("RPosters", service.RPosters(t));
		   map.put("i1",service.SelectOne(t*3+1) );
		   map.put("i2", service.SelectOne(t*3+2) );
		   map.put("i3", service.SelectOne(t*3+3) );

	    System.out.println("i값은: "+(t+1));
	   }
	   else {
		   System.out.println("추가할꺼없어");
		     //map.put("empty",null );
		   map.put("i1", null);

	   }
	   */
	return list;

   }
   
   
   @ResponseBody
   @RequestMapping(value = "/tadd", method = RequestMethod.POST)
   public Map<String, BoardVO> THome(Model model, @RequestBody Map<String,Integer> i,
		   HttpServletRequest request, 
			HttpServletResponse response) {
	   //int t = Integer.parseInt(i);
	   System.out.println("trending tadd");
	   System.out.println("추가포스터 로드 i값은 "+i);
	   int t = i.get("i");
	   System.out.println("t값은 "+t);
	   Map<String, BoardVO> map = new HashMap<String, BoardVO>();

if(service.SelectOne(t*3+3) != null) {
		   System.out.println("추가할꺼있어");
		 //  map.put("title", service.SelectOne(t*3+1).getTitle());
		 //  map.put("content", service.SelectOne(t*3+1).getContent());
		   System.out.println(service.SelectOneT(t*3+1));
		//  	("RPosters", service.RPosters(t));
		   
		   System.out.println("Posters1: "+service.SelectOneT(t*3+1));
		   System.out.println("Posters2: "+service.SelectOneT(t*3+2));
		   System.out.println("Posters3: "+service.SelectOneT(t*3+3));
		   
		   map.put("i1",service.SelectOneT(t*3+1) );
		   map.put("i2", service.SelectOneT(t*3+2) );
		   map.put("i3", service.SelectOneT(t*3+3) );

	    System.out.println("i값은: "+(t+1));
	   }
	   else {
		   System.out.println("추가할꺼없어");
		     //map.put("empty",null );
		   map.put("i1", null);

	   }
	return map;

   }
   
   @RequestMapping(value = "/", method = RequestMethod.POST)
   public String home2(Locale locale, Model model, String fromT) {
	   
	  
	   System.out.println("Posters: "+service.RPosters());
	   model.addAttribute("Posters", service.RPosters());
	 
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
      return "home";
   }
   
   @RequestMapping(value = "/trending", method = RequestMethod.GET)
   public String trending(Locale locale, Model model, String fromR) {
	   
	   //service.TPosters(); 
	   

	   System.out.println("Posters1: "+service.TPosters(0));
	   System.out.println("Posters2: "+service.TPosters(1));
	   System.out.println("Posters3: "+service.TPosters(2));
	   model.addAttribute("Posters1", service.TPosters(0));
	   model.addAttribute("Posters2", service.TPosters(1));
	   model.addAttribute("Posters3", service.TPosters(2));
	   
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
   public String trending2(Locale locale, Model model, String fromR) {	
	   
	   System.out.println("Posters1: "+service.TPosters(0));
	   System.out.println("Posters2: "+service.TPosters(1));
	   System.out.println("Posters3: "+service.TPosters(2));
	   model.addAttribute("Posters1", service.TPosters(0));
	   model.addAttribute("Posters2", service.TPosters(1));
	   model.addAttribute("Posters3", service.TPosters(2));
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
      return "home";
   }
}
