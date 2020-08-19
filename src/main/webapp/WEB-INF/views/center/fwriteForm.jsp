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

<article>
<h1>File Notice Write</h1>
<form action='<c:url value="/center/fwrite"></c:url>' method="post" enctype="multipart/form-data">
<table id="notice">
    <tr><td>글쓴이</td><td><input type="text" class="writeInput" name="name" style="
    height: 15px;
    width: 550px;
" value="${sessionScope.id}" readonly ></td></tr>
	<tr><td>제목</td><td><input type="text" class="writeInput" name="subject" style="
    height: 15px;
    width: 550px;
"></td></tr>
	<tr><td>첨부파일</td><td><input type="file" class="writeInput" name="file" style="
    height: 20px;
    width: 550px;
"></td></tr>
	<tr><td>내용</td>
	    <td><textarea name="content" cols="20" rows="10" style="
    width: 550px;
    height: 350px;
"></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="글쓰기" class="btn">
<input type="button" value="글목록" class="btn" onclick='<c:url value="/center/fnotice"></c:url>'>
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
