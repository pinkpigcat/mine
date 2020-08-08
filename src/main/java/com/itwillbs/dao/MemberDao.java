package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.PageBean;

public interface MemberDao {

	
	public void insertMember(MemberBean mb);
	public MemberBean userCheck(MemberBean mb);
	public MemberBean getMember(String id);
	public List<MemberBean> getMemberList();
	public void updateMember(MemberBean memberBean2);
	public void usetDelete(MemberBean memberBean);
	
}
