package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.PageBean;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace ="com.itwillbs.mapper.MemberMapper";
	
	@Override
	public void insertMember(MemberBean mb) {
		
		System.out.println("MemberDaoImpl insertMember()");
		sqlSession.insert(namespace+".insertMember",mb);
//		namespace+".insertmember namespace 안에
		
	}

	public MemberBean userCheck(MemberBean mb) {
		System.out.println("MemberDaoImpl userCheck()");
		return sqlSession.selectOne(namespace+".userCheck",mb);
		
	}
	
	
	@Override
	public MemberBean getMember(String id) {
		System.out.println("memberdao get member ");
		return sqlSession.selectOne(namespace+".getMember",id);
	}

	@Override
	public List<MemberBean> getMemberList() {
		System.out.println("MemberDaoImpl getMemberList()");
		
		return sqlSession.selectList(namespace+".getMemberList");
	}

	@Override
	public void updateMember(MemberBean memberBean2) {
		System.out.println("MemberDaoImpl updateMember");
		
		 sqlSession.update(namespace+".updateMember",memberBean2);
	}

	@Override
	public void usetDelete(MemberBean memberBean) {
		System.out.println("MemberDaoImpl usetDelete");
		sqlSession.delete(namespace+".userDelete",memberBean);
	}



	
	
	
	
	
	
	
	
}
