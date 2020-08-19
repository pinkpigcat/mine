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
<script src='<c:url value="/resources/script/jquery-3.4.1.js"/>'></script>
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
<script type="text/javascript">
 

	$(document).ready(function(){
		
		$("#contentDelete").click(function(){
			
	var result = confirm("게시물을 삭제 하시겠습니까?");
	
	if (result) {
		
		$(location).attr("href",'<c:url value="/center/delete?num=${boardBean.num}"/>');
	}
			
			
			
			
			
		});
	});
 
 </script>

 
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
<form action="coment.jsp" method="post">
<table id="notice">
<!-- <tr><td class="tno">No.</th> -->
<!--     <th class="ttitle">Title</th> -->
<!--     <th class="twrite">Writer</th> -->
<!--     <th class="tdate">Date</th> -->
<!--     <th class="tread">Read</th></tr> -->

    <tr><td>글번호</td><td>${boardBean.num}  </td><td></td><td></td>
	    <td>조회수</td><td>${boardBean.readcount}</td><td></td><td></td><td></td></tr>
	<tr><td>작성자</td><td>${sessionScope.id}</td><td></td><td></td><td></td><td></td>
	    <td>작성일</td><td>${boardBean.date}</td><td></td><td></td></tr>
	<tr><td>글제목</td><td colspan="4">${boardBean.subject}</td><td></td><td></td><td></td><td></td></tr>
	<tr><td>글내용</td><td colspan="4" style="height: 90px;">${boardBean.content}</td><td></td><td></td><td></td></tr>
	
<!-- 	//댓글 작성자 아이디 매치 다시하기-->
<!-- 	//댓글 작성자 아이디 매치 다시하기-->
<!-- 	//댓글 작성자 아이디 매치 다시하기-->



<!-- 	<tr><td>댓글</td><td><input type="text" value="로그인이 필요합니다" name="coment"> -->
<!-- 	<tr><td rowspan="2" colspan="13">   </td><td><td></td> -->
<!-- 	<tr><td rowspan="" colspan="7">   </td><td><td></td><td></td> -->
<!-- 	<tr><td rowspan="" colspan="7" style="height: 60px;"></td><td></td><td></td><td></td><td></td> -->
<!-- 	<tr><td>댓글작성</td><td><input type="text" value="댓글을 입력하세요" name="coment"> -->
<!-- 	<input type="hidden" name="num" value=""> -->
<!-- 	<input type="hidden" name="id" value=""> -->
<!-- 	<input type="submit" value="등록"> -->
<!-- 	</td></tr> -->






<!-- 	<tr><td style="background-color: gray;">댓글내용</td> -->
<!-- 	<td >댓글내용 들어갈자리</td> -->
<!-- 	<td>작성자</td><td>작성자아이디</td> -->
<!-- 	<td>작성일</td><td>작성날짜들어갈자리</td><td></td> -->
<!--     <td> -->
<!-- 	<input type="button" onclick="location.href='deleteCommentPro.jsp?num=ㅇㅇ&comment_num=ㅇㅇ'" value="댓글삭제"></td> -->
<!-- 	<td><input type="button" onclick="fun1()" value="댓글수정"></td> -->



	
	
<%-- <%}%> --%>

</table>
</form>


 <script type="text/javascript">


function fun1() {
	window.open("updateCommentForm.jsp?num=dd&comment_num=dd","댓글 수정창","width=600,height=200,left=200,top=200,scrollbars=yes,resizable=yes"); 

}


</script>





 
<div id="table_search">

<!-- // MemberBean mbean = new MemberBean(); -->
<!-- // MemberDAO mdao = new MemberDAO(); -->
<!-- // int result=mdao.idcheck(id); -->
<!-- // 세션값 가져오기 -->
<!-- // 세션값 있으면  -->
<!-- // 세션값과 글쓴이가 일치하면  글수정 글삭제 보이기 -->
<c:if test="${!empty sessionScope.id }">
	  <input type="button" value="답글쓰기" class="btn" onclick="location.href='<c:url value="/center/reWriteForm?num=${boardBean.num}&re_ref=${boardBean.re_ref}&re_lev=${boardBean.re_lev}&re_seq=${boardBean.re_seq}"></c:url>'">
  <c:if test="${sessionScope.id == boardBean.name}">
<%--   <h1>${boardBean.id}</h1> --%>
		<input type="button" value="글삭제" class="btn" id="contentDelete">
		<input type="button" value="글수정" class="btn" onclick="location.href='<c:url value="/center/updateForm?num=${boardBean.num}"/>'">
  </c:if>
</c:if>


<input type="button" value="글목록" class="btn" onclick="location.href='<c:url value="/center/notice"></c:url>'">
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