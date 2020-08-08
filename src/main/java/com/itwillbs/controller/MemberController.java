package com.itwillbs.controller;
//컨트롤러 폴더는 자동으로 하라고 참조하라고 설정이 안되어있으면 실행안됨  404 오류
//servlet.context 가서 이 패키지에 대한 자동인식을 추가해주어야 인식한다


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BoardBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;

@Controller
public class MemberController {
//xml에서 객체 생성 후(MemberServiceImpl) 주입받을 변수,변수는 인터페이스 이다	
	@Inject
	private MemberService memberService;
	
	//join
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	
		public String insert() {
			System.out.println("/member/insert get");

			return "member/join";
			}
	
	//join POST
	@RequestMapping(value = "/member/insert2", method = RequestMethod.POST)
	
		public String insertPOST(MemberBean memberBean) {
			System.out.println("이름 : "+memberBean.getName());
			System.out.println("성별 : "+memberBean.getGender());
			System.out.println("/member/insert2 post");
			
			
			memberService.insertMember(memberBean);
			
			return "redirect:/member/login";
			}
	
	//Login
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	
		public String login(Model model) {
			System.out.println("/member/login");
			

			return "member/login";
			}
	
	//LoginPOST
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	
		public String loginPOST(MemberBean memberBean,HttpSession session) {
			System.out.println("/member/loginPOST");

			
			 MemberBean memberBean2 = memberService.userCheck(memberBean);
			 
			 
			 if (memberBean2!=null) {
				session.setAttribute("id", memberBean2.getId());
			}else {
				System.out.println("틀렸음");
				session.setAttribute("msg","비밀번호를 확인하세요");
				return "/member/msg";
			}
			 
			return "redirect:/main/main";
	}
	
	
	//main
		@RequestMapping(value = "/main/main", method = RequestMethod.GET)
		
			public String mainGET() {
				System.out.println("/main/main get");
				return "main/main";
			}
		
		
		//main
		@RequestMapping(value = "/main/main2", method = RequestMethod.GET)
		
			public String mainGET2() {
				System.out.println("/main/main");
				return "main/main_json";
			}
	
		
		//LogoutPOST
		@RequestMapping(value = "/member/logout", method = RequestMethod.POST)
		
			public String loginoutPOST(HttpSession session) {
				System.out.println("/member/loginoutPOST");

				session.invalidate();
				return "redirect:/main/main";
		}
	
		//usetDelete GET
		@RequestMapping(value = "/member/Delete", method = RequestMethod.GET)
		
			public String Delete(HttpSession session,Model model){
				System.out.println("/member/Delete GET");
				String id = (String)session.getAttribute("id");
				MemberBean memberBean=memberService.getMember(id);
				model.addAttribute(memberBean);
				
				return "member/deleteForm";
			}
	

		//usetDelete POST
		@RequestMapping(value = "/member/Delete", method = RequestMethod.POST)
		
			public String Delete(HttpSession session,MemberBean memberBean) {
				System.out.println("/member/Delete POST");
				MemberBean memberIsRight=memberService.userCheck(memberBean);
				if (memberIsRight!= null) {
					
					memberService.userDelete(memberBean);
				}else {
					System.out.println("비밀번호 틀림");
					session.setAttribute("msg","비밀번호를 확인하세요");
					return "/member/msg";
				}

				session.invalidate();
				return "redirect:/main/main";
		}
		

	//updateGet
			@RequestMapping(value = "/member/updateForm", method = RequestMethod.GET)
			
				public String updateFormGET(MemberBean memberBean,HttpSession session,Model model) {
					System.out.println("/member/updateForm");
					
					String id=(String) session.getAttribute("id");
					MemberBean memberBean2=memberService.getMember(id);
					
					
					model.addAttribute("memberBean", memberBean2);
					
					return "member/updateForm";
				}



	//updatePOST
			@RequestMapping(value = "/member/updateForm", method = RequestMethod.POST)
			
				public String updatePOST(HttpSession session,MemberBean memberBean,Model model) {
					System.out.println("/member/updatePOST");
					
					String id=(String) session.getAttribute("id");
					MemberBean memberBean2 =memberService.userCheck(memberBean);
					
					if (memberBean2!=null) {
						
						memberService.updateMember(memberBean);
						return "redirect:/main/main";
					}else {
						model.addAttribute("msg", "업데이트 실패");
						
						return "member/msg";
					}

			}


			//Logout get
			@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
			
			public String memberlogout(Model model,HttpServletRequest request,BoardBean boardBean) {
				System.out.println("/member/logout get");
				
				
				request.getSession().invalidate();
				
				return "redirect:/main/main";
			}
		
			
			

			//mail get
			@RequestMapping(value = "/member/mail", method = RequestMethod.GET)
			
			public String mailget(Model model,HttpServletRequest request,BoardBean boardBean) {
				System.out.println("/mail/mail get");
				
				
				
				return "mail/mail";
			}
		




}//끝
