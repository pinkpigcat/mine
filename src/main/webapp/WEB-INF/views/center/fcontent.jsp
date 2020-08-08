<%@page import="java.util.ArrayList"%>
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
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>fNotice</h1>
<form action="coment.jsp" method="post">
<table id="notice">
	<tr>
		<td>글번호</td><td>${boardBean.num}</td>
		<td>조회수</td><td>${boardBean.readcount}</td>
	</tr>
	
	<tr>
		<td>작성자</td><td>${boardBean.name}</td>
		<td>작성일</td><td>${boardBean.date}</td>
	</tr>
	
	<tr>
		<td>글제목</td><td colspan="3">${boardBean.subject}</td>
		<td></td><td></td>
	</tr>
	
	<tr>
		<td>글내용</td><td colspan="3">${boardBean.content}</td>
		<td></td><td></td>
	</tr>
	
	<tr>
		<td>파일 다운</td><td colspan="3"><img src='<c:url value="/resources/upload/${boardBean.file}"/>' width="50" height="50"><br>
		<a href='<c:url value="/center/filedown?file_name=${boardBean.file}"/>'>${boardBean.file}</a>
		
		</td>
		<td></td><td></td>
	</tr>
	
</table>
</form>

<div id="table_search">
	
<c:if test="${!empty sessionScope.id }">
	  <input type="button" value="답글쓰기" class="btn" onclick="location.href='<c:url value="/center/reWriteForm?num=${boardBean.num}&re_ref=${boardBean.re_ref}&re_lev=${boardBean.re_lev}&re_seq=${boardBean.re_seq}"></c:url>'">
  <c:if test="${sessionScope.id == boardBean.name}">
  <h1>${boardBean.id}</h1>
		<input type="button" value="글삭제" class="btn" onclick="location.href='<c:url value="/center/delete?num=${boardBean.num}"/>'">
		<input type="button" value="글수정" class="btn" onclick="location.href='<c:url value="/center/updateForm?num=${boardBean.num}"/>'">
  </c:if>
</c:if>



<input type="button" value="글목록" class="btn" onclick="location.href='<c:url value="/center/fnoticeImage"></c:url>'">
</div>
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