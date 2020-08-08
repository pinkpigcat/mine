<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<c:url value="/resources/css/default.css"/>' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/front.css"/>' rel="stylesheet" type="text/css">

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

<%-- <script src='<c:url value="/resources/script/jquery-3.4.1.js"/>'></script> --%>

 <script type="text/javascript">

 //-------최근글 5개 AjaxControllor를 통하여 가져오는 형태---------------
 $(document).ready(function () {
 	// 스프링  http://localhost:8080/FunWeb/main/main
		$('.brown').click(function(){
			// table 초기화
// 			alert("클릭");
			$('table').html('');
			// /board/list2
			$.getJSON('<c:url value="/board/list2"/>',function(d){
				$.each(d,function(index,item){
					nowdate = new Date(item.date);
					date_str = nowdate.getFullYear() + "." + (nowdate.getMonth()+1) + "." + nowdate.getDate();
$('table').append('<tr><td class="contxt"><a href="${pageContext.request.contextPath}/board/content?num='+item.num+'">'+item.subject+'</a></td><td>'+date_str+'</td></tr>');
				});
			});
		});
		

//------최근글 5개  -main/boardjson.jsp에서 바로 가져오는 형태-----------

// 		$('.brown').click(function(){
// 			// table 초기화
// 			$('table').html('');
// 			$.getJSON('boardjson.jsp',function(d){
// 				$.each(d,function(index,item){
// $('table').append('<tr><td class="contxt">'+item.subject+'</td><td>'+item.date+'</td></tr>');
// 				});
// 			});
// 		});

 	});
</script>


 
<style type="text/css">
.img2{width: 299px; height: 300px;}
</style>
  
  
  
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<header>
<jsp:include page="../inc/top.jsp"/>
</header>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<!-- <div class="clear"></div> -->
<!-- <div id="main_img"><img src="../images/배너3.jpg" -->
<!--  width="971" height="282px"></div> -->
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<!-- <div id="hosting"> -->
<!-- <p><img src="../images/2관음죽확대.jpg" width="100px" height="100px"></p> -->
<!-- </div> -->
<!-- <div id="security"> -->
<!-- <!-- <h3>Web Security Solution</h3> --> 
<!-- <p><img src="../images/2관음죽확대.jpg" width="100px" height="100px"></p> -->
<!-- </div> -->
<!-- <div id="payment"> --
<!-- <!-- <h3>Web Payment Solution</h3> --> 
<!-- <p><img src="../images/2관음죽확대.jpg" width="100px" height="100px"></p> -->
<!-- </div> -->
<!-- </div> -->
<!-- <div class="clear"></div> -->
<!-- <div id="sec_news"> -->
<!-- <h3><span class="orange">Security</span> News</h3> -->
<!-- <dl> -->
<!-- <dt></dt> -->
<!-- <dd>.....</dd> -->
<!-- </dl> -->


<!-- <dl> -->
<!-- <dt>Vivamus id ligula....</dt> -->
<!-- <dd>.....</dd> -->
<!-- </dl> -->

<!-- <img src="../images/Untitled.jpg" style="float: left;" class="img2"> -->

<%-- '<c:url value="/resources/images/필리아페페리사이징.jpg"/>' --%>
  <div class="slider">
    <div>
    <a href="../center/introduce.jsp">
    <img src='<c:url value="/resources/images/Untitled.jpg"/>' class="img2" style="float: left;" /></a>
	<img src='<c:url value="/resources/images/세로그라피카리사이징.jpg"/>' class="img2" style="float: left;" class="img2">
	<img src='<c:url value="/resources/images/필리아페페리사이징.jpg"/>' class="img2" style="float: left;">
    <img src='<c:url value="/resources/images/포트넘리사이징.jpg"/>' class="img2"style="float: right;">
    <img src='<c:url value="/resources/images/스파티필름확대.jpg"/>' class="img2"style="float: right;">
    <img src='<c:url value="/resources/images/보스톤고사리리사이징.jpg"/>' class="img2"style="float: right;">
    <img src='<c:url value="/resources/images/메인용2.jpg"/>' class="img2"style="float: right;">
    <img src='<c:url value="/resources/images/2관음죽확대.jpg"/>' class="img2"style="float: right;">
    <img src='<c:url value="/resources/images/6아이비.jpg"/>' class="img2"style="float: right;">
    </div>
    
    <div>
    <img src='<c:url value="/resources/images/포트넘리사이징.jpg">
    </c:url>' style="float: left;" class="img2">
    <img src='<c:url value="/resources/images/스파티필름확대.jpg"/>' class="img2" style="float: left;">
    <img src='<c:url value="/resources/images/드라세나어쩌고.jpg"/>' class="img2">
    <img src='<c:url value="/resources/images/8피쿠스아리 (2).jpg"/>' class="img2" style="float: left;">
    <img src='<c:url value="/resources/images/문샤인.jpg"/>' class="img2" style="float: left;">
    <img src='<c:url value="/resources/images/스킨답서스2.jpg"/>' class="img2" style="float: left;">
    <img src='<c:url value="/resources/images/오늘할거2.jpg"/>' class="img2" style="float: left;">
    <img src='<c:url value="/resources/images/11행운목.jpg"/>' class="img2" style="float: left;">
    <img src='<c:url value="/resources/images/14포트멈.jpg"/>' class="img2" style="float: left;">
    </div>
 
  </div>



<!--   <div class="slider"> -->
<!--     <div><img src="../images/Untitled.jpg" style="float: left;" class="img2"><img src="../images/세로그라피카리사이징.jpg" class="img2" style="float: left;"><img src="../images/필리아페페리사이징.jpg" class="img2"></div> -->
<!--     <div><img src="../images/포트넘리사이징.jpg" style="float: left;" class="img2"><img src="../images/스파티필름확대.jpg"class="img2" style="float: left;"><img src="../images/보스톤고사리리사이징.jpg" class="img2"></div> -->
<!--   </div> -->


  <script>
    $(document).ready(function(){
      $('.slider').bxSlider();
    });
  </script>






</div>






<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>

<%
// .brown 클릭했을때
// boardjson.jsp 최근글 5개 덮어서 쓰기

// BoardDAO bdao 객체생성
// BoardDAO bdao=new BoardDAO();
// 게시판 전체 글개수 가져오기   getBoardCount() 호출
// int count=bdao.getBoardCount();
//날짜 모양 설정=> 문자열 출력
// SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
// int pageSize=5;
// int startRow=1;
// 게시판에 글 있으면 
// 리턴할형 List getBoardList(시작하는행번호,글개수)
// List boardList=null;
// if(count!=0){
// 	boardList=bdao.getBoardList(startRow,pageSize);
// 	for(int i=0;i<boardList.size();i++){
// 		BoardBean bb=(BoardBean)boardList.get(i);
		%>
		<!-- <tr><td class="contxt"> -->
		<%-- <a href="../center/content.jsp?num=<%//=bb.getNum()%>"><%//=bb.getSubject() %></a></td> --%>
   <%--  <td><%//=sdf.format(bb.getDate()) %></td></tr> --%>
		<%
//	}
// }
%>

<tr><td class="contxt">제목</td>
    <td>작성일</td></tr>

</table>
</div>


</article>


<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>


<!-- The dots/circles -->

<!-- 푸터 들어가는 곳 -->
<footer>
<jsp:include page="../inc/bottom.jsp"/>
</footer>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>