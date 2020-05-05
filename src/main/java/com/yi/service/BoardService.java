package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.BoardVO;
import com.yi.domain.Criteria;
import com.yi.domain.SearchCriteria;
import com.yi.persistence.BoardDAO;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO dao;
	
	@Transactional
	public void create(BoardVO vo) throws Exception {
		dao.insert(vo);
		
		//파일 이름을 tbl_attach추가
		for(String file: vo.getFiles()) {
			dao.addAttach(file);	//LAST_INSERT_ID() 함수를 통해 bno를 알 수 있음
		}
	}
	
	public BoardVO readByNo(int bno) throws Exception {
		return dao.readAndAttachByBno(bno);		//dao.readByNo(bno);
	}
	
	public List<BoardVO> list() throws Exception{
		return dao.list();
	}
	
	public void update(BoardVO vo) throws Exception{
		dao.update(vo);
	}
	
	public void delete(int bno) throws Exception{
		dao.delete(bno);
	}
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception{
		return dao.listCriteria(cri);
	}

	public int totalCount() throws Exception {
		return dao.totalCount();
	}
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return dao.listSearchCriteria(cri);
	}
	
	public int totalSearchCount(SearchCriteria cri) throws Exception {
		return dao.totalSearchCount(cri);
	}
	
	public void removeAttach(String fullName) throws Exception {
		dao.removeAttach(fullName);
	}
}
