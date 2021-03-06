<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<c:url value="/resources/css/default.css"/>' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/subpage.css"/>' rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/left.jsp"/>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값이 없으면  login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}


// int num=Integer.parseInt(request.getParameter("num"));

// BoardDAO dao = new BoardDAO();


// dao.getborad(num);

// BoardBean bean=dao.getborad(num);


%>
<article>
<h1>Notice delete</h1>
<form action='<c:url value="/member/Delete"/>' method="post">
<%-- <input type="hidden" name="num" value="<%=num%>"> --%>
<table id="notice">
	<tr><td>비밀번호</td><td><input type="password" name="pass"></td>
	<td><input type="hidden" value="${memberBean.id}" name="id"></td>
	</tr>
</table>
<div id="table_search">
<input type="submit" value="회원탈퇴" class="btn">
<!-- <input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'"> -->
</div>
</form>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>    
