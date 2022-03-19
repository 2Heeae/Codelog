package com.spring.codelog.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.codelog.board.mapper.IReplyMapper;
import com.spring.codelog.board.model.ReplyVO;

@Service
public class ReplyService implements IReplyService{

	@Inject
    IReplyMapper replyMapper;
    
    // 댓글 목록
    @Override
    public List<ReplyVO> list(Integer rno) {
        return replyMapper.list(rno);
    }
    // 댓글 작성
    @Override
    public void create(ReplyVO vo) {
    	replyMapper.create(vo);
    }
    // 댓글 수정
    @Override
    public void update(ReplyVO vo) {
        // TODO Auto-generated method stub
 
    }
    // 댓글 삭제
    @Override
    public void delete(Integer rno) {
        // TODO Auto-generated method stub
 
    }
    
}
