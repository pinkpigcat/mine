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


<script type="text/javascript">
// JQuery로 회원가입창 제어\

	$(document).ready(function(){
// 		alert("D");
		$("#join").submit(function(){
		
		if($(".id").val()==""){
			alert("아이디 입력"); 
			$(".id").focus();
			return false;
		}
		

		if($(".pass").val()==""){
			alert("비밀번호 입력"); 
			$(".pass").focus();
			return false;
		}
		
		
		if($('.name').val()==""){
			alert("이름 입력하세요");
			$('.name').focus();
		}

		if($(".email").val()==""){
			alert("이메일 입력하세요"); 
			$(".email").focus();
			return false;
		}
		

		if($("#man_gen").is(":checked")==false && $("#woman_gen").is(":checked")==false){
			alert("성별 선택하세요"); 
			$("man_gen").focus();
			return false;
		}
		

		if($("#age").val()==""){
			alert("연령 선택하세요"); 
			$("#age").focus();
			return false;
		}
		
		
		
		});
		
		
	         });
	         
	
//자바스크립트로 제어	 아이디 중복체크창
// function winopen()	{
	

// 	if(document.join.id.value.length==0){ 

// 	alert("아이디 입력하세요"); 

// 	document.join.id.focus(); 
	
	
// 	}else{
// 		var id = document.join.id.value;
// 		window.open("idcheck.jsp?wid="+id,"","width=300,height=200");
// 	}
// }



//스프링을과 json을 이용한 중복체크

$(document).ready(function () {
	// .dup 아이디중복체크 를 클릭했을때  
	// 아이디 비어있으면 아이디 입력하세요 포커스  되돌아감
	// 아이디값을 가지고 idcheck2.jsp 가서  아이디 중복 체크를 해서  출력 결과를 가져오기  
	// div id="dupcheck" 덮어서 씀
	
		$('.dup').click(function() {
		if($('.id').val()==""){
			alert("아이디 입력하세요");
			$('.id').focus();
			return;
		}
		$.ajax('<c:url value="/member/idcheck"/>',{
			data:{id:$('.id').val()},
			success:function(d){
				if(d=="idok"){
					d="아이디 사용가능"
				}else{
					d="아이디 중복"
				}
				$('#dupcheck').html(d);
			}
		});
	});
	
});

//자바스크립트로 제어	
// function fun1() { 

	
// 	if(document.join.id.value.length==0){ 

// 	alert("아이디 입력하세요"); 

// 	// id 텍스트상자커서깜박 

// 	document.join.id.focus(); 

// 	return false; 

// 	} 
	
// 	if(document.join.id.value.length<6 || document.join.id.value.length>16){
// 		alert("아이디는 6자 이상 16자 미만으로 입력하세요"); 
// 		document.join.id.focus(); 
// 		return false; 
// 	}

	
// 	if (document.join.pass.value.length==0) {
// 		alert("비밀번호를 입력하세요")
// 		return false;
// 	}
	
	
	
// 	if (document.join.pass.value.length<6 || document.join.pass.value.length>16) {
// 		alert("비밀번호는 6자 이상 16자 미만으로 입력하세요")
// 		return false;
// 	}
	
	
	
// 	if (document.join.pass2.value!=document.join.pass.value) {
// 		alert("비밀번호 재확인을 정확히 입력하세요")
// 		return false;
// 	}
	
// 	if (document.join.name.value.length==0) {
// 		alert("이름을 입력하세요")
// 		return false;
// 	}
	
	
// 	if (document.join.email.value.length==0) {
// 		alert("이메일을 입력하세요")
// 		return false;
// 	}
	
// 	if (document.join.email2.value!=document.join.email.value) {
// 		alert("이메일 재확인을 정확히 입력하세요")
// 		return false;
// 	}
	

// 	if (document.join.address.value.length==0) {
// 		alert("주소를 입력하세요")
// 		return false;
// 	}
	

// 	if (document.join.phone.value.length==0) {
// 		alert("집전화번호를  입력하세요")
// 		return false;
// 	}
	
// 	if (document.join.mobile.value.length==0) {
// 		alert("핸드폰 번호를 입력하세요")
// 		return false;
// 	}
	
// 	if (document.join.mobile.value.length!=13) {
// 		alert(" - 포함 해서 입력하세요   ex) 010-1234-4578")
// 		return false;
// 	}
// }




</script>

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
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action='<c:url value="/member/insert2"/>' id="join" name="fr" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="dup. check" class="dup"><div id="dupcheck"></div><!-- onclick="winopen()" --><br>
<label>Password</label>
<input type="password" name="pass" class="pass" ><br>
<!-- <label>Retype Password</label> -->
<!-- <input type="password" name="pass2"><br> -->
<label>Name</label>
<input type="text" name="name" class="name"><br>
<label>E-Mail</label>
<input type="email" name="email" class="email"><br>
<!-- <label>Retype E-Mail</label> -->
<!-- <input type="email" name="email2"><br> -->
<label>성별 </label>
<input type="radio" name=gender value="man" id="man_gen">남자
<input type="radio" name=gender value="woman" id="woman_gen">여자<br>
<label>연령</label> 
<select name="age" id="age">
	<option value="">선택하세요</option>
	<option value="10">10대</option>
	<option value="20">20대</option>
	<option value="30">30대</option>
</select>


</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<jsp:include page="post.jsp" /><br><br>
<!-- <input type="text" name="address"><br> -->
<label>Phone Number</label>
<input type="text" name="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>

</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<footer>
<jsp:include page="../inc/bottom.jsp"/>
</footer>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>