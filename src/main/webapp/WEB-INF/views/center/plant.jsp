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
<link href='<c:url value="/resources/css/codepen-result.css"/>' rel="stylesheet" type="text/css">
</head>


<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div id="sub_img_center" ></div> <!-- 메인이미지 -->
<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/left.jsp"/>
<!-- 왼쪽메뉴 -->

<article>
 <h1>About Plant</h1> 
 <table id="notice">
 <tr><th class="tno">No.</th> 
</tr> 
    </table>
</article>

<div class="cut">
<figure class="snip1384">
  <img class="img2" src='<c:url value="/resources/images/1야래카.PNG"/>' alt="sample83" width="630px" height="380px">
  <figcaption>
    <h3> 야레카 야자 </h3>
    <p>Chrysalidocarpus lutescens</p><i class="ion-ios-arrow-right"></i>
  </figcaption>
  <a href='<c:url value="/center/introduce/"></c:url>'></a>
</figure>


<figure class="snip1384"><img src='<c:url value="/resources/images/2관음죽.jpg"></c:url>' width="630px" height="380px"  />
  <figcaption>
    <h3>  관음죽  </h3><br>
    <p>[   Bamboo Palmo ]</p><i class="ion-ios-arrow-right"></i>
  </figcaption>
  <a href="#"></a>
</figure>

<!-- <!-- 2번째줄 --> 
<!-- <div class="blank"> -->
<!-- <figure class="snip1384"> -->
<!-- <img src="../images/4고무나무.jpg" alt="sample92" width="630px" height="370px"/> -->
<!--   <figcaption> -->
<!--     <h3>인도 고무나무</h3><br> -->
<!--     <p>[ Indian rubber tree ]</p><i class="ion-ios-arrow-right"></i> -->
<!--   </figcaption> -->
<!--   <a href="#"></a> -->
<!-- </figure> -->

<!-- <figure class="snip1384"><img src="../images/6수성아이비.jpg" width="630px" height="370px" alt="sample92" /> -->
<!--   <figcaption> -->
<!--     <h3>아이비</h3><br> -->
<!--     <p>Hedera helix</p><i class="ion-ios-arrow-right"></i> -->
<!--   </figcaption> -->
<!--   <a href="#"></a> -->
<!-- </figure> -->

<!-- </div> -->

<!-- <div class="blank"> -->
<!-- <figure class="snip1384"><img src="../images/7피닉스야자.jpg" alt="sample92" width="630px" height="370px"/> -->
<!--   <figcaption> -->
<!--     <h3>피닉스 야자</h3> -->
<!--     <p>a. </p><i class="ion-ios-arrow-right"></i> -->
<!--   </figcaption> -->
<!--   <a href="#"></a> -->
<!-- </figure> -->

<!-- <figure class="snip1384"><img src="../images/보스톤고사리3.jpg" width="630px" height="370px" alt="sample92" /> -->
<!--   <figcaption> -->
<!--     <h3>보스턴 고사리</h3> -->
<!--     <p>a. </p><i class="ion-ios-arrow-right"></i> -->
<!--   </figcaption> -->
<!--   <a href="#"></a> -->
<!-- </figure> -->
<!-- </div> -->

<!-- <div class="blank"> -->
<!-- <figure class="snip1384"><img src="../images/10스파티필름.jpg"alt="sample92" width="630px" height="370px"/> -->
<!--   <figcaption> -->
<!--     <h3>스파티 필름</h3> -->
<!--     <p>a. </p><i class="ion-ios-arrow-right"></i> -->
<!--   </figcaption> -->
<!--   <a href="#"></a> -->
<!-- </figure> -->

<!-- <figure class="snip1384"><img src="../images/14포트머.jpg" width="630px" height="370px" alt="sample92" /> -->
<!--   <figcaption> -->
<!--     <h3>포트머</h3> -->
<!--     <p>a. </p><i class="ion-ios-arrow-right"></i> -->
<!--   </figcaption> -->
<!--   <a href="#"></a> -->
<!-- </figure> -->
<!-- </div> -->

<div style="clear: both;"></div>
<div class="clear"></div>
<div id="cut"><jsp:include page="../inc/bottom.jsp"/></div>
</div>
</body>
</html>