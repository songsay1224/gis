package com.say.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.say.mapper.BoardMapper;
import com.say.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	
	 @Autowired
	 private BoardMapper mapper;
	
	  @Override
	    public void enroll(BoardVO board) {
	        
	        mapper.enroll(board);
	        
	    }
	  
	  @Override
	    public List<BoardVO> getList() {
	        
	        return mapper.getList();
	    }
	  
	  @Override        
	    public BoardVO getLatestCoordinate() {
	        // DB에서 BoardVO 형태로 좌표를 가져옴
	        return mapper.getLatestCoordinate();
	    }
	
}
