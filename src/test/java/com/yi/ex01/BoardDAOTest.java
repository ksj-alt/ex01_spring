package com.yi.ex01;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.BoardVO;
import com.yi.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDAOTest {
	
	@Autowired
	private BoardDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
//	@Test
	public void testInsert() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setTitle("게시글을 등록합니다.");
		vo.setContent("게시글의 내용입니다.");
		vo.setWriter("user00");
		dao.insert(vo);
	}
	
//	@Test
	public void testSelectByNo() throws Exception {
		dao.readByNo(1);
	}
	
//	@Test
	public void testList() throws Exception {
		dao.list();
	}
	
//	@Test
	public void testUpdate() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setBno(1);
		vo.setTitle("게시글 등록");
		vo.setContent("게시글 내용");
		
		dao.update(vo);
	}
	
//	@Test
	public void testDelete() throws Exception {
		dao.delete(1);
	}
}
