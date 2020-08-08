package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.PageBean;

public interface MemberService {
public void insertMember(MemberBean mb) ;

public MemberBean userCheck(MemberBean memberBean);

public MemberBean getMember(String id);

public List<MemberBean> getMemberList();

public void updateMember(MemberBean memberBean2);

public void userDelete(MemberBean memberBean);


}
