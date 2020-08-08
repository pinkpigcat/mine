<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>

<c:if test="${sessionScope.id != null}">
<div id="login">${sessionScope.id}님 로그인 하셨습니다 | <a href='<c:url value="/member/updateForm/"/>'>정보수정  |</a>
<a href='<c:url value="/member/logout"/>'>logout</a> | <a href='<c:url value="/member/Delete/"/>'>회원탈퇴</a></div>
</c:if>

<c:if test="${sessionScope.id == null}">
<div id="login"><a href='<c:url value="/member/login/"/>'>login</a> | <a href='<c:url value="/member/insert/"/>'>join</a></div>
</c:if>




<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src='<c:url value="/resources/images/funwed2로고_about_plants.png"/>' width="230" height="42" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href='<c:url value="/main/main"></c:url>'>HOME</a></li>
<!-- 	<li><a href="/company/welcome.jsp">DIRECTION </a></li> -->
	<li><a href='<c:url value="/center/plant"></c:url>'>PLANT</a></li>
	<li><a href='<c:url value="/center/fnoticeImage"></c:url>'>GALLERY</a></li>
	<li><a href='<c:url value="/center/notice"></c:url>'>BOARD</a></li>
	<li><a href='<c:url value="/mail/mail"></c:url>'>CONTACT US</a></li>
	
</ul>
</nav>
</header>