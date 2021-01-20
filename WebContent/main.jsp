<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="User.UserDAO"%>
<%@ page import="User.User"%>
<%@ page import="User.JDBC_memberDAO" %>

<!doctype html>
<html lang="en">


<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <title>Main Page</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/heroic-features.css" rel="stylesheet">	
</head>

<style>
	#btn1{ 
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px; 
	margin-right:-4px;
	}
	
	#btn2{ 
	border-top-right-radius: 5px; 
	border-bottom-right-radius: 5px; 
	margin-left:-3px;
	}
	
	#btn_group button{ 
	border: 1px solid white; 
	background-color: white; 
	color: black; 
	padding: 6px; }
</style>


<body>
<%
	String userID = null;
	String userName = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		userName = (String) session.getAttribute("userName");
	}
	%>
	<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  	<div class="container">
   		<img src="icon.jpg"width="55" height="60" >
      	<a class="navbar-brand" href="main.jsp">전라딘</a>
      	<ul class="navbar-nav ml-auto ml-md-0"></ul>
       	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    		<div class="container">
   	  		<img src="icon.jpg"width="55" height="60" alt="전라딘" >
      		<a class="navbar-brand" href="main.jsp" style="font-size:3.5em; color:white;">전라딘</a>
      		<ul class="navbar-nav ml-auto ml-md-0">
      		<%
				if (userID == null) {
			%>
    			<div id="btn_group">
					<button id="btn1"onclick="location.href='LoginForm.jsp'">로그인</button>
					<button id="btn2"onclick="location.href='join.jsp'">회원가입</button>
				</div>
				<%
			} else {
		        String id = (String)session.getAttribute("userID");        
		        // 세션에 저장된 아이디를 가져와서
		        // 그 아이디 해당하는 회원정보를 가져온다.
		        UserDAO dao = UserDAO.getInstance();
		        User memberBean = dao.getUserInfo(id);
		        userName = memberBean.getUserName();
		%>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="logoutAction.jsp">로그아웃</a></li>
			<li><a href="userInformation.jsp">내정보관리</a></li>
			<li><a href="MemberForm.html">도서등록</a></li>
			<li><a href="memberSelect.jsp">도서목록</a></li>
			<li><a href="mybook.jsp?userName=<%= userName%>">작성한글</a></li>
		</ul>  
		<%
			}
		%>	     
    		</ul>     
    		</div>    
  		</nav>
    </div>
  </nav>
  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1 class="display-3">전라딘!</h1>  
     <p class="background">이 홈페이지는 전북대학교 내의 중고 도서를 거래하기 위해 개설된 홈페이지입니다.</p>
     <p class="backgroundd"></p>
     
    </header>

    <!-- Page Features -->
    <div class="row text-center">

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">  
          <button type="button" onclick="location.href='memberSelect.jsp'"><img src="Board.jpg" alt=""></button>
          <div class="card-body">
            <h4 class="card-title">게시판</h4>
            <p class="card-text">책이 등록된 게시판</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
           <button type="button" onclick="location.href='MemberForm.html'"><img src="Write.jpg" alt=""></button>
          <div class="card-body">
            <h4 class="card-title">글쓰기</h4>
            <p class="card-text">자신이 판매할 중고 서적을 등록</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
           <button type="button" onclick="location.href='mybook.jsp?userName=<%= userName%>'"><img src="Mywrite.jpg" alt=""></button>
           <div class="card-body">
            <h4 class="card-title">내가 쓴 글</h4>
            <p class="card-text">자신이 작성한 글 목록</p>
          </div>

        </div>
      </div>
	
	<div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
           <button type="button"><img src="QnA.jpg" alt=""></button>
           <div class="card-body">
            <h4 class="card-title">QnA</h4>
            <p class="card-text">홈페이지 관리자에게 문의할 내용 혹은 신고글을 작성하는 게시판</p>
          </div>

        </div>
      </div>


    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">(주)전라딘 커뮤니케이션<br>팀장:&nbsp;박재혁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객정보 보호 책임자:&nbsp;2조 <br>
	사업자등록:&nbsp;아직 안함<br>
	호스팅 제공자:&nbsp;전라딘&nbsp;커뮤니케이션<br>
  	일반문의(발신자 부담):&nbsp;2015-2015</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>