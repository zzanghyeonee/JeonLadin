<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.UserDAO" %>    
<%@ page import="User.User" %>
<html>
<head>
    <%
        String id = (String) session.getAttribute("userID");
    
        UserDAO dao = UserDAO.getInstance();
        User memberBean = dao.getUserInfo(id);
    %>
 
    <title>회원정보 수정화면</title>
    
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
    
        function init(){
            setComboValue("<%=memberBean.getUserEmail()%>");
        }
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('userEmail'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        
    </script>
    
</head>
<body onload="init()">
 
        <br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="ModifyAction.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="title" style="color:white" bgcolor="#34495e">아이디</td>
                    <td id="title"><%=memberBean.getUserID() %></td>
                </tr>
                <tr>
                    <td id="title" style="color:white" bgcolor="#34495e">비밀번호</td>
                    <td>
                        <input type="password" name="userPassword" maxlength="50" 
                            value="<%=memberBean.getUserPassword()%>">
                    </td>
                </tr>
                
                <tr>
                    <td id="title" style="color:white" bgcolor="#34495e">이름</td>
                    <td>
                    <%=memberBean.getUserName() %></td>
                </tr>
                    
                <tr>
                    <td id="title" style="color:white" bgcolor="#34495e">성별</td>
                    <td><%=memberBean.getUserGender()%></td>
                </tr>
                    
                <tr>
                    <td id="title" style="color:white" bgcolor="#34495e">이메일</td>
                    <td>
                        <input type="text" name="userEmail" maxlength="50" 
                            value="<%=memberBean.getUserEmail() %>">
                </tr>
            </table>
            <br><br>
            <input type="button" value="취소" onclick="location.href='userInformation.jsp'">
            <input type="submit" value="수정"/>  
        </form>
        
</body>
</html>
