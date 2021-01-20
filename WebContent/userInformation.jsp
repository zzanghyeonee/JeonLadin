<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.UserDAO" %>    
<%@ page import="User.User" %>
<html>
<head>
    <title>현재 유저정보 출력화면</title>
    
    <style type="text/css">
        table {
	border: 3px solid #34495e; 
	width:666px
	}
	
	td,th{
	border:1px solid #34495e ; 
	text-align: center; 
	padding:5px
	}
	
	h2{
	text-align: center;
	}
	
	#btn{
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px; 
	border-bottom-right-radius: 5px;
	background-color: #34495e; 
	color: white;  
	padding: 5px;
	}
    </style>
    
    <script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="main.jsp";
            }else if(val == "0"){
                location.href="ModifyForm.jsp";
            }else if(val == "1"){
                location.href="DeleteForm.jsp";
            }
        }
        
    </script>
    
</head>
<body>
    <%
        String id = (String)session.getAttribute("userID");
        
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        UserDAO dao = UserDAO.getInstance();
        User memberBean = dao.getUserInfo(id);
    %>
 
        <br><br>
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table>
            <tr>
                <td id="title" style="color:white" bgcolor="#34495e">아이디</td>
                <td><%=memberBean.getUserID() %></td>
            </tr>
                        
            <tr>
                <td id="title" style="color:white" bgcolor="#34495e">비밀번호</td>
                <td><%=memberBean.getUserPassword() %></td>
            </tr>
                    
            <tr>
                <td id="title" style="color:white" bgcolor="#34495e">이름</td>
                <td><%=memberBean.getUserName() %></td>
            </tr>
                    
            <tr>
                <td id="title" style="color:white" bgcolor="#34495e">성별</td>
                <td><%=memberBean.getUserGender()%></td>
            </tr>
                    
            <tr>
                <td id="title" style="color:white" bgcolor="#34495e">이메일</td>
                <td>
                    <%=memberBean.getUserEmail() %>
                </td>
            </tr>
                    
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(0)">
        <input type="button" value="회원탈퇴" onclick="changeForm(1)">
</body>
</html>


