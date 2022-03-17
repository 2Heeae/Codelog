package com.spring.codelog.board.util;

import javax.servlet.http.HttpServletRequest;


public class BoardUtil {

	public boolean ContainImage(HttpServletRequest hsr)
	{
		if( hsr.getParameter("image") != null) return true;
		else return false;
	}
	public boolean ContainThumbnail(HttpServletRequest hsr)
	{
		if(hsr.getParameter("thumbnail") != null) return true;
		else return false;
	}
}