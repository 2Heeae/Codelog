
package com.spring.codelog.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.spring.codelog.board.commons.ImgVO;
import com.spring.codelog.board.model.BoardVO;

public interface IBoardService {
	//글 등록
	void write(BoardVO vo);

	//사진 업로드
	void image(ImgVO vo);
	
	// 게시글 상세보기
    public BoardVO read(int boardId) ;
    // 게시글 수정 불러오기
    public BoardVO modify(int boardId);
    //  게시글 수정
    public void update(BoardVO vo) ;
    //  게시글 삭제
    public void delete(int boardId) ;
    //  게시글 전체 목록
    public List<BoardVO> listAll() ;
    //  게시글 조회
    public void increaseHit(int boardId, HttpSession session) ;
    
	//게시글 좋아요 증가(유저 기준 아님 상세보기 해당 게시글 기준임)
	public void totalLikeUp(int boardId);
		
	//게시글 좋아요 감소(유저 기준 아님 상세보기 해당 게시글 기준임)
	public void totalLikeDown(int boardId);
	
    
}

