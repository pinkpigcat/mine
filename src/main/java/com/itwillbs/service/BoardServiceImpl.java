package com.itwillbs.service;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDao;
import com.itwillbs.domain.BoardBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.PageBean;

@Service
public class BoardServiceImpl implements BoardService, BoardDao {

	@Inject
	private BoardDao boardDao;
	
	
	@Override
	public void insertBoard(BoardBean bb) {
		System.out.println("게시판번호 가져왔는지 확인 : "+bb.getNum());
		bb.setNum(boardDao.getMexnum()+1);
		bb.setReadcount(0);
		bb.setDate(new Timestamp(System.currentTimeMillis()));
		
		//답글
		bb.setRe_ref(boardDao.getMexnum()+1);//기준 글 번호와 일치
		bb.setRe_lev(0);//들여쓰기 없음
		bb.setRe_seq(0);//순서값 - 맨 위가 0
		boardDao.insertBoard(bb);
	}


	@Override
	public Integer getMexnum() {//이거필요없음
		// TODO Auto-generated method stub
		return null;
	}

	
//-----------------------게시판 리스트 가져오기 & 페이징 ---------------------------------
	@Override
	public List<BoardBean> getBoardList(PageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		
		//--------startRow------------pageSize는 boardControll에서
		pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize());
		pb.setEndRow(pb.getCurrentPage()*pb.getPageSize());
//		currentPage*pageSize;
		
		return boardDao.getBoardList(pb);
	}

	

	@Override
	public Integer getBoardCount() {
	
			
		return boardDao.getBoardCount();
	}



	
	@Override
	public BoardBean getBoardContent(int num) {
		

		BoardBean boardBean = new BoardBean();
		
		return  boardBean=boardDao.getBoardContent(num);
	}



	@Override
	public void updateBoard(BoardBean boardBean) {
		System.out.println("BoardServiceImpl updateBoard");
		boardDao.updateBoard(boardBean);
		
	}


	@Override
	public void deleteBoard(int num) {
		
		boardDao.deleteBoard(num);
	}


	@Override
	public Integer boardCheck(BoardBean boardBean) {
		int isRight=0;
		return isRight=boardDao.boardCheck(boardBean);
	}


	@Override
	public void reInsertBoard(BoardBean bb) {
		// bb 에   num 저장
				// bb <= getMaxnum()
				bb.setNum(boardDao.getMexnum()+1); //입력할 글번호
				bb.setReadcount(0); //조회수
				bb.setDate(new Timestamp(System.currentTimeMillis()));//글쓴날짜
					
				//답글 순서 재배치
//				boardDao.updateRe_seq(bb);
						
				//답글값설정
				bb.setRe_ref(bb.getRe_ref()); //  그룹번호 그대로
				bb.setRe_lev(bb.getRe_lev()+1); //들여쓰기 +1
				bb.setRe_seq(bb.getRe_seq()+1); //순서값 +1 
						
				// 답글 쓰기
				boardDao.reInsertBoard(bb);
		
	}


	@Override
	public void updateRe_seq(BoardBean bb) {
		
		boardDao.updateRe_seq(bb);
	}


	

	@Override
	public void file_down(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 파일 이름 가져오기
	    String fileName = request.getParameter( "file_name" );
	 System.out.println(fileName);
	 
	 // 물리적인 경로
//	      String savePath = "/upload";
//	      ServletContext context = getServletContext();
//	      String sDownloadPath = context.getRealPath(savePath);
	//  물리적인 경로 + 파일 이름
//	      String sFilePath = sDownloadPath + "\\" + fileName;

	// 파일 물리적인 경로
//	 String uploadPath=request.getRealPath("/upload");
	    String uploadPath=request.getRealPath("/resources/upload");
	// 물리적인 경로 + 파일 이름
	    String sFilePath = uploadPath + "\\" + fileName;
	     
	     System.out.println(sFilePath);

	     // byte형을 저장하는 배열선언
	   byte b[] = new byte[4096];
	     
	   // 파일을 가져오기  => 자바에서 정보 제어 하기위해서   File 객체 생성
	   File oFile = new File(sFilePath);
	  

	// FileInputStream API  파일 입력 
	   FileInputStream in = new FileInputStream(oFile);

	// 물리적경로 + 파일이름  => 파일 타입 확인
	   String sMimeType = request.getSession().getServletContext().getMimeType(sFilePath);
//	   String sMimeType =  getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>>"+sMimeType );
	   


	   // octet-stream은  8비트로 된 일련의 데이터를 뜻합니다. 지정되지 않은 파일 형식을 의미합니다.
	 
	   // 파일 타입이 없는 경우 기본으로 설정
	   if(sMimeType == null) sMimeType = "application/octet-stream";

	// 서버에서 클라이언트로 응답할때  확인한 타입으로 설정
	   response.setContentType(sMimeType);

	   // 브라우저별로 한글처리
	   // 브라우저 확인 
	   String userAgent = request.getHeader("User-Agent");
	   // 익스플로러 브라우저이면 true/ 나머지 브라우저 false
	   boolean ie = (userAgent.indexOf("MSIE") > -1)|| (userAgent.indexOf("Trident") > -1);
	   String sEncoding=null;
	   if(ie) {
		   //익스플로러 브라우저 => 한글처리 해서  sEncoding 변수에 저장
		  sEncoding = URLEncoder.encode(fileName, "utf-8").replaceAll("\\+", "%20");
		  System.out.println(sEncoding);
	   }else{
		   // 나머지 브라우저
		  sEncoding = new String(fileName.getBytes("utf-8"),"8859_1");
		  System.out.println(sEncoding);
	  }
	   
	  
	   //한글 업로드 (이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다.)
//	    String sEncoding = new String(fileName.getBytes("utf-8"),"8859_1");
	 //  System.out.println(sEncoding);

	 // 서버에서 클라이언트에 보낼때  파일을 브라우저에서 바로 실행하지 않고 첨부(다운) 되게 설정
	   response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);
	   
	 //  ServletOutputStream 자바 API  응답 출력 하기위한 객체생성
	   ServletOutputStream out2 = response.getOutputStream();
	   int numRead;

	   // 바이트 배열b의 0번 부터 numRead번 까지 브라우저로 출력
	   // FileInputStream로  입력받은 파일을 =>   ServletOutputStream 이용해서 출력  
	   while((numRead = in.read(b, 0, b.length)) != -1) {
	    out2.write(b, 0, numRead);
	   }
	   out2.flush(); 
	   out2.close();
	   in.close();

//	   out.clear();
//		out = PageContext.pushBody();
	 //  ServletUtils.returnFile( PdsMisc.UPLOAD_DIRECTORY + File.separator + StringMisc.uniToEuc( fileName ), response.getOutputStream() );
		
		
		
	}


	@Override
	public void updateReadCount(int num) {
		System.out.println("updateReadCount");
		
		boardDao.updateReadCount(num);
		
	}


	@Override
	public void reWrite(BoardBean boardBean) {
		System.out.println("reWrite");
//		int num=0;
//		num=boardDao.getMexnum()+1;
//		System.out.println("reWrite num(re_ref) is : "+num);
		boardBean.setNum(boardDao.getMexnum()+1);
		System.out.println("reWrite");
		boardBean.setReadcount(0);
		boardBean.setDate(new Timestamp(System.currentTimeMillis()));
		boardDao.updateRe_seq(boardBean);
		
		System.out.println("reWrite3");
		
		boardBean.setRe_ref(boardBean.getRe_ref());
		boardBean.setRe_lev(boardBean.getRe_lev()+1); //들여쓰기 +1
		boardBean.setRe_seq(boardBean.getRe_seq()+1); //순서값 +1 
		
		System.out.println("reWrite4");
		
		boardDao.reWrite(boardBean);
	}







}
