package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDao;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.PageBean;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDao memberDao;

	@Override
	public void insertMember(MemberBean mb) {
		System.out.println("MemberServiceImpl insertMember()");
		
		mb.setReg_date(new Timestamp(System.currentTimeMillis()));

		memberDao.insertMember(mb);
		
	}
	

	@Override
	public MemberBean userCheck(MemberBean bean) {
		
		System.out.println("MemberServiceImpl userCheck()");
		
		return memberDao.userCheck(bean);
		
	}

	@Override
	public MemberBean getMember(String id) {
		System.out.println("MemberBean getMember(String id) service");
		return memberDao.getMember(id);
		
		
	}

	@Override
	public List<MemberBean> getMemberList() {
		System.out.println("memberServiceImpl getMemberList()");
		List<MemberBean>memlist = memberDao.getMemberList();
		
	
		
		return memlist ;
		
//List<mBean>list=memDao.getMemberList();
		
//		return list;
		
	}




	@Override
	public void updateMember(MemberBean memberBean2) {
		System.out.println("memberServiceImpl updateMember()");
		System.out.println("아이디 확인 : "+memberBean2.getId());
		System.out.println("이름 확인 : "+memberBean2.getName());
		memberDao.updateMember(memberBean2);
		
		
		
	}


	@Override
	public void userDelete(MemberBean memberBean) {
		System.out.println("memberServiceImpl userDelete");
		memberDao.usetDelete(memberBean);
		
	}








}
