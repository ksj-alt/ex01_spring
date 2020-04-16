package com.yi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.BoardVO;
import com.yi.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/board/register", method=RequestMethod.GET)
	public String registerGet() {
		return "/board/register";
	}
	
	@RequestMapping(value="/board/register", method=RequestMethod.POST)
	public String registerPost(BoardVO vo) throws Exception {
		System.out.println("register POST --------" + vo);
		
		service.create(vo);
		
		return "redirect:/board/list";	//등록 후, 바로 리스트로 이동
	}
	
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public String list(Model model) throws Exception {
		List<BoardVO> list = service.list();
		model.addAttribute("list", list);
		return "/board/list";
	}
	
	@RequestMapping(value="/board/read", method=RequestMethod.GET)
	public String read(int bno, Model model) throws Exception {
		BoardVO vo = service.readByNo(bno);
		model.addAttribute("board", vo);		
		return "/board/read";
	}
	
	@RequestMapping(value="/board/remove", method=RequestMethod.GET)
	public String remove(int bno, Model model) throws Exception{
		service.delete(bno);
		return "redirect:/board/list";
	}
}
