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
<meta name="viewport" content="width=device-width, initial-scale=1">
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
 <style type="text/css">
 		.album{
			float:left; 
			text-align:center;
			margin: 17px;
			String fileName = "";
		}
		/* clear: both; */

 </style>
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
<%
// BoardDAO dao = new BoardDAO();

// int count=0;
// count=dao.getBoardCountImage();

// int pageSize=15;

// String pageNum=request.getParameter("pageNum");
// if(pageNum==null){//처음 페이지를 들어갔을때는 가져올 pagenum이 없기때문에 null 이고 이때 페이지목록 1 이 보일수있도록 설정
// 	pageNum="1";
// }

// int currentPage=Integer.parseInt(pageNum); //현재페이지 번호
// int startRow=(currentPage-1)*pageSize+1;
// int endRow=currentPage*pageSize;

// List list = null;

// if(count!=0){
// 	list=dao.getboardlistImage(startRow, pageSize);
// }


// //날짜모양설정 => 문자열로 출력해줌 
// SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");



%>
<article>
<h1>image Notice</h1>
  <!-- First Photo Grid-->
  	<c:if test="${pb.count!=0 }">
  		<c:forEach var="bb" items="${boardList }">
  		<div class="album">
  		<div style="text-align: center;" onclick="location.href='<c:url value="/center/fcontent?num=${bb.num}"/>'">
     <c:choose>
      <c:when test="${empty bb.file}">
       <img src='<c:url value="/resources/upload/no_img_han2.png"/>' width="250px" height="270px">
      </c:when>
      <c:otherwise>
      <img src='<c:url value="/resources/upload/${bb.file}"/>' width="250px" height="270px">
      </c:otherwise>
     </c:choose>
        </div>
<!--       <div style="text-align: center;" -->
<!--       </div> -->
      <div style="text-align: center;">${bb.subject}</div>
      <div style="text-align: center;">${bb.name}</div>
      <div style="text-align: center;">${bb.num}</div>
    </div>
    	</c:forEach>
    </c:if>
    <div style="clear: both;"></div>
	
<!-- </table> -->


<!-- 검색창 -->
<div id="table_search">
<form action="noticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
</div>


<!-- 검색창 -->
<c:if test="${!empty sessionScope.id}">
		<div id="table_search">
			<input type="button" value="글쓰기" class="btn" onclick="location.href='<c:url value="/center/fwrite"/>'">
		</div>
	</c:if>
<div class="clear"></div>

<div id="page_control">
<c:if test="${pb.startPage>pb.pageBlock}">
<a href='<c:url value="/center/fnoticeImage?pageNum=${pb.startPage-pb.pageBlock}"></c:url>'>Prev</a>
</c:if>	

<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}" step="1">
	<a href='<c:url value="/center/fnoticeImage?pageNum=${i}"/>'>${i}</a> 
</c:forEach>


<c:if test="${pb.endPage<pb.pageBlock}">
<a href='<c:url value="/center/fnoticeImage?pageNum=${pb.startPage+pb.pageBlock}"></c:url>'>Next</a> 
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