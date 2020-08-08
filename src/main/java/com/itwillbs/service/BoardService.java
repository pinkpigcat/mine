package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.BoardBean;
import com.itwillbs.domain.PageBean;

public interface BoardService {

	public void insertBoard(BoardBean bb);

	public List<BoardBean> getBoardList(PageBean pb);

	public Integer getBoardCount();

	public BoardBean getBoardContent(int num);

	public void updateBoard(int num);

	public void deleteBoard(int num);

	public Integer boardCheck(BoardBean boardBean);

	public void reInsertBoard(BoardBean bb);

	public void file_down(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void updateReadCount(int num);

	public void reWrite(BoardBean boardBean);


}
