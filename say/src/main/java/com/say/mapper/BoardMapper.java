package com.say.mapper;


import java.util.List;

import com.say.model.BoardVO;

public interface BoardMapper {
	
	
	/* 글 등록 */
    public void enroll(BoardVO board);
    
    public List<BoardVO> getList();
    
    BoardVO getLatestCoordinate();
}
