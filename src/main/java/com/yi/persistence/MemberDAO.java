package com.yi.persistence;

import java.util.List;

import com.yi.domain.MemberVO;

public interface MemberDAO {
	public void createMember(MemberVO vo) throws Exception;
	public MemberVO readMember(String userid) throws Exception;
	public List<MemberVO> list() throws Exception;
	
	public void updateMember(MemberVO vo) throws Exception;
}
