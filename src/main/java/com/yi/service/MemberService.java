package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.MemberVO;
import com.yi.persistence.MemberDAO;

@Service
public class MemberService implements MemberDAO {

	@Autowired
	MemberDAO dao;
	
	@Override
	public void createMember(MemberVO vo) throws Exception {
		dao.createMember(vo);

	}

	@Override
	public MemberVO readMember(String userid) throws Exception {
		return dao.readMember(userid);
	}

	@Override
	public List<MemberVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		dao.updateMember(vo);

	}

}
