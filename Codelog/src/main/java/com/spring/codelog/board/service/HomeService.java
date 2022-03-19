package com.spring.codelog.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.codelog.board.mapper.IHomeMapper;
import com.spring.codelog.board.model.BoardVO;

@Service
public class HomeService implements IHomeService {

	@Autowired
	private IHomeMapper mapper;
	@Override
	public List<BoardVO> TPosters(int i) {
		// TODO Auto-generated method stub
		return mapper.TPosters(i);
	}
	
	@Override
	public BoardVO SelectOne(int i) {
		// TODO Auto-generated method stub
		return mapper.SelectOne(i);
	}
	
	@Override
	public BoardVO SelectOneT(int i) {
		// TODO Auto-generated method stub
		return mapper.SelectOneT(i);
	}

	@Override
	public List<BoardVO> RPosters(int i) {
		List<BoardVO> list = mapper.RPosters(i);
		//System.out.println("result: " + list);
		return list;
		
	}

	@Override
	public List<BoardVO> FPosters(String startDate, String endDate, String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int FPCount(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int PCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
