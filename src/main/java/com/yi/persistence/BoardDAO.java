package com.yi.persistence;

import java.util.List;

import com.yi.domain.BoardVO;

public interface BoardDAO {
	public void insert(BoardVO vo) throws Exception;
	public BoardVO readByNo(int bno) throws Exception;
	public List<BoardVO> list() throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(int bno) throws Exception;
	
	
}
