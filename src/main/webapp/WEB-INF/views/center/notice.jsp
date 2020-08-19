<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 날짜형식바꾸기 -->
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
<jsp:include page="../inc/left.jsp"/>

<!-- 왼쪽메뉴 -->

<!-- 게시판 -->

<article>
<h1>Notice</h1>
<h3>총 게시물 수 ${pb.count}</h3>
<table id="notice">


<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>

<c:forEach var="bb" items="${boardList}">
<!-- 	//글번호 -->

<tr onclick="location.href='<c:url value="/center/content?num=${bb.num}"/>'"><td>${bb.num}</td>
    <td class="left">
  		<c:if test="${bb.re_lev>0}">
  	 	<c:set var="wid" value="${bb.re_lev*10}"/>
    		<img src='<c:url value="/resources/images/level.gif"/>' width="${wid}" height="20">
			<img src='<c:url value="/resources/images/re.gif"/>'>
  		</c:if>
    ${bb.subject} <!-- [댓글카운트 들어갈 자리]--></td>
<fmt:formatDate var="newFormattedDateString" value="${bb.date}" pattern="yyyy-MM-dd"/> <!--가져온 날짜 형식 바꾸기 -->
<td>${bb.name}</td><td>${newFormattedDateString}</td><td>${bb.readcount}</td></tr>

</c:forEach>

</table>


<!-- 검색창 -->
<div id="table_search">
<form action="noticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
</div>
<!-- 검색창 -->



<div id="table_search">
<input type="button" value="글쓰기" class="btn" onclick="location.href='<c:url value="/center/write"/>'" >
</div>

<div class="clear"></div>

<div id="page_control">
<c:if test="${pb.startPage>pb.pageBlock}">
<a href='<c:url value="/center/notice?pageNum=${pb.startPage-pb.pageBlock}"></c:url>'>Prev</a>
</c:if>	

<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}" step="1">
	<a href='<c:url value="/center/notice?pageNum=${i}"/>'>${i}</a> 
</c:forEach>


<c:if test="${pb.endPage<pb.pageBlock}">
<a href='<c:url value="/center/notice?pageNum=${pb.startPage+pb.pageBlock}"></c:url>'>Next</a> 
</c:if>
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