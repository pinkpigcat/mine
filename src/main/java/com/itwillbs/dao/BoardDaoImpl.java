package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardBean;
import com.itwillbs.domain.PageBean;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.itwillbs.mapper.BoardMapper";
	
	
	@Override
	public Integer getMexnum() {
		return sqlSession.selectOne(namespace+".getMexnum");
	}
	
	
	@Override
	public void insertBoard(BoardBean bb) {
		sqlSession.insert(namespace+".insertBoard",bb);
		
	}
//mapper에 만들어놓은 sql구문을 사용한다
//각 메서드 이름과 mapper에 있는 메서드 이름을 갖게 만들었음
//파라미터 있는 경우 없는경우 다르다


	@Override
	public List<BoardBean> getBoardList(PageBean pb) {
		return sqlSession.selectList(namespace+".getBoardList",pb);
	}


	@Override
	public Integer getBoardCount() {
		
		return sqlSession.selectOne(namespace+".getBoardCount");
	}


	


	@Override
	public void updateBoard(BoardBean boardBean) {
		System.out.println("BoardDaoImpl updateBoard ");
		sqlSession.update(namespace+".updateBoard",boardBean);
		
	}


	@Override
	public void deleteBoard(int num) {
		
		System.out.println("BoardDaoImpl deleteBoard");
		sqlSession.delete(namespace+".deleteBoard",num);
		
	}


	@Override
	public Integer boardCheck(BoardBean boardBean) {
	 return sqlSession.selectOne(namespace+".userCheck",boardBean);
	}


	@Override
	public void updateRe_seq(BoardBean boardBean) {
		
		System.out.println(boardBean.getRe_lev());
		System.out.println(boardBean.getRe_ref());
		System.out.println(boardBean.getRe_seq());
		
		sqlSession.update(namespace+".updateRe_seq",boardBean);
		
	}


	@Override
	public void reInsertBoard(BoardBean bb) {
		
		sqlSession.insert(namespace+".insertBoard",bb);
	}


	@Override
	public BoardBean getBoardContent(int num) {
		return sqlSession.selectOne(namespace+".getBoardContent", num);
	}


	@Override
	public void updateReadCount(int num) {
		
		sqlSession.update(namespace+".updateReadCount",num);
	}


	@Override
	public void reWrite(BoardBean boardBean) {
		System.out.println("BoardDaoImpl reWrite");
		
		sqlSession.update(namespace+".reWrite",boardBean);
	}



	
	
	

}
