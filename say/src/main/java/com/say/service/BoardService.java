package com.say.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.say.model.BoardVO;

@Service
public interface BoardService {
	
     //게시판 등록
	  public void enroll(BoardVO board);	
	  
	 //게시판 목록
	  public List<BoardVO> getList();
	  
	  BoardVO getLatestCoordinate();
	  
  
}
