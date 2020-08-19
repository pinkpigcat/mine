package com.itwillbs.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.MemberService;

@Controller
public class BoardController {
	@Inject
	private BoardService boardService;
	@Inject
	private MemberService memberService;
	
	@Resource(name="uploadPath") //string타입이므로 inject가아니라 Resource servlet-context에서 경로만들어둔것을 가져옴
	private String uploadPath;
	
	
	
	
	//글쓰기 GET
	@RequestMapping(value = "/center/write", method = RequestMethod.GET)
	
	public String insert() {
		System.out.println("/center/write get");
		
		return "center/writeForm";
	}
	
	//글쓰기 POST
	@RequestMapping(value = "/center/write", method = RequestMethod.POST)
	
	public String insertpost(BoardBean bb) {
		System.out.println("/center/write post");
		
		
//		System.out.println("id가져오기 : "+bb.getId());
//		System.out.println("게시판 넘버 : "+bb.getNum());
//		System.out.println("이름 가져오기 : "+bb.getName());
//		System.out.println("게시판내용 : "+bb.getContent());
//		System.out.println("비밀번호 가져요기 : "+bb.getPass());
		
		
		boardService.insertBoard(bb);
		
		return "redirect:/center/notice";
	}
	
	
	
	//plant
	@RequestMapping(value = "/center/plant", method = RequestMethod.GET)
	
	public String plant(BoardBean bb) {
		System.out.println("/center/plant GET");
		
		
		return "center/plant";
	}
	
	
	//introduce
	@RequestMapping(value = "/center/introduce", method = RequestMethod.GET)
	
	public String introduce(BoardBean bb) {
		System.out.println("/center/introduce GET");
		
		
		return "center/introduce";
	}
	
	
	
	//글목록보기 Notice GET
	@RequestMapping(value = "/center/notice", method = RequestMethod.GET)
	
	public String getList(Model model,HttpServletRequest request) {
		System.out.println("/center/notice get");
		//리스트를 보여주기위한 구문 들어가야함
		
		PageBean pb=new PageBean();
		pb.setPageSize(10);  //짤라서 가져올 갯수
		
		String pageNum=request.getParameter("pageNum");//현재 페이지 번호 가져오기
		
		if (pageNum==null) {
			pb.setPageNum("1"); //이것만 String인 이유
		}else {
			pb.setPageNum(pageNum); //request객체에서 직접 가져온 값
		}
		
		pb.setCount(boardService.getBoardCount());
		
		//---------------------------
		
		List<BoardBean> boardList=boardService.getBoardList(pb);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("pb",pb);
		
		return "center/notice";
	}
	
	
	

	
	
	//글내용 보기
	@RequestMapping(value = "/center/content", method = RequestMethod.GET)
	
	public String content(Model model,HttpServletRequest request) {
		
		System.out.println("/center/content get");
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardBean boradBean=boardService.getBoardContent(num);
		boardService.updateReadCount(num);
		
		model.addAttribute("boardBean", boradBean);
		
		return "center/content";
	}
	
	
	
	//파일 글내용 보기
	@RequestMapping(value = "/center/fcontent", method = RequestMethod.GET)
	
	public String fcontent(Model model,HttpServletRequest request) {
		
		System.out.println("/center/fcontent get");
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardBean boradBean=boardService.getBoardContent(num);
		boardService.updateReadCount(num);
		
		model.addAttribute("boardBean", boradBean);
		
		return "center/fcontent";
	}
	
	
	
	//글수정 GET
	@RequestMapping(value = "/center/updateForm", method = RequestMethod.GET)
	
	public String updateForm(Model model,HttpServletRequest request,BoardBean bb) {
		System.out.println("/center/updateForm get");
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardBean boradBean=boardService.getBoardContent(num);
		
		model.addAttribute("boardBean", boradBean);
		
		return "center/updateForm";
		
	}
	
	
	
	//글수정 POST
	@RequestMapping(value = "/center/updateForm", method = RequestMethod.POST)
	
	public String updateFormPOST(Model model,HttpServletRequest request,BoardBean boardBean) {
		System.out.println("/center/updateForm POST");
		
		boardService.updateBoard(boardBean);
		
		System.out.println("글수정완");
		
		return "redirect:/center/notice";
		
	}
	
	
	//글삭제 POST
	@RequestMapping(value = "/center/delete", method = RequestMethod.GET)
	
	public String deleteFormPOST(Model model,HttpServletRequest request,BoardBean boardBean) {
		System.out.println("/board/deletePOST");
		
		int num=Integer.parseInt(request.getParameter("num")); //글번호
		
		boardService.deleteBoard(num);
		
		return "redirect:/center/notice";
		
	}
	
	
	
	
	
	//파일업로드(image) 글쓰기   GET
	@RequestMapping(value = "/center/fwrite", method = RequestMethod.GET)
	
	public String fwrite() {
		System.out.println("/center/fwrite get");
		
		return "/center/fwriteForm";
	}
	
	
	//파일 업로드  POST
	@RequestMapping(value = "/center/fwrite", method = RequestMethod.POST)
	
	public String fwritePOST(HttpServletRequest request,MultipartFile file) {
		System.out.println("/center/fwritePOST post");
		
		UUID uid = UUID.randomUUID();
		String saveName=uid.toString()+"_"+file.getOriginalFilename();
		System.out.println("저장한 saveName"+saveName);
		
		
		//uploadPath servlet-context에 경로지정을 해놨음
		File target = new File(uploadPath,saveName); //경로에 파일저장
		
		try {
			FileCopyUtils.copy(file.getBytes(),target); //in 파일을 가져와서,out 파일을 target에 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		BoardBean boardBean = new BoardBean();
		boardBean.setName(request.getParameter("name"));
		boardBean.setSubject(request.getParameter("subject"));
		boardBean.setContent(request.getParameter("content"));
		boardBean.setFile(saveName);
		
		
		boardService.insertBoard(boardBean);
		
		return "redirect:/center/fnoticeImage";
	}
	
	
	


	//이미지게시판 글목록  GET 
	@RequestMapping(value = "/center/fnoticeImage", method = RequestMethod.GET)
	
	public String getimage(Model model,HttpServletRequest request) {
		System.out.println("/center/fnoticeImage get");
		//리스트를 보여주기위한 구문 들어가야함
		
		PageBean pb=new PageBean();
		pb.setPageSize(10);  //짤라서 가져올 갯수
		
		String pageNum=request.getParameter("pageNum");//현재 페이지 번호 가져오기
		
		if (pageNum==null) {
			pb.setPageNum("1"); //이것만 String인 이유
		}else {
			pb.setPageNum(pageNum); //request객체에서 직접 가져온 값
		}
		
		pb.setCount(boardService.getBoardCount());
		
		//---------------------------
		
		List<BoardBean> boardList=boardService.getBoardList(pb);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("pb",pb);
		
		return "/center/fnoticeImage";
	}

	
	
	// 이미지글수정 GET
	@RequestMapping(value = "/center/fnoticeImageUpdateForm", method = RequestMethod.GET)
	
	public String fnoticeImageUpdateGET(Model model,HttpServletRequest request,BoardBean bb) {
		System.out.println("/center/fnoticeImageUpdateForm get");
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardBean boradBean=boardService.getBoardContent(num);
		
		model.addAttribute("boardBean", boradBean);
		
		return "center/fnoticeImageUpdateForm";
		
	}
	
	// 이미지글수정 POST
	@RequestMapping(value = "/center/fnoticeImageUpdateForm", method = RequestMethod.POST)
	
	public String fnoticeImageUpdatePost(HttpServletRequest request,MultipartFile file) {
		System.out.println("/center/fnoticeImageUpdateForm POST");
		
		UUID uid = UUID.randomUUID();
		String saveName=uid.toString()+"_"+file.getOriginalFilename();
		System.out.println("저장한 saveName"+saveName);
		
		
		//uploadPath servlet-context에 경로지정을 해놨음
		File target = new File(uploadPath,saveName); //경로에 파일저장
		
		try {
			FileCopyUtils.copy(file.getBytes(),target); //in 파일을 가져와서,out 파일을 target에 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		BoardBean boardBean = new BoardBean();
		boardBean.setName(request.getParameter("name"));
		boardBean.setNum(Integer.parseInt(request.getParameter("num")));
		boardBean.setSubject(request.getParameter("subject"));
		boardBean.setContent(request.getParameter("content"));
		boardBean.setFile(saveName);
		
		boardService.updateBoard(boardBean);
		
		return "redirect:/center/fnoticeImage";
	}
	
	
	
	//파일다운로드 get
	@RequestMapping(value = "/center/filedown", method = RequestMethod.GET)
	
	public String filedownGET(Model model,HttpServletRequest request,BoardBean boardBean,HttpServletResponse response) throws Exception {
		System.out.println("/board/filedown get");
		
		//file_name가져오기
		String file_name = request.getParameter("file_name");
		
		//boardService 처리
		
		boardService.file_down(request,response);
		
		return null; //이동안할때에는 null
	}
	
	
	
	
	
	//답글쓰기 get
	@RequestMapping(value = "/center/reWriteForm", method = RequestMethod.GET)
	
	public String reWriteFormGET(Model model,HttpServletRequest request,BoardBean boardBean) {
		System.out.println("/center/reWriteForm get");
		
		int num=Integer.parseInt(request.getParameter("num"));
		int re_ref=Integer.parseInt(request.getParameter("re_ref")); 
		int re_lev=Integer.parseInt(request.getParameter("re_lev")); 
		int re_seq=Integer.parseInt(request.getParameter("re_seq")); 
		
		boardBean.setNum(num);
		boardBean.setRe_ref(re_ref);
		boardBean.setRe_lev(re_lev);
		boardBean.setRe_seq(re_seq);
		
		model.addAttribute("boardBean",boardBean);
		
		return "center/reWriteForm";
	}
	
	
	//답글쓰기 POST
	@RequestMapping(value = "/center/reWriteForm2", method = RequestMethod.POST)
	
	public String reWriteFormPOST(Model model,BoardBean boardBean) {
		
		System.out.println("/center/reWriteForm POST");
		
		boardService.reWrite(boardBean);
		
		return "redirect:/center/notice";
	}
	
	
	
	
	//메일 보내기 get
	@RequestMapping(value = "/mail/mail", method = RequestMethod.GET)
	
	public String main(Model model,HttpServletRequest request) {
		System.out.println("/mail/mail get");
		
		return "mail/mail";
	}
	
	
	//지도
	@RequestMapping(value = "/company/map", method = RequestMethod.GET)
	
	public String mapget(Model model,HttpServletRequest request) {
		System.out.println("/company/map Get");
		
		return "company/welcome";
	}
	
	

	
}
