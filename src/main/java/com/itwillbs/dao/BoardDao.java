package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardBean;
import com.itwillbs.domain.PageBean;

public interface BoardDao {
	public Integer getMexnum();
	void insertBoard(BoardBean bb);
	public List<BoardBean> getBoardList(PageBean pb);
	public Integer getBoardCount();
	public void updateBoard(int num);
	public void deleteBoard(int num);
	public Integer boardCheck(BoardBean boardBean);
	public void updateRe_seq(BoardBean bb);
	public void reInsertBoard(BoardBean bb);
	public BoardBean getBoardContent(int num);
	public void updateReadCount(int num);
	public void reWrite(BoardBean boardBean);

}
