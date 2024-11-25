package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.dto.Member;

@Service
public class MemberService {

	private MemberDao memberDao;

	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void doJoin(String loginId, String loginPw, String name) {
		memberDao.doJoin(loginId, loginPw, name);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int loginedMemberId) {
		return memberDao.getMemberById(loginedMemberId);
	}

	public void modifyPassword(int loginedMemberId, String loginPw) {
		memberDao.modifyPassword(loginedMemberId, loginPw);
	}
}
